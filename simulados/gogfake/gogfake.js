const GOGFAKE_API = 'api/jogos.php';
const brl = valor => Number(valor).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

function cardJogo(jogo) {
  return `<article class="gf-card">
    <a href="${jogo.url}"><img src="${jogo.imagem}" alt="Capa de ${jogo.nome}" loading="lazy"></a>
    <div class="gf-card-body">
      <h3><a href="${jogo.url}">${jogo.nome}</a></h3>
      <div class="gf-meta">${jogo.genero} · ${jogo.plataforma}</div>
      <div class="gf-price"><div><div class="gf-old">${brl(jogo.preco_original)}</div><div class="gf-current">${brl(jogo.preco_atual)}</div></div><span class="gf-discount">-${jogo.desconto}%</span></div>
    </div>
  </article>`;
}

async function carregarJogos(opcoes = {}, destino = '#gf-jogos') {
  const elemento = document.querySelector(destino);
  if (!elemento) return;
  const params = new URLSearchParams(opcoes);
  elemento.innerHTML = '<p class="gf-empty">Carregando catálogo...</p>';
  try {
    const resposta = await fetch(`${GOGFAKE_API}?${params}`);
    const dados = await resposta.json();
    if (!dados.success || !dados.jogos.length) {
      elemento.innerHTML = '<p class="gf-empty">Nenhum jogo encontrado para estes filtros.</p>';
      return;
    }
    elemento.innerHTML = dados.jogos.map(cardJogo).join('');
  } catch (erro) {
    elemento.innerHTML = '<p class="gf-empty">Não foi possível carregar o catálogo local. Verifique o XAMPP e o MySQL.</p>';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('[data-gf-search]');
  form?.addEventListener('submit', event => {
    event.preventDefault();
    const busca = form.querySelector('input').value.trim();
    window.location.href = `ofertas.html?busca=${encodeURIComponent(busca)}`;
  });

  const filtros = document.querySelector('[data-gf-filters]');
  filtros?.addEventListener('change', () => {
    carregarJogos({ genero: filtros.genero.value, ordem: filtros.ordem.value, limite: 30 });
  });

  const busca = new URLSearchParams(window.location.search).get('busca') || '';
  if (document.querySelector('#gf-jogos')) {
    carregarJogos({ busca, limite: 30 });
  }
});
