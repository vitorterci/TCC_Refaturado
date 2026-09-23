<?php
require_once __DIR__ . '/_layout.php';
epicfakeCabecalho('Descobrir', 'inicio');
?>
<section class="ef-hero" aria-labelledby="hero-titulo">
    <div class="ef-hero-content">
        <p class="ef-kicker">Destaque da semana · catálogo local</p>
        <h1 id="hero-titulo">A próxima aventura começa aqui.</h1>
        <p>Descubra experiências marcantes, compare valores e encontre seu próximo jogo favorito na vitrine EpicFake.</p>
        <div class="ef-hero-actions"><a class="ef-button ef-button-primary" href="jogos.php">Explorar jogos</a><a class="ef-button ef-button-ghost" href="ofertas.php">Ver ofertas</a></div>
    </div>
</section>

<section class="ef-section" aria-labelledby="ofertas-titulo">
    <div class="ef-section-heading"><div><h2 id="ofertas-titulo">Ofertas em destaque</h2><p>Grandes mundos, preços menores.</p></div><a class="ef-section-link" href="ofertas.php">Ver todas</a></div>
    <div class="ef-game-grid" data-secao="ofertas"></div>
</section>

<section class="ef-section" aria-labelledby="gratuitos-titulo">
    <div class="ef-section-heading"><div><h2 id="gratuitos-titulo">Jogue de graça</h2><p>Experiências gratuitas para começar agora.</p></div><a class="ef-section-link" href="gratuitos.php">Ver todos</a></div>
    <div class="ef-game-grid" data-secao="gratuitos"></div>
</section>

<section class="ef-section" aria-labelledby="lancamentos-titulo">
    <div class="ef-section-heading"><div><h2 id="lancamentos-titulo">Novos na vitrine</h2><p>Os lançamentos que acabaram de chegar.</p></div><a class="ef-section-link" href="jogos.php">Catálogo completo</a></div>
    <div class="ef-game-grid" data-secao="lancamentos"></div>
</section>

<section class="ef-section" aria-labelledby="populares-titulo">
    <div class="ef-section-heading"><div><h2 id="populares-titulo">Mais populares</h2><p>Os favoritos da comunidade EpicFake.</p></div><a class="ef-section-link" href="jogos.php">Ver biblioteca</a></div>
    <div class="ef-game-grid" data-secao="populares"></div>
</section>
<?php epicfakeRodape(); ?>
