<?php
const STEAMFAKE_DB_HOST = 'localhost';
const STEAMFAKE_DB_USER = 'root';
const STEAMFAKE_DB_PASS = '';
const STEAMFAKE_DB_NAME = 'fake_steam';

require_once __DIR__ . '/../data/jogos.php';

function steamfake_db(): ?mysqli
{
    mysqli_report(MYSQLI_REPORT_OFF);
    $db = @new mysqli(STEAMFAKE_DB_HOST, STEAMFAKE_DB_USER, STEAMFAKE_DB_PASS, STEAMFAKE_DB_NAME);
    if ($db->connect_errno) return null;
    $db->set_charset('utf8mb4');
    steamfake_garantir_schema($db);
    return $db;
}

function steamfake_garantir_schema(mysqli $db): void
{
    $tabela = $db->query("SHOW TABLES LIKE 'steamfake_jogos'");
    if (!$tabela) {
        return;
    }

    if ($tabela->num_rows > 0) {
        steamfake_sincronizar_catalogo($db);
        return;
    }

    $arquivoSchema = __DIR__ . '/../database/steamfake.sql';
    if (!is_file($arquivoSchema)) {
        return;
    }

    $schema = file_get_contents($arquivoSchema);
    if ($schema === false || !$db->multi_query($schema)) {
        return;
    }

    do {
        $resultadoSchema = $db->store_result();
        if ($resultadoSchema instanceof mysqli_result) {
            $resultadoSchema->free();
        }
    } while ($db->more_results() && $db->next_result());
}

function steamfake_sincronizar_catalogo(mysqli $db): void
{
    $sql = 'INSERT IGNORE INTO steamfake_jogos
        (id, nome, slug, descricao, imagem, plataforma, genero, avaliacao,
         preco_original, preco_atual, desconto, promocao_status)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    $stmt = $db->prepare($sql);
    if (!$stmt) return;

    foreach (steamfake_catalogo() as $jogo) {
        $id = (int)$jogo['id'];
        $nome = (string)$jogo['nome'];
        $slug = (string)$jogo['slug'];
        $descricao = (string)$jogo['descricao'];
        $imagem = (string)$jogo['imagem'];
        $plataforma = (string)$jogo['plataforma'];
        $genero = (string)$jogo['genero'];
        $avaliacao = (float)$jogo['avaliacao'];
        $precoOriginal = (float)$jogo['preco_original'];
        $precoAtual = (float)$jogo['preco_atual'];
        $desconto = (float)$jogo['desconto'];
        $promocaoStatus = (string)$jogo['promocao_status'];

        $stmt->bind_param(
            'issssssdddds',
            $id,
            $nome,
            $slug,
            $descricao,
            $imagem,
            $plataforma,
            $genero,
            $avaliacao,
            $precoOriginal,
            $precoAtual,
            $desconto,
            $promocaoStatus
        );
        $stmt->execute();
    }

    $stmt->close();
}

function steamfake_json(mixed $payload, int $status = 200): never
{
    http_response_code($status);
    header('Content-Type: application/json; charset=utf-8');
    header('Access-Control-Allow-Origin: *');
    echo json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function steamfake_ler_mysql(?mysqli $db, array $filtros = []): ?array
{
    if (!$db) return null;
    $sql = 'SELECT id, nome, slug, descricao, imagem, plataforma, genero, avaliacao, preco_original, preco_atual, desconto, promocao_status FROM steamfake_jogos WHERE 1=1';
    $tipos = '';
    $valores = [];
    if (!empty($filtros['slug'])) { $sql .= ' AND slug = ?'; $tipos .= 's'; $valores[] = $filtros['slug']; }
    if (!empty($filtros['id'])) { $sql .= ' AND id = ?'; $tipos .= 'i'; $valores[] = (int)$filtros['id']; }
    if (!empty($filtros['busca'])) { $sql .= ' AND (nome LIKE ? OR genero LIKE ?)'; $tipos .= 'ss'; $like = '%'.$filtros['busca'].'%'; $valores[] = $like; $valores[] = $like; }
    if (!empty($filtros['ofertas'])) $sql .= ' AND desconto > 0';
    $sql .= ' ORDER BY id ASC';
    $stmt = $db->prepare($sql);
    if (!$stmt) return null;
    if ($tipos) $stmt->bind_param($tipos, ...$valores);
    if (!$stmt->execute()) return null;
    $resultado = $stmt->get_result();
    $jogos = [];
    while ($row = $resultado->fetch_assoc()) $jogos[] = steamfake_enriquecer($row);
    $stmt->close();
    return $jogos;
}
