<?php
declare(strict_types=1);
require_once __DIR__ . '/../../_tcc_catalogo.php';
$busca = trim((string)($_GET['busca'] ?? ''));
$slug = trim((string)($_GET['slug'] ?? ''));
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT) ?: null;
$genero = trim((string)($_GET['genero'] ?? ''));
$ordem = trim((string)($_GET['ordem'] ?? ''));
$precoMaximo = (float)($_GET['preco'] ?? 0);
$limite = min(100, max(1, (int)($_GET['limite'] ?? 30)));
$filtros = ['busca' => $busca, 'slug' => $slug, 'id' => $id, 'ofertas' => false];
$jogos = tcc_catalogo_buscar('GOGFake', $filtros);
if ($genero !== '') $jogos = array_values(array_filter($jogos, static fn(array $jogo): bool => $jogo['genero'] === $genero));
if ($precoMaximo > 0) $jogos = array_values(array_filter($jogos, static fn(array $jogo): bool => (float)$jogo['preco_atual'] <= $precoMaximo));
usort($jogos, static function (array $a, array $b) use ($ordem): int {
    if ($ordem === 'nome') return strcasecmp((string)$a['nome'], (string)$b['nome']);
    if ($ordem === 'maior-desconto') return (int)$b['desconto'] <=> (int)$a['desconto'] ?: (float)$a['preco_atual'] <=> (float)$b['preco_atual'];
    return (float)$a['preco_atual'] <=> (float)$b['preco_atual'];
});
$jogos = array_slice($jogos, 0, $limite);
foreach ($jogos as &$jogo) { $jogo['url'] = 'detalhes.php?slug=' . rawurlencode($jogo['slug']); }
unset($jogo);
header('Content-Type: application/json; charset=utf-8');
if ($slug !== '' || $id) {
    if (!$jogos) { http_response_code(404); echo json_encode(['success'=>false, 'message'=>'Jogo não encontrado.']); exit; }
    echo json_encode(['success'=>true, 'loja'=>'GOGFake', 'jogo'=>$jogos[0]], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); exit;
}
echo json_encode(['success'=>true, 'loja'=>'GOGFake', 'total'=>count($jogos), 'jogos'=>$jogos], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
?>
