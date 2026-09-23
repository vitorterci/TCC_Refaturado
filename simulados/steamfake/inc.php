<?php
require_once __DIR__ . '/../_tcc_catalogo.php';

function steamfake_pagina_jogos(array $filtros = []): array
{
    return tcc_catalogo_buscar('SteamFake', $filtros);
}

function steamfake_real(float|string $valor): string
{
    return 'R$ ' . number_format((float)$valor, 2, ',', '.');
}

function steamfake_e(string $valor): string
{
    return htmlspecialchars($valor, ENT_QUOTES, 'UTF-8');
}

function steamfake_card(array $jogo): string
{
    $desconto = (float)$jogo['desconto'];
    $url = 'produto.php?slug=' . rawurlencode($jogo['slug']);
    ob_start(); ?>
    <article class="card">
      <a href="<?= steamfake_e($url) ?>"><div class="cover"><img src="<?= steamfake_e($jogo['imagem']) ?>" alt="Capa ilustrativa de <?= steamfake_e($jogo['nome']) ?>"><?php if ($desconto > 0): ?><span class="tag">-<?= (int)$desconto ?>%</span><?php endif; ?></div><div class="card-content"><h3><?= steamfake_e($jogo['nome']) ?></h3><div class="meta"><span class="genre"><?= steamfake_e($jogo['genero']) ?></span><span class="rating">★ <?= number_format((float)$jogo['avaliacao'], 1, ',', '.') ?></span></div><div class="price-row"><span class="old"><?= $desconto > 0 ? steamfake_real($jogo['preco_original']) : '' ?></span><strong class="price"><?= steamfake_real($jogo['preco_atual']) ?></strong></div></div></a>
    </article>
    <?php return (string)ob_get_clean();
}
?>
