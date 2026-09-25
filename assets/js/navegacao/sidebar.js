/* ── Sidebar retrátil com persistência ── */
document.addEventListener('DOMContentLoaded', () => {
    // ─── Botão de tema: Cristal Mágico (GIFs) no rodapé da sidebar ───────
    // Reutiliza a lógica existente em window.Preferencias.aplicarTema.
    (function criarBotaoTemaCristal() {
        const sidebar = document.querySelector('.barra-lateral');
        if (!sidebar) return;

        // Evita duplicação caso o script seja reavaliado.
        if (sidebar.querySelector('.sidebar-rodape .botao-tema-cristal')) return;

        // Cria (ou reaproveita) o contêiner de rodapé da sidebar.
        let rodape = sidebar.querySelector('.sidebar-rodape');
        if (!rodape) {
            rodape = document.createElement('div');
            rodape.className = 'sidebar-rodape';
            sidebar.appendChild(rodape);
        }

        const botao = document.createElement('button');
        botao.type = 'button';
        botao.className = 'botao-tema-cristal';
        botao.setAttribute('aria-label', 'Alternar entre tema claro e escuro');
        botao.setAttribute('title', 'Alternar tema claro/escuro');

        const img = document.createElement('img');
        img.alt = 'Cristal Mágico — alternar tema';
        img.draggable = false;

        // Caminhos dos GIFs existentes no projeto.
        const GIF_CLARO = 'assets/img/claro.gif';
        const GIF_ESCURO = 'assets/img/escuro.gif';

        // Determina o tema efetivo usando a mesma regra do tema.js:
        // localStorage 'pref_tema' (claro/escuro/sistema) ou preferência do sistema.
        function temaEfetivo() {
            const salvo = localStorage.getItem('pref_tema');
            if (salvo === 'claro' || salvo === 'escuro') return salvo;
            const prefereEscuro = window.matchMedia('(prefers-color-scheme: dark)').matches;
            return prefereEscuro ? 'escuro' : 'claro';
        }

        // Atualiza o GIF exibido conforme o tema atual.
        function atualizarGif() {
            const tema = temaEfetivo();
            const novoSrc = tema === 'claro' ? GIF_CLARO : GIF_ESCURO;
            if (img.getAttribute('src') !== novoSrc) {
                img.src = novoSrc;
            }
            botao.setAttribute('aria-pressed', tema === 'escuro' ? 'true' : 'false');
            botao.setAttribute('data-tema', tema);
        }

        atualizarGif();
        botao.appendChild(img);

        botao.addEventListener('click', () => {
            // Animação de clique (não interrompe a animação do GIF em si).
            botao.classList.remove('clicando');
            void botao.offsetWidth;
            botao.classList.add('clicando');
            setTimeout(() => botao.classList.remove('clicando'), 500);

            // Alterna usando exclusivamente a lógica existente em tema.js.
            const proximo = temaEfetivo() === 'escuro' ? 'claro' : 'escuro';
            if (typeof window.Preferencias?.aplicarTema === 'function') {
                window.Preferencias.aplicarTema(proximo);
            }

            // Atualiza imediatamente o GIF exibido.
            atualizarGif();
        });

        // Mantém o GIF sincronizado caso a preferência do sistema mude
        // enquanto 'pref_tema' estiver em 'sistema' (ou ausente).
        const mq = window.matchMedia('(prefers-color-scheme: dark)');
        const aoMudarSistema = () => {
            const salvo = localStorage.getItem('pref_tema');
            if (salvo !== 'claro' && salvo !== 'escuro') atualizarGif();
        };
        if (typeof mq.addEventListener === 'function') {
            mq.addEventListener('change', aoMudarSistema);
        } else if (typeof mq.addListener === 'function') {
            mq.addListener(aoMudarSistema);
        }

        rodape.appendChild(botao);
    })();

    // Marcar o item ativo da navegação.
    const paginaAtual = decodeURIComponent(window.location.pathname.split('/').pop() || 'index.html');
    document.querySelectorAll('.menu-navegacao li').forEach(li => li.classList.remove('ativo'));
    document.querySelectorAll('.menu-navegacao li a').forEach(link => {
        const href = decodeURIComponent(link.getAttribute('href')?.split('/').pop() || '');
        if (href === paginaAtual) {
            link.closest('li')?.classList.add('ativo');
        }
    });

    // Animar entradas de cards sem alterar o comportamento dos componentes.
    const observador = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animar-entrada');
                observador.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll('.card-jogo, .item-jogo-perfil, .card').forEach(elemento => {
        observador.observe(elemento);
    });

    const hamburgerBtn = document.getElementById('hamburgerBtn');
    const drawerOverlay = document.getElementById('drawerOverlay');
    const corpo = document.body;

    // Função para aplicar o estado da sidebar
    const aplicarEstadoSidebar = (estaFechada) => {
        const ehMobile = window.innerWidth <= 1024;
        
        if (estaFechada) {
            corpo.classList.add('sidebar-fechada');
            hamburgerBtn?.setAttribute('aria-expanded', 'false');
            
            if (ehMobile) {
                drawerOverlay?.classList.remove('ativo');
                setTimeout(() => {
                    if (drawerOverlay && !drawerOverlay.classList.contains('ativo')) {
                        drawerOverlay.style.display = 'none';
                    }
                }, 300);
            }
        } else {
            corpo.classList.remove('sidebar-fechada');
            hamburgerBtn?.setAttribute('aria-expanded', 'true');
            
            if (ehMobile) {
                if (drawerOverlay) {
                    drawerOverlay.style.display = 'block';
                    // Pequeno delay para a transição de opacidade
                    setTimeout(() => drawerOverlay.classList.add('ativo'), 10);
                }
            }
        }
        localStorage.setItem('sidebar_fechada', estaFechada);
    };

    // Inicializar estado baseado no localStorage
    const estadoSalvo = localStorage.getItem('sidebar_fechada') === 'true';
    
    // No mobile, sempre começar fechada por padrão se não houver estado salvo
    const ehMobile = window.innerWidth <= 1024;
    if (localStorage.getItem('sidebar_fechada') === null && ehMobile) {
        aplicarEstadoSidebar(true);
    } else {
        aplicarEstadoSidebar(estadoSalvo);
    }

    if (hamburgerBtn) {
        hamburgerBtn.addEventListener('click', () => {
            const estaFechada = corpo.classList.contains('sidebar-fechada');
            aplicarEstadoSidebar(!estaFechada);
        });
    }

    if (drawerOverlay) {
        drawerOverlay.addEventListener('click', () => aplicarEstadoSidebar(true));
    }

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && !corpo.classList.contains('sidebar-fechada') && window.innerWidth <= 1024) {
            aplicarEstadoSidebar(true);
        }
    });

    // Fechar ao clicar em links no mobile
    document.querySelectorAll('.barra-lateral .menu-navegacao a').forEach(link => {
        link.addEventListener('click', () => {
            if (window.innerWidth <= 1024) {
                aplicarEstadoSidebar(true);
            }
        });
    });
});