<?php
declare(strict_types=1);
require_once __DIR__ . '/_gogfake.php';

$jogo = gogfake_parametro('jogo');
if ($jogo === '') $jogo = gogfake_parametro('slug');
if ($jogo === '') $jogo = gogfake_parametro('id');

if ($jogo === '') {
    gogfake_saida(['success' => false, 'loja' => 'GOGFake', 'message' => 'Informe jogo, slug ou id.'], 400);
}

if (ctype_digit($jogo)) {
    $linhas = gogfake_buscar($conexao, 'SELECT id, jogo_id, nome, slug, plataforma, preco_original, preco_atual, desconto, imagem, url, loja, genero, descricao, avaliacao, data_atualizacao FROM gogfake_precos WHERE loja = \'GOGFake\' AND jogo_id = ? LIMIT 1', 'i', [(int)$jogo]);
} else {
    $linhas = gogfake_buscar($conexao, 'SELECT id, jogo_id, nome, slug, plataforma, preco_original, preco_atual, desconto, imagem, url, loja, genero, descricao, avaliacao, data_atualizacao FROM gogfake_precos WHERE loja = \'GOGFake\' AND (slug = ? OR nome = ? OR nome LIKE ?) LIMIT 1', 'sss', [$jogo, $jogo, "%{$jogo}%"]);
}

if (!$linhas) {
    gogfake_saida(['success' => false, 'loja' => 'GOGFake', 'message' => 'Jogo não encontrado na GOGFake.'], 404);
}

$linha = $linhas[0];
$linha['id'] = (int)$linha['id'];
$linha['jogo_id'] = (int)$linha['jogo_id'];
$linha['preco_original'] = (float)$linha['preco_original'];
$linha['preco_atual'] = (float)$linha['preco_atual'];
$linha['desconto'] = (int)$linha['desconto'];
$linha['avaliacao'] = (float)$linha['avaliacao'];

// Mantém os campos no nível superior para integração direta com comparadores de preços.
gogfake_saida(array_merge(['success' => true], $linha));
