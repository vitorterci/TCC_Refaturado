<?php require_once __DIR__ . '/inc.php'; $pagina = 'ofertas'; $ofertas = steamfake_pagina_jogos(['ofertas'=>true]); ?><!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Ofertas — SteamFake</title><link rel="stylesheet" href="assets/css/steamfake.css"></head><body><?php require __DIR__ . '/partials-header.php'; ?><main class="wrap"><section class="page-top"><div class="eyebrow">Descontos simulados</div><h1>Ofertas que valem o play.</h1><p>Preços promocionais locais para testar a integração do GameSearch com uma fonte externa de preços.</p></section><section class="section"><div class="filters"><span class="filter active"><?= count($ofertas) ?> ofertas disponíveis</span><span class="filter">PC</span><span class="filter">Até 50% OFF</span><span class="filter">Mais populares</span></div><div class="grid"><?php foreach ($ofertas as $jogo) echo steamfake_card($jogo); ?></div></section></main><?php require __DIR__ . '/partials-footer.php'; ?><footer class="site-footer">
    <div class="site-footer__glow"></div>

    <div class="site-footer__container">

        <!-- Identidade -->
        <div class="site-footer__brand">
            <a href="index.html"
               class="site-footer__logo"
               aria-label="Game Search - Início">
                <img src="assets/img/logo.png" alt="Game Search">
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

<script>
document.getElementById('btnVoltarTopo')?.addEventListener('click', () => {
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});
</script>
</body></html>
