<?php
require_once __DIR__ . '/_layout.php';
epicfakeCabecalho('Gratuitos', 'gratuitos');
?>
<section class="ef-page-title">
    <p class="ef-kicker">Sem custo para começar</p>
    <h1>Grandes jogos, grátis.</h1>
    <p>Uma seleção de experiências gratuitas para entrar, jogar e descobrir novas comunidades.</p>
</section>
<div class="ef-filterbar"><span data-contador>Carregando jogos gratuitos...</span><span>Sem cobrança · catálogo demonstrativo</span></div>
<section class="ef-game-grid" data-catalogo aria-live="polite"></section>
<?php epicfakeRodape(); ?>
