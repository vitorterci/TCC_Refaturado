<?php
declare(strict_types=1);
require_once __DIR__ . '/_gogfake.php';

$busca = gogfake_parametro('busca');
$genero = gogfake_parametro('genero');
$ordem = gogfake_parametro('ordem');
$destaque = gogfake_parametro('destaque');
$precoMaximo = (float)($_GET['preco'] ?? 0);
$limite = min(100, max(1, (int)($_GET['limite'] ?? 30)));

$tipos = [];
$params = [];
$where = ' WHERE loja = \'GOGFake\'';
if ($busca !== '') {
    if (ctype_digit($busca)) {
        $where .= ' AND (jogo_id = ? OR nome LIKE ?)';
        $tipos = ['i', 's'];
        $params = [(int)$busca, "%{$busca}%"];
    } else {
        $where .= ' AND (slug = ? OR nome LIKE ?)';
        $tipos = ['s', 's'];
        $params = [$busca, "%{$busca}%"];
    }
}
$where .= gogfake_filtro_sql('genero', $genero, $tipos, $params);
$where .= gogfake_filtro_sql('destaque', $destaque, $tipos, $params);
if ($precoMaximo > 0) {
    $where .= ' AND preco_atual <= ?';
    $tipos[] = 'd';
    $params[] = $precoMaximo;
}
$orderBy = $ordem === 'nome' ? 'nome ASC' : ($ordem === 'maior-desconto' ? 'desconto DESC, preco_atual ASC' : 'preco_atual ASC');

$sql = "SELECT id, jogo_id, nome, slug, plataforma, preco_original, preco_atual, desconto, imagem, url, loja, genero, descricao, avaliacao, destaque, data_atualizacao FROM gogfake_precos{$where} ORDER BY {$orderBy} LIMIT {$limite}";
$linhas = gogfake_buscar($conexao, $sql, implode('', $tipos), $params);

foreach ($linhas as &$linha) {
    $linha['id'] = (int)$linha['id'];
    $linha['jogo_id'] = (int)$linha['jogo_id'];
    $linha['preco_original'] = (float)$linha['preco_original'];
    $linha['preco_atual'] = (float)$linha['preco_atual'];
    $linha['desconto'] = (int)$linha['desconto'];
    $linha['avaliacao'] = (float)$linha['avaliacao'];
}
unset($linha);

gogfake_saida(['success' => true, 'loja' => 'GOGFake', 'total' => count($linhas), 'jogos' => $linhas]);
