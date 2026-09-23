<?php
declare(strict_types=1);
require_once __DIR__ . '/../../_tcc_catalogo.php';
$identificador = trim((string)($_GET['jogo'] ?? $_GET['slug'] ?? $_GET['id'] ?? ''));
if ($identificador === '') { http_response_code(400); echo json_encode(['success'=>false, 'loja'=>'GOGFake', 'message'=>'Informe jogo, slug ou id.']); exit; }
$filtros = ctype_digit($identificador) ? ['id'=>(int)$identificador] : ['slug'=>$identificador];
$jogos = tcc_catalogo_buscar('GOGFake', $filtros);
header('Content-Type: application/json; charset=utf-8');
if (!$jogos) { http_response_code(404); echo json_encode(['success'=>false, 'loja'=>'GOGFake', 'message'=>'Jogo não encontrado na GOGFake.']); exit; }
$jogo = $jogos[0];
$jogo['url'] = 'detalhes.php?slug=' . rawurlencode($jogo['slug']);
echo json_encode(array_merge(['success'=>true, 'loja'=>'GOGFake'], $jogo), JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
?>
