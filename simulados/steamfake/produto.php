<?php
require_once __DIR__ . '/inc.php';
$slug = trim((string)($_GET['slug'] ?? ''));
$encontrados = steamfake_pagina_jogos(['slug' => $slug]);
$jogo = $encontrados[0] ?? null;
if (!$jogo) { http_response_code(404); }
$pagina = 'jogos';
?><!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title><?= $jogo ? steamfake_e($jogo['nome']) . ' — SteamFake' : 'Jogo não encontrado — SteamFake' ?></title><link rel="stylesheet" href="assets/css/steamfake.css"></head><body><?php require __DIR__ . '/partials-header.php'; ?><main class="wrap"><?php if (!$jogo): ?><section class="page-top"><div class="empty">O jogo solicitado não foi encontrado. <a class="link" href="index.php">Voltar ao catálogo</a></div></section><?php else: ?><section class="product"><div class="product-cover"><img src="<?= steamfake_e($jogo['imagem']) ?>" alt="Capa ilustrativa de <?= steamfake_e($jogo['nome']) ?>"></div><div class="product-details"><div class="eyebrow">SteamFake / PC</div><h1><?= steamfake_e($jogo['nome']) ?></h1><div class="rating">★ <?= number_format((float)$jogo['avaliacao'], 1, ',', '.') ?> / 5.0 — avaliação da comunidade</div><p class="product-description"><?= steamfake_e($jogo['descricao']) ?></p><div class="facts"><div class="fact"><small>Gênero</small><strong><?= steamfake_e($jogo['genero']) ?></strong></div><div class="fact"><small>Plataforma</small><strong><?= steamfake_e($jogo['plataforma']) ?></strong></div><div class="fact"><small>Loja</small><strong>SteamFake</strong></div><div class="fact"><small>Status</small><strong><?= steamfake_e($jogo['promocao_status']) ?></strong></div></div><div class="purchase"><div><?php if ((float)$jogo['desconto'] > 0): ?><div class="old"><?= steamfake_real($jogo['preco_original']) ?> · -<?= (int)$jogo['desconto'] ?>%</div><?php endif; ?><div class="current"><?= steamfake_real($jogo['preco_atual']) ?></div></div><button class="button" type="button" onclick="alert('Compra simulada — nenhuma transação real será realizada.')">Comprar</button></div><div class="notice">▣ <?= steamfake_e($jogo['promocao_status']) ?> · preço simulado para integração</div></div></section><?php endif; ?></main><?php require __DIR__ . '/partials-footer.php'; ?><footer class="site-footer">
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
