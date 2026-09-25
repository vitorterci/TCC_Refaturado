/* ─── ATALHO GLOBAL: CRISTAL MÁGICO ────────────────────────────────────────── */

(() => {
    const seletor = '[data-atalho-tema]';

    const temaAtual = () => {
        const salvo = localStorage.getItem('pref_tema');
        if (salvo === 'claro' || salvo === 'escuro') return salvo;
        return document.documentElement.classList.contains('tema-escuro') ? 'escuro' : 'claro';
    };

    const atualizarEstado = (botao) => {
        const tema = temaAtual();
        const proximoTema = tema === 'escuro' ? 'claro' : 'escuro';
        const textoAcao = proximoTema === 'escuro' ? 'modo escuro' : 'modo claro';

        botao.setAttribute('aria-label', `Alternar para ${textoAcao}`);
        botao.setAttribute('title', `Cristal Mágico — alternar para ${textoAcao}`);
        botao.dataset.temaAtual = tema;
    };

    const criarAtalho = () => {
        if (document.querySelector(seletor)) return;

        const botao = document.createElement('button');
        botao.type = 'button';
        botao.className = 'atalho-tema-cristal';
        botao.setAttribute('data-atalho-tema', '');
        botao.setAttribute('aria-label', 'Alternar tema');
        botao.setAttribute('title', 'Cristal Mágico — alternar tema');
        botao.innerHTML = `
            <span class="cristal-magia" aria-hidden="true">
                <span class="cristal-faceta cristal-faceta--superior"></span>
                <span class="cristal-faceta cristal-faceta--esquerda"></span>
                <span class="cristal-faceta cristal-faceta--direita"></span>
                <span class="cristal-faceta cristal-faceta--inferior"></span>
                <span class="cristal-brilho"></span>
            </span>
            <span class="cristal-particulas" aria-hidden="true"></span>
        `;

        botao.addEventListener('click', () => {
            const proximoTema = temaAtual() === 'escuro' ? 'claro' : 'escuro';
            if (!window.Preferencias || typeof window.Preferencias.aplicarTema !== 'function') return;

            botao.classList.remove('cristal-ativando');
            void botao.offsetWidth;
            botao.classList.add('cristal-ativando');
            window.Preferencias.aplicarTema(proximoTema);
            atualizarEstado(botao);
        });

        document.body.appendChild(botao);
        atualizarEstado(botao);
        setTimeout(() => atualizarEstado(botao), 0);
    };

    document.addEventListener('DOMContentLoaded', criarAtalho, { once: true });
})();
