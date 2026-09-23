<?php
declare(strict_types=1);

require_once __DIR__ . '/config.php';

if (!headers_sent()) {
    header('Content-Type: application/json; charset=utf-8');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, OPTIONS');
}

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit;
}

function gogfake_parametro(string $nome): string {
    return trim((string)($_GET[$nome] ?? ''));
}

function gogfake_saida(array $dados, int $status = 200): never {
    http_response_code($status);
    echo json_encode($dados, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function gogfake_buscar(PDO|mysqli|object $conexao, string $sql, string $tipos = '', array $params = []): array {
    if ($conexao instanceof mysqli) {
        $stmt = $conexao->prepare($sql);
        if (!$stmt) {
            gogfake_saida(['success' => false, 'message' => 'Não foi possível preparar a consulta.'], 500);
        }
        if ($tipos !== '') {
            $stmt->bind_param($tipos, ...$params);
        }
        if (!$stmt->execute()) {
            $stmt->close();
            gogfake_saida(['success' => false, 'message' => 'Não foi possível executar a consulta.'], 500);
        }
        $resultado = $stmt->get_result();
        $linhas = [];
        if ($resultado) {
            if (method_exists($resultado, 'fetch_all')) {
                $linhas = $resultado->fetch_all(MYSQLI_ASSOC);
            } else {
                while ($linha = $resultado->fetch_assoc()) $linhas[] = $linha;
            }
        }
        $stmt->close();
        return $linhas;
    }

    $stmt = $conexao->prepare($sql);
    if (!$stmt) {
        gogfake_saida(['success' => false, 'message' => 'Não foi possível preparar a consulta.'], 500);
    }
    $stmt->execute($params);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function gogfake_filtro_sql(string $campo, string $valor, array &$tipos, array &$params): string {
    if ($valor === '') return '';
    $tipos[] = 's';
    $params[] = $valor;
    return " AND {$campo} = ?";
}
?>
