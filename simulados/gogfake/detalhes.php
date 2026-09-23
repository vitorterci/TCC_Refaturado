<?php

declare(strict_types=1);
require_once __DIR__ . '/../_tcc_catalogo.php';
if (!headers_sent()) header('Content-Type: text/html; charset=utf-8');
$slug = trim((string)($_GET['jogo'] ?? $_GET['slug'] ?? ''));
$jogo = $slug !== '' ? tcc_catalogo_por_slug('GOGFake', $slug) : null;
if (!$jogo) {
    http_response_code(404);
}
function h($valor): string
{
    return htmlspecialchars((string)$valor, ENT_QUOTES, 'UTF-8');
}
function moeda($valor): string
{
    return 'R$ ' . number_format((float)$valor, 2, ',', '.');
}
?>
<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= $jogo ? h($jogo['nome']) . ' — GOGFake' : 'Jogo não encontrado — GOGFake' ?></title>
    <link rel="stylesheet" href="assets/css/gogfake.css">
</head>

<body>
    <header class="gf-header">
        <div class="gf-shell gf-nav"><a class="gf-logo" href="index.html">GOGFake</a>
            <nav class="gf-menu" aria-label="Navegação principal"><a href="index.html">Jogos</a><a href="ofertas.html">Ofertas</a><a href="ofertas.html?ordem=nome">Clássicos</a><a href="ofertas.html?destaque=lancamento">Novidades</a></nav>
            <form class="gf-search" data-gf-search><input aria-label="Pesquisar jogos" placeholder="Pesquisar jogos..."><button type="submit">⌕</button></form><a class="gf-login" href="../pages/login.html">Login</a><a class="gf-cart" href="#">Carrinho (0)</a>
        </div>
    </header>
    <main class="gf-shell"><?php if (!$jogo): ?><section class="gf-section">
                <h1>Jogo não encontrado</h1>
                <p class="gf-detail-copy">O título solicitado não está disponível no catálogo da GOGFake.</p><a class="gf-button" href="ofertas.html">Voltar às ofertas</a>
            </section><?php else: ?><section class="gf-detail">
                <div><img src="<?= h($jogo['imagem']) ?>" alt="Capa de <?= h($jogo['nome']) ?>"></div>
                <div><span class="gf-kicker"><?= h($jogo['loja']) ?> · <?= h($jogo['genero']) ?></span>
                    <h1><?= h($jogo['nome']) ?></h1>
                    <p class="gf-detail-copy"><?= h($jogo['descricao']) ?></p>
                    <div class="gf-facts">
                        <div class="gf-fact"><strong>Plataforma</strong><?= h($jogo['plataforma']) ?></div>
                        <div class="gf-fact"><strong>Avaliação</strong><?= number_format((float)$jogo['avaliacao'], 1, ',', '.') ?>/10</div>
                        <div class="gf-fact"><strong>Preço original</strong><span class="gf-old"><?= moeda($jogo['preco_original']) ?></span></div>
                        <div class="gf-fact"><strong>Desconto</strong>-<?= (int)$jogo['desconto'] ?>%</div>
                    </div>
                    <p><span class="gf-current"><?= moeda($jogo['preco_atual']) ?></span></p><button class="gf-button" type="button" onclick="alert('Compra simulada: <?= h($jogo['nome']) ?>')">Comprar agora</button>
                </div>
            </section><?php endif; ?></main>
   
</body>

</html>