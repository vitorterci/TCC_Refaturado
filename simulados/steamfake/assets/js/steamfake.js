const API_JOGOS = 'api/jogos.php';

function dinheiro(valor) {
  return Number(valor).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
}

function cardJogo(jogo) {
  const desconto = Number(jogo.desconto || 0);
  return `<article class="card">
    <a href="produto.php?slug=${encodeURIComponent(jogo.slug)}" aria-label="Ver ${jogo.nome}">
      <div class="cover"><img src="${jogo.imagem}" alt="Capa ilustrativa de ${jogo.nome}">${desconto ? `<span class="tag">-${desconto}%</span>` : ''}</div>
      <div class="card-content">
        <h3>${jogo.nome}</h3>
        <div class="meta"><span class="genre">${jogo.genero}</span><span class="rating">★ ${Number(jogo.avaliacao).toFixed(1)}</span></div>
        <div class="price-row">${desconto ? `<span class="old">${dinheiro(jogo.preco_original)}</span>` : '<span></span>'}<strong class="price">${dinheiro(jogo.preco_atual)}</strong></div>
      </div>
    </a>
  </article>`;
}

async function carregarJogos() {
  const resposta = await fetch(API_JOGOS, { headers: { Accept: 'application/json' } });
  if (!resposta.ok) throw new Error('Falha ao carregar catálogo');
  return resposta.json();
}

function renderizar(lista, alvo) {
  alvo.innerHTML = lista.length ? lista.map(cardJogo).join('') : '<div class="empty">Nenhum jogo encontrado para esta busca.</div>';
}

document.addEventListener('DOMContentLoaded', async () => {
  const grade = document.querySelector('[data-catalogo]');
  const busca = document.querySelector('[data-busca]');
  if (!grade) return;
  try {
    const jogos = await carregarJogos();
    const ofertas = jogos.filter(jogo => Number(jogo.desconto) > 0);
    const termoInicial = busca ? busca.value.toLocaleLowerCase('pt-BR').trim() : '';
    const jogosVisiveis = termoInicial ? jogos.filter(j => `${j.nome} ${j.genero}`.toLocaleLowerCase('pt-BR').includes(termoInicial)) : jogos;
    renderizar(jogosVisiveis.slice(0, 8), grade);
    document.querySelectorAll('[data-section]').forEach(sec => {
      const tipo = sec.dataset.section;
      const destino = sec.querySelector('[data-grid]');
      if (tipo === 'ofertas') renderizar(ofertas.slice(0, 4), destino);
      if (tipo === 'vendidos') renderizar(jogos.slice(4, 8), destino);
      if (tipo === 'lancamentos') renderizar(jogos.slice(8, 12), destino);
    });
    if (busca) busca.addEventListener('input', event => {
      const termo = event.target.value.toLocaleLowerCase('pt-BR').trim();
      renderizar(jogos.filter(j => `${j.nome} ${j.genero}`.toLocaleLowerCase('pt-BR').includes(termo)), grade);
    });
  } catch (erro) {
    grade.innerHTML = '<div class="empty">Não foi possível carregar o catálogo. Verifique o Apache e o PHP no XAMPP.</div>';
  }
});
