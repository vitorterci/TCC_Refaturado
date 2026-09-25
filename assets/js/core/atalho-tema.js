/* ─── ATALHO GLOBAL E PERSONALIZÁVEL DE TEMA ─────────────────────────────── */

(() => {
    if (window.__atalhoTemaInicializado) return;
    window.__atalhoTemaInicializado = true;

    const chaves = {
        ativo: 'pref_atalho_tema_ativo',
        estilo: 'pref_atalho_tema',
        posicao: 'pref_atalho_tema_posicao',
        tamanho: 'pref_atalho_tema_tamanho',
        comportamento: 'pref_atalho_tema_comportamento',
        icone: 'pref_icone_tema'
    };
    const opcoes = {
        estilo: ['cristal-magico', 'circular', 'sol-lua', 'gif', 'minimalista', 'imagem'],
        posicao: ['superior-direito', 'inferior-direito', 'inferior-esquerdo', 'barra-lateral-inferior'],
        tamanho: ['pequeno', 'medio', 'grande'],
        comportamento: ['claro-escuro', 'claro-escuro-sistema']
    };

    // Ícones de estado do tema — usados pelo estilo "gif" (Pac-Man).
    // NÃO são opções de personagem no menu.
    const ICONES_ESTADO_TEMA = ['claro.gif', 'escuro.gif'];
    // Ícone padrão do estilo "imagem".
    const ICONE_PADRAO = 'pixel bloc.png';

    // Catálogo de personagens disponíveis em assets/img/tema/.
    // Exclui claro.gif e escuro.gif (Pac-Man usa o estilo "gif").
    // Ordem: nome exibido → arquivo real.
    const PERSONAGENS = [
        { nome: 'Pixel Bloc', arquivo: 'pixel bloc.png' },
        { nome: 'Sonic',      arquivo: 'sonic.gif' },
        { nome: 'Mario',      arquivo: 'mario.gif' },
        { nome: 'Eggman',     arquivo: 'eggman.webp' },
        { nome: 'Game Boy',   arquivo: 'gameboy.gif' },
        { nome: 'Moeda',      arquivo: 'moeda.gif' },
        { nome: 'Video Games', arquivo: 'Video Games...gif' }
    ];

    const script = document.currentScript;
    const obterBaseAssets = () => {
        const baseMeta = document.querySelector('meta[name="base-path"]');
        if (baseMeta?.content.trim()) return new URL(baseMeta.content.trim(), document.baseURI);
        if (baseMeta && window.location.pathname.includes('/pages/')) return new URL('../', document.baseURI);
        if (baseMeta) return new URL('./', document.baseURI);
        return new URL('../../../', script?.src || document.baseURI);
    };
    const baseAssets = obterBaseAssets();
    const gifs = {
        claro: new URL('assets/img/tema/claro.gif', baseAssets).href,
        escuro: new URL('assets/img/tema/escuro.gif', baseAssets).href
    };
    const cristalMagico = new URL('assets/img/tema/moeda.gif', baseAssets).href;

    // Monta a URL absoluta de uma imagem em assets/img/tema/.
    const urlIconeTema = (nomeArquivo) => {
        const nome = String(nomeArquivo || '').trim();
        if (!nome) return new URL(`assets/img/tema/${ICONE_PADRAO}`, baseAssets).href;
        return new URL(`assets/img/tema/${nome}`, baseAssets).href;
    };

    // Normaliza o nome do ícone salvo: precisa ser um arquivo simples
    // (sem barras), não pode ser um ícone de estado do tema.
    const normalizarIcone = (valor) => {
        const nome = String(valor || '').trim();
        if (!nome) return ICONE_PADRAO;
        if (nome.includes('/') || nome.includes('\\')) return ICONE_PADRAO;
        if (ICONES_ESTADO_TEMA.includes(nome.toLowerCase())) return ICONE_PADRAO;
        return nome;
    };

    const ler = (campo, padrao) => {
        const valor = localStorage.getItem(chaves[campo]);
        return opcoes[campo]?.includes(valor) ? valor : padrao;
    };
    const configuracao = () => ({
        ativo: localStorage.getItem(chaves.ativo) !== 'false',
        estilo: ler('estilo', 'gif'),
        posicao: ler('posicao', 'superior-direito'),
        tamanho: ler('tamanho', 'medio'),
        comportamento: ler('comportamento', 'claro-escuro'),
        icone: normalizarIcone(localStorage.getItem(chaves.icone))
    });
    const temaAtual = () => {
        const salvo = localStorage.getItem('pref_tema');
        if (salvo === 'claro' || salvo === 'escuro') return salvo;
        if (salvo === 'sistema') {
            return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'escuro' : 'claro';
        }
        return document.documentElement.classList.contains('tema-escuro') ? 'escuro' : 'claro';
    };
    const proximoTema = (tema, comportamento) => {
        if (comportamento === 'claro-escuro-sistema') {
            const salvo = localStorage.getItem('pref_tema');
            const atual = salvo === 'claro' || salvo === 'escuro' || salvo === 'sistema' ? salvo : tema;
            return atual === 'claro' ? 'escuro' : atual === 'escuro' ? 'sistema' : 'claro';
        }
        return tema === 'escuro' ? 'claro' : 'escuro';
    };

    const conteudoEstilo = (estilo, tema, icone) => {
        if (estilo === 'gif') {
            // Pac-Man: troca entre claro.gif e escuro.gif conforme o tema.
            return `<img class="atalho-tema-gif" src="${gifs[tema]}" alt="" draggable="false">`;
        }
        if (estilo === 'circular') {
            return '<span class="atalho-tema-circulo" aria-hidden="true"><span></span></span>';
        }
        if (estilo === 'sol-lua') {
            return '<span class="atalho-tema-sol-lua" aria-hidden="true"><span class="atalho-tema-sol">☀</span><span class="atalho-tema-lua">☾</span></span>';
        }
        if (estilo === 'minimalista') {
            return '<span class="atalho-tema-minimalista" aria-hidden="true"></span>';
        }
        if (estilo === 'imagem') {
            // Personagem fixo escolhido pelo usuário — NÃO muda com o tema.
            return `<img class="atalho-tema-imagem" src="${urlIconeTema(icone)}" alt="" draggable="false">`;
        }
        return `<img class="atalho-tema-cristal-img" src="${cristalMagico}" alt="" draggable="false">`;
    };
    const criarBotao = (previa = false) => {
        const botao = document.createElement('button');
        botao.type = 'button';
        botao.className = 'atalho-tema atalho-tema-global';
        if (previa) {
            botao.setAttribute('data-atalho-tema-preview', '');
            botao.setAttribute('aria-hidden', 'true');
            botao.tabIndex = -1;
        } else {
            botao.id = 'atalhoTemaGlobal';
            botao.setAttribute('data-atalho-tema-global', '');
            botao.addEventListener('click', () => {
                const config = configuracao();
                if (!window.Preferencias || typeof window.Preferencias.aplicarTema !== 'function') return;
                const tema = temaAtual();
                const proximo = proximoTema(tema, config.comportamento);
                botao.classList.remove('cristal-ativando');
                void botao.offsetWidth;
                botao.classList.add('cristal-ativando');
                window.Preferencias.aplicarTema(proximo);
                sincronizar();
            });
        }
        return botao;
    };
    const atualizarBotao = (botao, previa = false) => {
        const config = configuracao();
        const tema = temaAtual();
        const proximo = proximoTema(tema, config.comportamento);
        const estilos = ['cristal-magico', 'circular', 'sol-lua', 'gif', 'minimalista', 'imagem'];
        botao.classList.remove('atalho-tema-cristal', ...estilos.map(item => `atalho-tema-estilo-${item}`));
        if (config.estilo === 'cristal-magico') botao.classList.add('atalho-tema-cristal');
        botao.classList.add(`atalho-tema-estilo-${config.estilo}`);
        botao.dataset.estilo = config.estilo;
        botao.dataset.posicao = config.posicao;
        botao.dataset.tamanho = config.tamanho;
        botao.dataset.comportamento = config.comportamento;
        botao.dataset.icone = config.icone;
        botao.dataset.temaAtual = localStorage.getItem('pref_tema') === 'sistema' ? 'sistema' : tema;
        botao.dataset.temaEfetivo = tema;
        botao.setAttribute('aria-pressed', tema === 'escuro' ? 'true' : 'false');
        if (!previa) {
            const acao = proximo === 'sistema' ? 'modo do sistema' : `modo ${proximo}`;
            botao.setAttribute('aria-label', `Alternar para ${acao}`);
            botao.setAttribute('title', `Alternar tema — ${acao}`);
        }
        const conteudo = conteudoEstilo(config.estilo, tema, config.icone);
        if (botao.innerHTML !== conteudo) botao.innerHTML = conteudo;
        if (previa && botao.parentElement) {
            botao.parentElement.dataset.posicao = config.posicao;
            botao.parentElement.dataset.ativo = String(config.ativo);
            botao.parentElement.setAttribute('aria-label', `Prévia: ${config.estilo}, ${config.posicao}, tamanho ${config.tamanho}, atalho ${config.ativo ? 'ativado' : 'desativado'}`);
        }
    };
    const sincronizar = () => {
        const config = configuracao();
        let botao = document.getElementById('atalhoTemaGlobal');
        if (!config.ativo) {
            botao?.remove();
        } else {
            if (!botao) {
                botao = criarBotao();
            }
            const destino = obterDestino(config);
            if (botao.parentElement !== destino) destino.appendChild(botao);
            atualizarBotao(botao);
        }
        document.querySelectorAll('[data-atalho-tema-preview]').forEach(botaoPreview => atualizarBotao(botaoPreview, true));
    };
    const criarPreview = (container) => {
        if (!container) return;
        let preview = container.querySelector('[data-atalho-tema-preview]');
        if (!preview) {
            preview = criarBotao(true);
            container.appendChild(preview);
        }
        atualizarBotao(preview, true);
    };
    const obterDestino = config => {
        if (config.posicao !== 'barra-lateral-inferior') return document.body;
        return document.querySelector('.barra-lateral') || document.body;
    };

    // API pública para a página de configuração definir o ícone escolhido.
    // Uso: window.AtalhoTema.definirIcone('sonic.gif')
    const definirIcone = (nomeArquivo) => {
        const nome = normalizarIcone(nomeArquivo);
        localStorage.setItem(chaves.icone, nome);
        sincronizar();
        return nome;
    };
    const obterIcone = () => configuracao().icone;

    // Lista de ícones disponíveis (nomes de arquivo), exceto claro.gif/escuro.gif.
    const filtrarIconesDisponiveis = (nomes) => {
        if (!Array.isArray(nomes)) return [];
        return nomes
            .map(nome => String(nome || '').trim())
            .filter(nome => nome && !nome.includes('/') && !nome.includes('\\'))
            .filter(nome => !ICONES_ESTADO_TEMA.includes(nome.toLowerCase()));
    };

    // Lista de personagens do catálogo (nome exibido + arquivo real).
    const listarPersonagens = () => PERSONAGENS.map(p => ({ ...p }));

    window.AtalhoTema = {
        sincronizar,
        criarPreview,
        definirIcone,
        obterIcone,
        filtrarIconesDisponiveis,
        listarPersonagens,
        urlIconeTema,
        ICONE_PADRAO,
        ICONES_ESTADO_TEMA,
        PERSONAGENS
    };
    const inicializar = () => sincronizar();
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', inicializar, { once: true });
    } else {
        inicializar();
    }
    const mediaSistema = window.matchMedia('(prefers-color-scheme: dark)');
    const atualizarSistema = () => {
        if (localStorage.getItem('pref_tema') === 'sistema' || !localStorage.getItem('pref_tema')) sincronizar();
    };
    if (typeof mediaSistema.addEventListener === 'function') mediaSistema.addEventListener('change', atualizarSistema);
    else if (typeof mediaSistema.addListener === 'function') mediaSistema.addListener(atualizarSistema);
    window.addEventListener('storage', evento => {
        if (evento.key === null || Object.values(chaves).includes(evento.key) || evento.key === 'pref_tema') sincronizar();
    });
})();