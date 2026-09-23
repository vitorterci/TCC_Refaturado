(() => {
    'use strict';

    const body = document.body;
    const pagina = body.dataset.pagina || 'inicio';
    const apiBase = 'api/';
    const moeda = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });
    let toastTimer;

    const escapeHtml = (valor) => String(valor ?? '').replace(/[&<>'"]/g, (caractere) => ({
        '&': '&amp;', '<': '&lt;', '>': '&gt;', "'": '&#039;', '"': '&quot;'
    }[caractere]));

    const imagePath = (imagem) => {
        const caminho = String(imagem || '');
        return caminho.startsWith('epicfake/') ? `../${caminho}` : caminho;
    };

    const formatarPreco = (valor) => Number(valor) === 0 ? 'Grátis' : moeda.format(Number(valor));
    const stars = (valor) => `★ ${Number(valor || 0).toFixed(1)}`;

    const mostrarToast = (mensagem) => {
        const area = document.querySelector('[data-toast-area]');
        if (!area) return;
        area.textContent = mensagem;
        area.classList.add('visivel');
        clearTimeout(toastTimer);
        toastTimer = setTimeout(() => area.classList.remove('visivel'), 3200);
    };

    const cardTemplate = (jogo, indice = 0) => {
        const gratuito = Number(jogo.gratuito) === 1 || Number(jogo.preco_atual) === 0;
        const desconto = Number(jogo.desconto) > 0;
        return `<article class="ef-game-card" style="animation-delay:${Math.min(indice * 45, 350)}ms">
            <a class="ef-cover-link" href="jogo.php?slug=${encodeURIComponent(jogo.slug)}" aria-label="Ver detalhes de ${escapeHtml(jogo.nome)}">
                <img src="${escapeHtml(imagePath(jogo.imagem))}" alt="Capa de ${escapeHtml(jogo.nome)}" loading="lazy">
                ${gratuito ? '<span class="ef-discount ef-free-label">GRÁTIS</span>' : (desconto ? `<span class="ef-discount">-${escapeHtml(jogo.desconto)}%</span>` : '')}
            </a>
            <div class="ef-card-body">
                <h3 class="ef-card-title">${escapeHtml(jogo.nome)}</h3>
                <div class="ef-card-meta"><span class="ef-card-genre">${escapeHtml(jogo.genero || jogo.plataforma)}</span><span class="ef-rating">${stars(jogo.avaliacao)}</span></div>
                <div class="ef-price-row">
                    <strong class="${gratuito ? 'ef-price-free' : 'ef-price-current'}">${formatarPreco(jogo.preco_atual)}</strong>
                    ${desconto ? `<span class="ef-price-old">${formatarPreco(jogo.preco_original)}</span>` : ''}
                </div>
                <div class="ef-card-footer"><a href="jogo.php?slug=${encodeURIComponent(jogo.slug)}">Ver detalhes</a><button type="button" class="ef-add-button" data-add-cart="${escapeHtml(jogo.nome)}">+ Adicionar</button></div>
            </div>
        </article>`;
    };

    const renderizarJogos = (container, jogos, vazio = 'Nenhum jogo encontrado.') => {
        if (!container) return;
        container.innerHTML = jogos.length ? jogos.map(cardTemplate).join('') : `<div class="ef-empty">${escapeHtml(vazio)}</div>`;
    };

    const skeletons = (quantidade = 4) => Array.from({ length: quantidade }, () => '<div class="ef-skeleton"></div>').join('');

    const buscarJogos = async (parametros = '') => {
        const resposta = await fetch(`${apiBase}jogos.php${parametros}`);
        const dados = await resposta.json();
        if (!dados.success) throw new Error(dados.message || 'Não foi possível carregar o catálogo.');
        return dados.jogos || [];
    };

    const carregarSecao = async (seletor, parametros, vazio) => {
        const container = document.querySelector(seletor);
        if (!container) return;
        container.innerHTML = skeletons(4);
        try {
            renderizarJogos(container, await buscarJogos(parametros), vazio);
        } catch (erro) {
            container.innerHTML = `<div class="ef-empty">${escapeHtml(erro.message)}<br><small>Verifique se o XAMPP e o MySQL estão ativos.</small></div>`;
        }
    };

    const prepararHome = () => {
        carregarSecao('[data-secao="ofertas"]', '?categoria=ofertas&limite=4', 'Nenhuma oferta disponível no momento.');
        carregarSecao('[data-secao="gratuitos"]', '?categoria=gratuitos&limite=4', 'Nenhum jogo gratuito disponível.');
        carregarSecao('[data-secao="lancamentos"]', '?categoria=lancamentos&limite=4', 'Nenhum lançamento cadastrado.');
        carregarSecao('[data-secao="populares"]', '?categoria=populares&limite=4', 'Nenhum jogo popular encontrado.');
    };

    const prepararCatalogo = async () => {
        const container = document.querySelector('[data-catalogo]');
        if (!container) return;
        const params = new URLSearchParams(window.location.search);
        const busca = params.get('busca') || '';
        const categoria = body.dataset.pagina === 'ofertas' ? 'ofertas' : (body.dataset.pagina === 'gratuitos' ? 'gratuitos' : '');
        const query = new URLSearchParams({ limite: '60' });
        if (busca) query.set('busca', busca);
        if (categoria) query.set('categoria', categoria);
        const campo = document.querySelector('#busca-site');
        if (campo && busca) campo.value = busca;
        container.innerHTML = skeletons(8);
        try {
            const jogos = await buscarJogos(`?${query.toString()}`);
            const contador = document.querySelector('[data-contador]');
            if (contador) contador.textContent = `${jogos.length} ${jogos.length === 1 ? 'jogo encontrado' : 'jogos encontrados'}`;
            renderizarJogos(container, jogos, busca ? 'Nenhum resultado para sua busca.' : 'Nenhum jogo disponível.');
        } catch (erro) {
            container.innerHTML = `<div class="ef-empty">${escapeHtml(erro.message)}<br><small>Verifique se o XAMPP e o MySQL estão ativos.</small></div>`;
        }
    };

    const prepararDetalhe = async () => {
        const slug = body.dataset.slug;
        if (!slug) return;
        const container = document.querySelector('[data-detalhe]');
        if (!container) return;
        try {
            const resposta = await fetch(`${apiBase}jogos.php?slug=${encodeURIComponent(slug)}`);
            const dados = await resposta.json();
            if (!dados.success) throw new Error(dados.message || 'Jogo não encontrado.');
            const jogo = dados.jogo;
            const gratuito = Number(jogo.preco_atual) === 0;
            container.innerHTML = `<div class="ef-detail-media"><img src="${escapeHtml(imagePath(jogo.imagem))}" alt="Arte de ${escapeHtml(jogo.nome)}"></div>
                <div class="ef-detail-copy"><p class="ef-kicker">EpicFake / ${escapeHtml(jogo.genero)}</p><h1>${escapeHtml(jogo.nome)}</h1><p>${escapeHtml(jogo.descricao)}</p>
                <div class="ef-detail-badges"><span class="ef-detail-badge">${escapeHtml(jogo.plataforma)}</span><span class="ef-detail-badge">${escapeHtml(jogo.genero)}</span><span class="ef-detail-badge">${escapeHtml(jogo.classificacao)}</span></div>
                <div class="ef-rating-large">${stars(jogo.avaliacao)} <span>avaliação da comunidade</span></div>
                <div class="ef-purchase-box"><div class="ef-purchase-price"><strong>${formatarPreco(jogo.preco_atual)}</strong>${Number(jogo.desconto) > 0 ? `<del>${formatarPreco(jogo.preco_original)}</del>` : ''}</div><button class="ef-button ef-button-primary ef-button-full" type="button" data-add-cart="${escapeHtml(jogo.nome)}">Obter</button><p class="ef-purchase-note">Compra demonstrativa · código local EpicFake</p></div></div>`;
            const specs = document.querySelector('[data-especificacoes]');
            if (specs) specs.innerHTML = `<div class="ef-spec"><small>Desenvolvedora</small><strong>${escapeHtml(jogo.desenvolvedora)}</strong></div><div class="ef-spec"><small>Plataforma</small><strong>${escapeHtml(jogo.plataforma)}</strong></div><div class="ef-spec"><small>Tamanho</small><strong>${escapeHtml(jogo.tamanho)}</strong></div><div class="ef-spec"><small>Disponibilidade</small><strong>Catálogo local</strong></div>`;
        } catch (erro) {
            container.innerHTML = `<div class="ef-empty">${escapeHtml(erro.message)}</div>`;
        }
    };

    const inicializarTema = () => {
        const salvo = localStorage.getItem('epicfake-tema') || 'sistema';
        const aplicar = (tema) => {
            document.documentElement.dataset.tema = tema;
            const botao = document.querySelector('[data-theme-toggle]');
            if (botao) botao.setAttribute('aria-label', `Tema atual: ${tema}. Alternar tema`);
        };
        aplicar(salvo);
        document.querySelector('[data-theme-toggle]')?.addEventListener('click', () => {
            const atual = document.documentElement.dataset.tema || 'sistema';
            const proximo = atual === 'escuro' ? 'claro' : (atual === 'claro' ? 'sistema' : 'escuro');
            localStorage.setItem('epicfake-tema', proximo);
            aplicar(proximo);
        });
    };

    document.addEventListener('click', (evento) => {
        const adicionar = evento.target.closest('[data-add-cart]');
        if (adicionar) {
            const atual = Number(localStorage.getItem('epicfake-carrinho') || 0) + 1;
            localStorage.setItem('epicfake-carrinho', atual);
            const contador = document.querySelector('.ef-cart-count');
            if (contador) contador.textContent = atual;
            mostrarToast(`${adicionar.dataset.addCart} foi adicionado ao carrinho demonstrativo.`);
        }
        const toast = evento.target.closest('[data-toast]');
        if (toast) mostrarToast(toast.dataset.toast);
    });

    document.querySelector('[data-menu-toggle]')?.addEventListener('click', (evento) => {
        const menu = document.querySelector('[data-menu]');
        const aberto = menu?.classList.toggle('aberto');
        evento.currentTarget.setAttribute('aria-expanded', String(Boolean(aberto)));
    });

    document.addEventListener('DOMContentLoaded', () => {
        inicializarTema();
        const carrinho = document.querySelector('.ef-cart-count');
        if (carrinho) carrinho.textContent = localStorage.getItem('epicfake-carrinho') || '0';
        if (pagina === 'inicio') prepararHome();
        if (['jogos', 'ofertas', 'gratuitos'].includes(pagina)) prepararCatalogo();
        if (pagina === 'detalhe') prepararDetalhe();
    });
})();
