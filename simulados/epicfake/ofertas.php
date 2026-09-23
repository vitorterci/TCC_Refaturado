<?php
require_once __DIR__ . '/_layout.php';
epicfakeCabecalho('Ofertas', 'ofertas');
?>
<section class="ef-page-title">
    <p class="ef-kicker">Economize sem perder a aventura</p>
    <h1>Ofertas para jogar mais.</h1>
    <p>Preços promocionais simulados da EpicFake para você comparar com outras fontes no GameSearch.</p>
</section>
<div class="ef-filterbar"><span data-contador>Carregando ofertas...</span><span>Valores em BRL · descontos aplicados no catálogo local</span></div>
<section class="ef-game-grid" data-catalogo aria-live="polite"></section>
<?php epicfakeRodape(); ?>
