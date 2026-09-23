<?php
require_once __DIR__ . '/inc.php';
$pagina = 'inicio';
$busca = trim((string)($_GET['busca'] ?? ''));
$jogos = steamfake_pagina_jogos($busca ? ['busca' => $busca] : []);
$ofertas = array_values(array_filter($jogos, fn($j) => (float)$j['desconto'] > 0));
?><!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>SteamFake — mundos digitais</title><link rel="stylesheet" href="assets/css/steamfake.css"></head><body><?php require __DIR__ . '/partials-header.php'; ?><main class="wrap">
<section class="hero"><div class="hero-content"><div class="eyebrow">Catálogo digital independente</div><h1>Seu próximo mundo começa aqui.</h1><p>Descubra aventuras, estratégias e experiências memoráveis com preços simulados para o ecossistema GameSearch.</p><a class="button" href="#jogos">Explorar catálogo →</a></div></section>
<section class="section" id="jogos"><div class="section-heading"><div><div class="eyebrow">Curadoria SteamFake</div><h2><?= $busca ? 'Resultados para “'.steamfake_e($busca).'”' : 'Jogos em destaque' ?></h2></div><a class="link" href="ofertas.php">Ver todas as ofertas ↗</a></div><div class="grid"><?php foreach (array_slice($jogos, 0, 8) as $jogo) echo steamfake_card($jogo); ?></div></section>
<section class="section" data-section="ofertas"><div class="section-heading"><div><div class="eyebrow">Economize mais</div><h2>Ofertas da semana</h2></div><a class="link" href="ofertas.php">Abrir ofertas ↗</a></div><div class="grid" data-grid><?php foreach (array_slice($ofertas, 0, 4) as $jogo) echo steamfake_card($jogo); ?></div></section>
<section class="section" data-section="vendidos"><div class="section-heading"><div><div class="eyebrow">A comunidade escolheu</div><h2>Mais vendidos</h2></div></div><div class="strip" data-grid><?php foreach (array_slice($jogos, 4, 3) as $jogo) echo steamfake_card($jogo); ?></div></section>
<section class="section" data-section="lancamentos"><div class="section-heading"><div><div class="eyebrow">Chegando agora</div><h2>Lançamentos</h2></div></div><div class="grid" data-grid><?php foreach (array_slice($jogos, 8, 4) as $jogo) echo steamfake_card($jogo); ?></div></section>
<section class="section" id="categorias"><div class="section-heading"><div><div class="eyebrow">Explore por estilo</div><h2>Categorias para todos os jogadores</h2></div></div><div class="filters"><a class="filter" href="index.php?busca=RPG#jogos">RPG</a><a class="filter" href="index.php?busca=Ação#jogos">Ação</a><a class="filter" href="index.php?busca=Aventura#jogos">Aventura</a><a class="filter" href="index.php?busca=Corrida#jogos">Corrida</a><a class="filter" href="index.php?busca=Estratégia#jogos">Estratégia</a><a class="filter" href="index.php?busca=Simulação#jogos">Simulação</a></div></section>
</main><footer class="site-footer">
    <div class="site-footer__glow"></div>

    <div class="site-footer__container">

        <!-- Identidade -->
        <div class="site-footer__brand">
            <a href="index.html"
               class="site-footer__logo"
               aria-label="Game Search - Início">
                <img src="/tcc/assets/img/logo.png" alt="Game Search">
            </a>

            <p class="site-footer__slogan">
                Sua próxima aventura começa aqui.
            </p>

            <p class="site-footer__description">
                Encontre, compare e descubra seus próximos jogos
                em um só lugar.
            </p>
        </div>

        <!-- Explorar -->
        <div class="site-footer__column">
            <h3>Explorar</h3>

            <a href="index.html">
                <i class="fas fa-house"></i>
                Início
            </a>

            <a href="pages/biblioteca.html">
                <i class="fas fa-book"></i>
                Biblioteca
            </a>

            <a href="pages/sobre.html">
                <i class="fas fa-compass"></i>
                Sobre nós
            </a>
        </div>

        <!-- Conta -->
        <div class="site-footer__column">
            <h3>Minha conta</h3>

            <a href="pages/perfil.html">
                <i class="fas fa-user"></i>
                Perfil
            </a>

            <a href="pages/configuracao.html">
                <i class="fas fa-gear"></i>
                Configurações
            </a>

            <a href="pages/feedback.html">
                <i class="fas fa-comment-dots"></i>
                Feedback
            </a>
        </div>

        <!-- Suporte -->
        <div class="site-footer__column">
            <h3>Suporte</h3>

            <a href="pages/ajuda.html">
                <i class="fas fa-circle-question"></i>
                Ajuda
            </a>

            <a href="pages/feedback.html">
                <i class="fas fa-message"></i>
                Fale conosco
            </a>

            <button type="button" class="footer-topo" id="btnVoltarTopo">
                <i class="fas fa-arrow-up"></i>
                Voltar ao topo
            </button>
        </div>

    </div>

    <div class="site-footer__bottom">
        <div class="site-footer__line"></div>

        <div class="site-footer__bottom-content">
            <span>© 2026 Game Search</span>

            <span class="site-footer__status">
                <i class="fas fa-circle"></i>
                Sua próxima aventura começa aqui
            </span>
        </div>
    </div>
</footer>

<script src="assets/js/steamfake.js"></script>
<script>
document.getElementById('btnVoltarTopo')?.addEventListener('click', () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});
</script>
</body></html>