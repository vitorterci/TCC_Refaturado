<?php
/**
 * Persistência local da EpicFake.
 * Usa o banco específico da loja e cria somente a tabela específica do módulo.
 * Não há chamadas externas nem scraping.
 */

const EPICFAKE_DB_HOST = 'localhost';
const EPICFAKE_DB_USER = 'root';
const EPICFAKE_DB_PASS = '';
const EPICFAKE_DB_NAME = 'fake_epic';

mysqli_report(MYSQLI_REPORT_OFF);
$conexao = @new mysqli(EPICFAKE_DB_HOST, EPICFAKE_DB_USER, EPICFAKE_DB_PASS, EPICFAKE_DB_NAME);
if (!$conexao || $conexao->connect_errno) {
    $conexao = null;
} else {
    $conexao->set_charset('utf8mb4');
}

require_once __DIR__ . '/_epicfake_dados.php';

function epicfakeGarantirEstrutura($conexao): void
{
    $sqlite = class_exists('SQLiteMysqliCompat', false) && $conexao instanceof SQLiteMysqliCompat;

    if ($sqlite) {
        $conexao->query("CREATE TABLE IF NOT EXISTS epicfake_jogos (
            id INTEGER PRIMARY KEY,
            slug TEXT NOT NULL UNIQUE,
            nome TEXT NOT NULL,
            descricao TEXT NOT NULL,
            plataforma TEXT NOT NULL,
            genero TEXT NOT NULL,
            avaliacao REAL NOT NULL DEFAULT 0,
            preco_original REAL NOT NULL DEFAULT 0,
            preco_atual REAL NOT NULL DEFAULT 0,
            desconto INTEGER NOT NULL DEFAULT 0,
            imagem TEXT NOT NULL,
            categoria TEXT NOT NULL DEFAULT 'popular',
            gratuito INTEGER NOT NULL DEFAULT 0,
            lancamento INTEGER NOT NULL DEFAULT 0,
            popularidade INTEGER NOT NULL DEFAULT 0,
            desenvolvedora TEXT NOT NULL,
            tamanho TEXT NOT NULL,
            classificacao TEXT NOT NULL
        )");
        $sqlJogo = "INSERT OR REPLACE INTO epicfake_jogos
            (id, slug, nome, descricao, plataforma, genero, avaliacao, preco_original, preco_atual, desconto, imagem, categoria, gratuito, lancamento, popularidade, desenvolvedora, tamanho, classificacao)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    } else {
        $conexao->query("CREATE TABLE IF NOT EXISTS epicfake_jogos (
            id INT NOT NULL PRIMARY KEY,
            slug VARCHAR(150) NOT NULL UNIQUE,
            nome VARCHAR(180) NOT NULL,
            descricao TEXT NOT NULL,
            plataforma VARCHAR(100) NOT NULL,
            genero VARCHAR(100) NOT NULL,
            avaliacao DECIMAL(3,1) NOT NULL DEFAULT 0,
            preco_original DECIMAL(10,2) NOT NULL DEFAULT 0,
            preco_atual DECIMAL(10,2) NOT NULL DEFAULT 0,
            desconto INT NOT NULL DEFAULT 0,
            imagem VARCHAR(255) NOT NULL,
            categoria VARCHAR(30) NOT NULL DEFAULT 'popular',
            gratuito TINYINT(1) NOT NULL DEFAULT 0,
            lancamento TINYINT(1) NOT NULL DEFAULT 0,
            popularidade INT NOT NULL DEFAULT 0,
            desenvolvedora VARCHAR(180) NOT NULL,
            tamanho VARCHAR(30) NOT NULL,
            classificacao VARCHAR(30) NOT NULL
        )");
        $sqlJogo = "INSERT INTO epicfake_jogos
            (id, slug, nome, descricao, plataforma, genero, avaliacao, preco_original, preco_atual, desconto, imagem, categoria, gratuito, lancamento, popularidade, desenvolvedora, tamanho, classificacao)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ON DUPLICATE KEY UPDATE
            slug = VALUES(slug), nome = VALUES(nome), descricao = VALUES(descricao), plataforma = VALUES(plataforma), genero = VALUES(genero), avaliacao = VALUES(avaliacao), preco_original = VALUES(preco_original), preco_atual = VALUES(preco_atual), desconto = VALUES(desconto), imagem = VALUES(imagem), categoria = VALUES(categoria), gratuito = VALUES(gratuito), lancamento = VALUES(lancamento), popularidade = VALUES(popularidade), desenvolvedora = VALUES(desenvolvedora), tamanho = VALUES(tamanho), classificacao = VALUES(classificacao)";
    }

    $resultado = $conexao->query('SELECT COUNT(*) AS total FROM epicfake_jogos');
    $linha = $resultado ? $resultado->fetch_assoc() : null;
    if ((int)($linha['total'] ?? 0) >= count(epicfakeCatalogo())) {
        return;
    }

    foreach (epicfakeCatalogo() as $jogo) {
        $stmtJogo = $conexao->prepare($sqlJogo);
        if (!$stmtJogo) {
            continue;
        }
        $imagem = 'epicfake/' . ltrim($jogo['imagem'], '/');
        $stmtJogo->bind_param(
            'isssssdddissiiisss',
            $jogo['id'], $jogo['slug'], $jogo['nome'], $jogo['descricao'],
            $jogo['plataforma'], $jogo['genero'], $jogo['avaliacao'],
            $jogo['preco_original'], $jogo['preco_atual'], $jogo['desconto'],
            $imagem, $jogo['categoria'], $jogo['gratuito'], $jogo['lancamento'],
            $jogo['popularidade'], $jogo['desenvolvedora'], $jogo['tamanho'], $jogo['classificacao']
        );
        $stmtJogo->execute();
        $stmtJogo->close();
    }
}

function epicfakeImagemPublica(string $imagem): string
{
    return strpos($imagem, 'epicfake/') === 0 ? $imagem : 'epicfake/' . ltrim($imagem, '/');
}

function epicfakeFormatarJogo(array $jogo): array
{
    $jogo['id'] = (int)$jogo['id'];
    $jogo['avaliacao'] = (float)$jogo['avaliacao'];
    $jogo['preco_original'] = (float)$jogo['preco_original'];
    $jogo['preco_atual'] = (float)$jogo['preco_atual'];
    $jogo['desconto'] = (int)$jogo['desconto'];
    $jogo['gratuito'] = (int)$jogo['gratuito'];
    $jogo['lancamento'] = (int)$jogo['lancamento'];
    $jogo['popularidade'] = (int)$jogo['popularidade'];
    $jogo['imagem'] = epicfakeImagemPublica((string)$jogo['imagem']);
    $jogo['loja'] = 'EpicFake';
    return $jogo;
}

function epicfakeBuscarJogoBanco($conexao, string $identificador): ?array
{
    $identificador = trim($identificador);
    if ($identificador === '') {
        return null;
    }

    $stmt = $conexao->prepare('SELECT * FROM epicfake_jogos WHERE id = ? OR slug = ? LIMIT 1');
    if (!$stmt) {
        return null;
    }
    $stmt->bind_param('is', $identificador, $identificador);
    if (!$stmt->execute()) {
        $stmt->close();
        return null;
    }
    $resultado = $stmt->get_result();
    $jogo = $resultado ? $resultado->fetch_assoc() : null;
    $stmt->close();
    return $jogo ? epicfakeFormatarJogo($jogo) : null;
}

function epicfakeRespostaJson(array $dados, int $status = 200): void
{
    http_response_code($status);
    echo json_encode($dados, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRESERVE_ZERO_FRACTION);
    exit;
}

if (!isset($conexao) || !$conexao) {
    epicfakeRespostaJson(['success' => false, 'loja' => 'EpicFake', 'message' => 'Não foi possível conectar ao banco local.'], 500);
}

epicfakeGarantirEstrutura($conexao);
?>
