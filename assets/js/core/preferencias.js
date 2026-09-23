/* ─── PREFERÊNCIAS ───────────────────────────────────────────────────────── */

const Preferencias = window.Preferencias = window.Preferencias || {};

Preferencias.aplicarTudo = function () {
    this.aplicarCor();
    this.aplicarAnimacoes();
    this.aplicarTema(localStorage.getItem('pref_tema') || 'sistema');
};
