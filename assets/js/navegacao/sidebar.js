/* ── Sidebar retrátil com persistência ── */
document.addEventListener('DOMContentLoaded', () => {
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
