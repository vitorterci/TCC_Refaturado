<?php
require_once __DIR__ . '/../../_tcc_catalogo.php';
$identificador = trim((string)($_GET['slug'] ?? $_GET['id'] ?? $_GET['jogo'] ?? ''));
$filtros = $identificador === '' ? [] : (ctype_digit($identificador) ? ['id'=>(int)$identificador] : ['slug'=>$identificador]);
$jogos = tcc_catalogo_buscar('EpicFake', $filtros);
$precos = array_map(static fn(array $jogo): array => [
    'id'=>$jogo['id'], 'nome'=>$jogo['nome'], 'slug'=>$jogo['slug'], 'imagem'=>$jogo['imagem'],
    'plataforma'=>$jogo['plataforma'], 'preco_original'=>$jogo['preco_original'],
    'preco_atual'=>$jogo['preco_atual'], 'desconto'=>$jogo['desconto'], 'moeda'=>'BRL',
    'url_oferta'=>'jogo.php?slug=' . rawurlencode($jogo['slug'])
], $jogos);
header('Content-Type: application/json; charset=utf-8');
if ($identificador !== '' && !$precos) { http_response_code(404); echo json_encode(['success'=>false, 'loja'=>'EpicFake', 'message'=>'Jogo não encontrado.']); exit; }
echo json_encode(['success'=>true, 'loja'=>'EpicFake', 'total'=>count($precos), 'precos'=>$precos], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
?>
