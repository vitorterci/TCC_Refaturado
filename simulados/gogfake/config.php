<?php
/**
 * Configuração centralizada do banco de dados (MySQL com fallback para SQLite)
 * Projeto: TCC (Game Search)
 * Linguagem: Português do Brasil (PT-BR)
 */

if (!isset($_SERVER['REQUEST_METHOD'])) {
    $_SERVER['REQUEST_METHOD'] = 'GET';
}

// Configurações de CORS e cabeçalhos globais
if (!headers_sent()) {
    header('Content-Type: application/json; charset=utf-8');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
    header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');
}

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit;
}

// Configurações do MySQL
$dbHost = 'localhost';
$dbUsername = 'root';
$dbPassword = '';
$dbName = 'fake_gog';

$conexao = null;
try {
    mysqli_report(MYSQLI_REPORT_OFF);
    $conexao = @new mysqli($dbHost, $dbUsername, $dbPassword, $dbName);
} catch (Exception $e) {
    $conexao = null;
}

if (!$conexao || $conexao->connect_error) {
    // Fallback para SQLite caso o MySQL não esteja rodando (ótimo para testes locais rápidos)
    $sqlitePath = __DIR__ . '/../database.sqlite';
    class SQLiteMysqliCompat {
        private $pdo;
        public $connect_error = null;
        public $insert_id = 0;

        public function __construct($path) {
            try {
                $this->pdo = new PDO('sqlite:' . $path);
                $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $this->criarTabelaSeNaoExistir();
            } catch (Exception $e) {
                $this->connect_error = $e->getMessage();
            }
        }

        private function criarTabelaSeNaoExistir() {
            $this->pdo->exec("CREATE TABLE IF NOT EXISTS jogos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                slug TEXT UNIQUE,
                nome TEXT NOT NULL,
                descricao TEXT NOT NULL,
                preco REAL DEFAULT 0.0,
                img TEXT,
                categoria TEXT,
                plataforma TEXT,
                genero TEXT,
                etaria TEXT,
                ano INTEGER,
                status TEXT,
                avaliacao_gameplay REAL,
                avaliacao_graficos REAL,
                avaliacao_historia REAL,
                desconto REAL,
                data_lancamento TEXT,
                data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
                data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP
            )");

            $this->pdo->exec("CREATE TABLE IF NOT EXISTS precos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                jogo_id INTEGER NOT NULL,
                loja TEXT NOT NULL,
                plataforma TEXT NOT NULL DEFAULT 'PC',
                precos REAL NOT NULL,
                precos_antigo REAL,
                desconto_percentual REAL DEFAULT 0,
                moeda TEXT NOT NULL DEFAULT 'BRL',
                url_oferta TEXT NOT NULL,
                titulo_oferta TEXT NOT NULL,
                disponivel INTEGER NOT NULL DEFAULT 1,
                produto_id TEXT,
                fonte TEXT,
                data_coleta DATETIME DEFAULT CURRENT_TIMESTAMP,
                FOREIGN KEY (jogo_id) REFERENCES jogos(id)
            )");

            // Inserir dados de exemplo se estiver vazia
            $stmt = $this->pdo->query("SELECT COUNT(*) FROM jogos");
            if ($stmt->fetchColumn() == 0) {
                $this->pdo->exec("INSERT INTO jogos (id, slug, nome, descricao, preco, img, categoria, plataforma, genero, etaria, ano, status, avaliacao_gameplay, avaliacao_graficos, avaliacao_historia) VALUES
                (1, 'cyber-nexus-2077', 'Cyber Nexus 2077', 'Cyber Nexus 2077 é um RPG de ação e aventura em mundo aberto ambientado na megalópole futurista de Neo Tokyo.', 199.90, '../assets/img/andrey.png', 'rpg', 'PC / PS5 / Xbox', 'Ação / Sci-Fi', '18', 2024, 'disponivel', 9.2, 9.5, 8.8),
                (2, 'gnomo-quest', 'Gnome Quest: Aventura na Floresta', 'Uma jornada encantadora pelos bosques mágicos do reino dos gnomos.', 89.90, '../assets/img/gnomo.png', 'aventura', 'PC / Switch', 'Plataforma / Puzzle', 'L', 2023, 'disponivel', 8.5, 8.0, 9.0),
                (3, 'pixel-legends', 'Pixel Legends Arena', 'Batalhas épicas em arenas clássicas no estilo pixel art.', 49.90, '../assets/img/paulo.png', 'ação', 'PC / Mobile', 'Arcade / Luta', '10', 2024, 'disponivel', 9.0, 7.8, 7.5)");
            }
        }

        public function set_charset($charset) { return true; }

        public function query($sql) {
            try {
                $stmt = $this->pdo->query($sql);
                return new SQLiteResultCompat($stmt);
            } catch (Exception $e) {
                return false;
            }
        }

        public function prepare($sql) {
            return new SQLiteStmtCompat($this->pdo, $sql, $this);
        }

        public function close() {}
    }

    class SQLiteResultCompat {
        private $stmt;
        public $num_rows = 0;
        public function __construct($stmt) {
            $this->stmt = $stmt;
            if ($stmt) {
                $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
                $this->num_rows = count($rows);
                $this->rows = $rows;
                $this->pointer = 0;
            }
        }
        private $rows = [];
        private $pointer = 0;

        public function fetch_assoc() {
            if ($this->pointer < count($this->rows)) {
                return $this->rows[$this->pointer++];
            }
            return null;
        }
    }

    class SQLiteStmtCompat {
        private $pdo;
        private $sql;
        private $stmt;
        private $params = [];
        private $parent;
        public $error = '';

        public function __construct($pdo, $sql, $parent) {
            $this->pdo = $pdo;
            $this->sql = $sql;
            $this->parent = $parent;
        }

        public function bind_param($types, ...$vars) {
            $this->params = $vars;
        }

        public function execute() {
            try {
                $this->stmt = $this->pdo->prepare($this->sql);
                $this->stmt->execute($this->params);
                $this->parent->insert_id = $this->pdo->lastInsertId();
                return true;
            } catch (Exception $e) {
                $this->error = $e->getMessage();
                return false;
            }
        }

        public function get_result() {
            $rows = $this->stmt->fetchAll(PDO::FETCH_ASSOC);
            return new SQLiteResultCompatFromArray($rows);
        }

        public function close() {}
    }

    class SQLiteResultCompatFromArray {
        private $rows = [];
        private $pointer = 0;
        public $num_rows = 0;

        public function __construct($rows) {
            $this->rows = $rows;
            $this->num_rows = count($rows);
        }

        public function fetch_assoc() {
            if ($this->pointer < count($this->rows)) {
                return $this->rows[$this->pointer++];
            }
            return null;
        }
    }

    $conexao = new SQLiteMysqliCompat($sqlitePath);
} else {
    $conexao->set_charset("utf8mb4");

    // O GOGFake possui uma tabela própria no banco fake_gog.
    $tabela = $conexao->query("SHOW TABLES LIKE 'gogfake_precos'");
    if ($tabela && $tabela->num_rows === 0) {
        $arquivoSchema = __DIR__ . '/database/gogfake.sql';
        if (is_file($arquivoSchema)) {
            $schema = file_get_contents($arquivoSchema);
            if ($schema !== false && $conexao->multi_query($schema)) {
                do {
                    $resultadoSchema = $conexao->store_result();
                    if ($resultadoSchema instanceof mysqli_result) {
                        $resultadoSchema->free();
                    }
                } while ($conexao->more_results() && $conexao->next_result());
            }
        }
    }
}

/**
 * Função utilitária para executar consultas preparadas com segurança
 */
function executarConsulta($conexao, $sql, $tipos = '', $params = []) {
    $stmt = $conexao->prepare($sql);
    if (!$stmt) {
        return ['success' => false, 'message' => 'Erro na preparação da consulta'];
    }
    if (!empty($tipos) && !empty($params)) {
        $stmt->bind_param($tipos, ...$params);
    }
    if (!$stmt->execute()) {
        return ['success' => false, 'message' => 'Erro na execução da consulta'];
    }
    return ['success' => true, 'stmt' => $stmt];
}

/**
 * Padroniza os formatos aceitos para a classificação etária dos jogos.
 */
function normalizarEtaria($valor) {
    $texto = strtolower(trim((string)($valor ?? '')));
    $texto = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $texto) ?: $texto;

    if ($texto === '') {
        return 'N/I';
    }

    if ($texto === 'l' || $texto === '0' || strpos($texto, 'livre') !== false) {
        return 'L';
    }

    if (preg_match('/(?:^|[^0-9])(10|12|14|16|18)(?:[^0-9]|$)/', $texto, $correspondencia)) {
        return $correspondencia[1];
    }

    return 'N/I';
}
?>
