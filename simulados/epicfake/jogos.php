<?php
require_once __DIR__ . '/_layout.php';
epicfakeCabecalho('Jogos', 'jogos');
?>
<section class="ef-page-title">
    <p class="ef-kicker">Catálogo EpicFake</p>
    <h1>Encontre sua próxima jornada.</h1>
    <p>Todos os jogos cadastrados na fonte local de comparação do GameSearch, com preços em reais e disponibilidade simulada.</p>
</section>
<div class="ef-filterbar"><span data-contador>Carregando catálogo...</span><label><span class="sr-only">Ordenação</span><select class="ef-select" data-toast="A ordenação padrão prioriza os jogos mais populares."><option>Mais relevantes</option><option>Mais populares</option><option>Menor preço</option></select></label></div>
<section class="ef-game-grid" data-catalogo aria-live="polite"></section>
<?php epicfakeRodape(); ?>
