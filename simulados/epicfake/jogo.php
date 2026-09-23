<?php
require_once __DIR__ . '/_layout.php';
$slug = trim((string)($_GET['slug'] ?? ''));
epicfakeCabecalho('Detalhes do jogo', 'detalhe', $slug);
?>
<section class="ef-detail" data-detalhe aria-live="polite">
    <div class="ef-skeleton"></div>
    <div class="ef-skeleton"></div>
</section>
<section class="ef-info-section" aria-labelledby="info-jogo-titulo">
    <h2 id="info-jogo-titulo">Informações adicionais</h2>
    <div class="ef-specs" data-especificacoes><div class="ef-skeleton"></div><div class="ef-skeleton"></div><div class="ef-skeleton"></div><div class="ef-skeleton"></div></div>
</section>
<?php epicfakeRodape(); ?>
