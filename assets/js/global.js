/* ─── FUNCIONALIDADES GLOBAIS ──────────────────────────────────────────────── */

// Resolve as capas de jogos para a raiz correta do projeto.
// A pasta oficial de imagens de jogos é `games/` (na raiz do projeto).
// A mesma função é usada pelo index, /pages/ e /pages/admin/.
window.obterCaminhoImagem = function (imagem, slug) {
    // Detecta o nível de profundidade para o prefixo relativo.
    const caminhoPagina = window.location.pathname;
    let prefixo = '';
    if (caminhoPagina.includes('/pages/admin/')) {
        prefixo = '../../';
    } else if (caminhoPagina.includes('/pages/')) {
        prefixo = '../';
    }

    const fallback = `${prefixo}assets/img/naoencontrada.png`;
    const valor = String(imagem || '').trim();

    // Sem imagem cadastrada: usa fallback.
    if (!valor) return fallback;

    // URLs absolutas (http, https, data) ou caminhos a partir da raiz: preserva.
    if (/^(https?:|data:)/i.test(valor) || valor.startsWith('/')) return valor;

    // Normaliza o caminho recebido:
    // - remove prefixos relativos acidentais (./, ../)
    // - corrige resquícios do padrão legado "assets/img/games/X" → "games/X"
    let caminho = valor
        .replace(/^(?:\.\.\/|\.\/)+/, '')
        .replace(/^assets\/img\/games\//i, 'games/')
        .replace(/^assets\/img\//i, 'assets/img/');

    // Pasta oficial de imagens de jogos: `games/`.
    if (caminho.startsWith('games/')) {
        return `${prefixo}${caminho}`;
    }

    // Se vier apenas o nome do arquivo (ex.: "elden-ring.webp"),
    // normaliza para `games/<arquivo>`.
    if (!caminho.includes('/')) {
        return `${prefixo}games/${caminho}`;
    }

    // Outros caminhos em `assets/` são preservados para compatibilidade.
    if (caminho.startsWith('assets/')) {
        return `${prefixo}${caminho}`;
    }

    // Caminhos desconhecidos: tratados como arquivo dentro de `games/`.
    return `${prefixo}games/${caminho}`;
};

/* Os módulos core e os comportamentos específicos são carregados aqui para
 * manter compatibilidade com as páginas que incluem apenas este arquivo. */
(() => {
    const caminhoGlobal = document.currentScript?.src || '';
    const baseModulos = caminhoGlobal.slice(0, caminhoGlobal.lastIndexOf('/') + 1);
    const modulos = [
        'core/preferencias.js',
        'core/tema.js',
        'core/atalho-tema.js',
        'core/contraste.js',
        'core/animacoes.js',
        
        'busca/busca.js',
        'censura.js',
        'footer.js'
    ];
    document.write(modulos.map(modulo =>
        `<script src="${baseModulos}${modulo}"><\/script>`
    ).join(''));
})();

// Aplicar preferências somente após os módulos core injetados acima estarem disponíveis.
const aplicarPreferenciasGlobais = () => {
    if (window.Preferencias && typeof window.Preferencias.aplicarTudo === 'function') {
        window.Preferencias.aplicarTudo();
    }
};
document.addEventListener('DOMContentLoaded', aplicarPreferenciasGlobais, { once: true });
