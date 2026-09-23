<?php
function epicfakeCabecalho(string $titulo, string $pagina = 'inicio', string $slug = ''): void
{
    $tituloSeguro = htmlspecialchars($titulo, ENT_QUOTES, 'UTF-8');
    $paginaSegura = htmlspecialchars($pagina, ENT_QUOTES, 'UTF-8');
    $slugSeguro = htmlspecialchars($slug, ENT_QUOTES, 'UTF-8');
    ?>
<!doctype html>
<html lang="pt-BR" data-tema="sistema">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#101014">
    <meta name="description" content="EpicFake — uma vitrine local de jogos digitais para comparação de preços no GameSearch.">
    <title><?= $tituloSeguro ?> — EpicFake</title>
    <link rel="stylesheet" href="assets/css/epicfake.css">
</head>
<body data-pagina="<?= $paginaSegura ?>" data-slug="<?= $slugSeguro ?>">
    <div class="ef-site-shell">
        <header class="ef-header">
            <a class="ef-logo" href="index.php" aria-label="EpicFake, página inicial">
                <span class="ef-logo-mark">E</span>
                <span>EpicFake</span>
            </a>
            <button class="ef-mobile-toggle" type="button" aria-label="Abrir menu" aria-expanded="false" data-menu-toggle>
                <span></span><span></span><span></span>
            </button>
            <nav class="ef-nav" data-menu>
                <a class="<?= $pagina === 'descobrir' || $pagina === 'inicio' ? 'ativo' : '' ?>" href="index.php">Descobrir</a>
                <a class="<?= $pagina === 'jogos' ? 'ativo' : '' ?>" href="jogos.php">Jogos</a>
                <a class="<?= $pagina === 'ofertas' ? 'ativo' : '' ?>" href="ofertas.php">Ofertas</a>
                <a class="<?= $pagina === 'gratuitos' ? 'ativo' : '' ?>" href="gratuitos.php">Gratuitos</a>
            </nav>
            <div class="ef-header-actions">
                <form class="ef-search" action="jogos.php" method="get" role="search">
                    <label class="sr-only" for="busca-site">Buscar na EpicFake</label>
                    <svg aria-hidden="true" viewBox="0 0 24 24"><circle cx="11" cy="11" r="6.5"></circle><path d="m16 16 5 5"></path></svg>
                    <input id="busca-site" type="search" name="busca" placeholder="Buscar jogos" autocomplete="off">
                </form>
                <button class="ef-icon-button" type="button" title="Conta" aria-label="Abrir conta" data-toast="A conta EpicFake está disponível apenas como demonstração.">
                    <svg aria-hidden="true" viewBox="0 0 24 24"><circle cx="12" cy="8" r="3.5"></circle><path d="M5 20c.7-3.2 3.1-5 7-5s6.3 1.8 7 5"></path></svg>
                </button>
                <button class="ef-icon-button ef-cart-button" type="button" title="Carrinho" aria-label="Abrir carrinho" data-toast="O carrinho é uma demonstração visual da loja.">
                    <svg aria-hidden="true" viewBox="0 0 24 24"><path d="M3 4h2l2.2 11.2a2 2 0 0 0 2 1.6h7.6a2 2 0 0 0 2-1.6L20 8H6"></path><circle cx="9" cy="20" r="1"></circle><circle cx="18" cy="20" r="1"></circle></svg>
                    <span class="ef-cart-count">0</span>
                </button>
                <button class="ef-theme-button" type="button" title="Alternar tema" aria-label="Alternar tema" data-theme-toggle>
                    <svg aria-hidden="true" viewBox="0 0 24 24"><path d="M20.5 15.2A8.5 8.5 0 0 1 8.8 3.5 8.5 8.5 0 1 0 20.5 15.2Z"></path></svg>
                </button>
            </div>
        </header>
        <main class="ef-main">
<?php
}

function epicfakeRodape(): void
{
    ?>
        </main>
      
    </div>
    <div class="ef-toast" role="status" aria-live="polite" data-toast-area></div>
    <script src="assets/js/epicfake.js" defer></script>

</body>
</html>
<?php
}
?>
