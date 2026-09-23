/* ─── PREFERÊNCIAS: TEMA ─────────────────────────────────────────────────── */

window.Preferencias = window.Preferencias || {};

window.Preferencias.aplicarTema = function (tema) {
    localStorage.setItem('pref_tema', tema);
    const html = document.documentElement;
    html.classList.remove('tema-claro', 'tema-escuro');
    document.body.classList.remove('tema-claro', 'tema-escuro');

    if (tema === 'claro') {
        html.classList.add('tema-claro');
        document.body.classList.add('tema-claro');
    } else if (tema === 'escuro') {
        html.classList.add('tema-escuro');
        document.body.classList.add('tema-escuro');
    } else {
        // Sistema
        const prefDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
        if (prefDark) {
            html.classList.add('tema-escuro');
            document.body.classList.add('tema-escuro');
        } else {
            html.classList.add('tema-claro');
            document.body.classList.add('tema-claro');
        }
    }
};
