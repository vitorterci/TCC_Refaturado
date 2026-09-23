<?php
require_once __DIR__ . '/../../_tcc_catalogo.php';

$filtros = [
    'id' => filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT) ?: null,
    'slug' => trim((string)($_GET['slug'] ?? '')),
    'busca' => trim((string)($_GET['busca'] ?? '')),
    'ofertas' => isset($_GET['ofertas']) && $_GET['ofertas'] !== '0',
];
$jogos = tcc_catalogo_buscar('SteamFake', $filtros);
if ($filtros['id'] || $filtros['slug']) {
    if (!$jogos) { http_response_code(404); }
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($jogos ? $jogos[0] : ['sucesso' => false, 'mensagem' => 'Jogo não encontrado.'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}
header('Content-Type: application/json; charset=utf-8');
echo json_encode($jogos, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
?>
