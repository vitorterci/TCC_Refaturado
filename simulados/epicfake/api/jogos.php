<?php
require_once __DIR__ . '/../../_tcc_catalogo.php';
$identificador = trim((string)($_GET['slug'] ?? $_GET['id'] ?? $_GET['jogo'] ?? ''));
if ($identificador !== '') {
    $filtros = ctype_digit($identificador) ? ['id'=>(int)$identificador] : ['slug'=>$identificador];
    $jogos = tcc_catalogo_buscar('EpicFake', $filtros);
    if (!$jogos) { http_response_code(404); echo json_encode(['success'=>false, 'loja'=>'EpicFake', 'message'=>'Jogo não encontrado.']); exit; }
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['success'=>true, 'loja'=>'EpicFake', 'jogo'=>$jogos[0]], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); exit;
}
$filtros = ['busca'=>trim((string)($_GET['busca'] ?? $_GET['q'] ?? ''))];
$jogos = tcc_catalogo_buscar('EpicFake', $filtros);
header('Content-Type: application/json; charset=utf-8');
echo json_encode(['success'=>true, 'loja'=>'EpicFake', 'total'=>count($jogos), 'jogos'=>$jogos], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
?>
