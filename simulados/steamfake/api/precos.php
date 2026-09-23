<?php
require_once __DIR__ . '/../../_tcc_catalogo.php';
$filtros = [
    'id' => filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT) ?: null,
    'slug' => trim((string)($_GET['slug'] ?? '')),
    'busca' => trim((string)($_GET['busca'] ?? '')),
    'ofertas' => true,
];
$jogos = tcc_catalogo_buscar('SteamFake', $filtros);
$precos = array_map(static function (array $jogo): array {
    return [
        'id' => $jogo['id'], 'nome' => $jogo['nome'], 'slug' => $jogo['slug'],
        'imagem' => $jogo['imagem'], 'plataforma' => $jogo['plataforma'],
        'preco_original' => $jogo['preco_original'], 'preco_atual' => $jogo['preco_atual'],
        'desconto' => $jogo['desconto'], 'loja' => 'SteamFake',
        'url' => 'produto.php?slug=' . rawurlencode($jogo['slug']),
        'status_promocao' => $jogo['promocao_status'],
    ];
}, $jogos);
header('Content-Type: application/json; charset=utf-8');
if (($filtros['id'] || $filtros['slug']) && !$precos) { http_response_code(404); echo json_encode(['sucesso'=>false, 'mensagem'=>'Preço não encontrado.']); exit; }
echo json_encode($precos, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
?>
