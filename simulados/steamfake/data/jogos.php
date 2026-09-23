<?php
/**
 * Catálogo local da SteamFake. Em produção local, o seed SQL replica esta estrutura
 * na tabela steamfake_jogos; o fallback mantém a vitrine funcional mesmo antes da importação.
 */
function steamfake_catalogo(): array
{
    return [
        ['id'=>1,'nome'=>'Cyberpunk 2077','slug'=>'cyberpunk-2077','descricao'=>'RPG de ação em mundo aberto ambientado em Night City, uma megalópole obcecada por poder, glamour e modificações corporais.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'RPG / Ação','avaliacao'=>4.7,'preco_original'=>199.90,'preco_atual'=>99.95,'desconto'=>50,'promocao_status'=>'Oferta por tempo limitado'],
        ['id'=>2,'nome'=>'Red Dead Redemption 2','slug'=>'red-dead-redemption-2','descricao'=>'Acompanhe Arthur Morgan e a gangue Van der Linde em uma jornada épica pelo Velho Oeste americano.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Aventura','avaliacao'=>4.9,'preco_original'=>249.90,'preco_atual'=>124.95,'desconto'=>50,'promocao_status'=>'Oferta por tempo limitado'],
        ['id'=>3,'nome'=>'Hogwarts Legacy','slug'=>'hogwarts-legacy','descricao'=>'Explore Hogwarts no século XIX, aprenda feitiços e descubra uma aventura inédita no mundo bruxo.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'RPG / Aventura','avaliacao'=>4.6,'preco_original'=>249.90,'preco_atual'=>124.95,'desconto'=>50,'promocao_status'=>'Oferta por tempo limitado'],
        ['id'=>4,'nome'=>'Forza Horizon 5','slug'=>'forza-horizon-5','descricao'=>'Corra pelas paisagens vibrantes do México em um festival automotivo de mundo aberto.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Corrida','avaliacao'=>4.8,'preco_original'=>249.90,'preco_atual'=>149.94,'desconto'=>40,'promocao_status'=>'Oferta ativa'],
        ['id'=>5,'nome'=>'Elden Ring','slug'=>'elden-ring','descricao'=>'Uma fantasia sombria e grandiosa da FromSoftware, com exploração livre, combates intensos e mistérios antigos.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'RPG / Soulslike','avaliacao'=>4.9,'preco_original'=>229.90,'preco_atual'=>160.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
        ['id'=>6,'nome'=>'Baldur’s Gate 3','slug'=>'baldurs-gate-3','descricao'=>'Reúna seu grupo e viva uma aventura de RPG baseada em escolhas, dados e consequências surpreendentes.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'RPG / Estratégia','avaliacao'=>4.9,'preco_original'=>199.90,'preco_atual'=>139.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
        ['id'=>7,'nome'=>'Minecraft','slug'=>'minecraft','descricao'=>'Construa, explore e sobreviva em um universo de blocos com possibilidades praticamente infinitas.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Sandbox / Aventura','avaliacao'=>4.8,'preco_original'=>119.90,'preco_atual'=>119.90,'desconto'=>0,'promocao_status'=>'Preço regular'],
        ['id'=>8,'nome'=>'The Witcher 3: Wild Hunt','slug'=>'the-witcher-3-wild-hunt','descricao'=>'Como Geralt de Rívia, rastreie monstros e atravesse um continente em guerra em busca de Ciri.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'RPG / Ação','avaliacao'=>4.9,'preco_original'=>149.90,'preco_atual'=>44.97,'desconto'=>70,'promocao_status'=>'Oferta relâmpago'],
        ['id'=>9,'nome'=>'Grand Theft Auto V','slug'=>'grand-theft-auto-v','descricao'=>'Três criminosos muito diferentes se unem em uma série de golpes na cidade de Los Santos.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Mundo aberto','avaliacao'=>4.7,'preco_original'=>99.90,'preco_atual'=>24.97,'desconto'=>75,'promocao_status'=>'Oferta relâmpago'],
        ['id'=>10,'nome'=>'Hades','slug'=>'hades','descricao'=>'Desafie o deus dos mortos em uma fuga dinâmica pelo submundo, com narrativa que evolui a cada tentativa.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Roguelike / Ação','avaliacao'=>4.9,'preco_original'=>89.90,'preco_atual'=>44.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>11,'nome'=>'Hollow Knight','slug'=>'hollow-knight','descricao'=>'Desbrave um reino subterrâneo em ruínas, repleto de criaturas, segredos e batalhas precisas.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Metroidvania','avaliacao'=>4.8,'preco_original'=>57.90,'preco_atual'=>28.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>12,'nome'=>'Dead Cells','slug'=>'dead-cells','descricao'=>'Um roguelite de ação com combate veloz, exploração ramificada e uma ilha cheia de perigos.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Roguelite / Ação','avaliacao'=>4.7,'preco_original'=>59.90,'preco_atual'=>35.94,'desconto'=>40,'promocao_status'=>'Oferta ativa'],
        ['id'=>13,'nome'=>'Stardew Valley','slug'=>'stardew-valley','descricao'=>'Comece uma nova vida no campo, cultive sua fazenda, faça amizades e descubra os segredos do vale.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Simulação / RPG','avaliacao'=>4.9,'preco_original'=>39.90,'preco_atual'=>19.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>14,'nome'=>'Resident Evil 4','slug'=>'resident-evil-4','descricao'=>'Leon S. Kennedy enfrenta uma missão de resgate em uma vila isolada tomada por uma ameaça misteriosa.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Terror / Ação','avaliacao'=>4.8,'preco_original'=>249.90,'preco_atual'=>174.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
        ['id'=>15,'nome'=>'Street Fighter 6','slug'=>'street-fighter-6','descricao'=>'A nova geração dos jogos de luta traz modos competitivos, criação de avatar e combates acessíveis.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Luta','avaliacao'=>4.6,'preco_original'=>249.90,'preco_atual'=>174.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
        ['id'=>16,'nome'=>'Bioshock Infinite','slug'=>'bioshock-infinite','descricao'=>'Viaje até a cidade aérea de Columbia em uma aventura narrativa de ficção científica e reviravoltas.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'FPS / Narrativa','avaliacao'=>4.6,'preco_original'=>79.90,'preco_atual'=>15.98,'desconto'=>80,'promocao_status'=>'Oferta relâmpago'],
        ['id'=>17,'nome'=>'Portal 2','slug'=>'portal-2','descricao'=>'Resolva quebra-cabeças com portais e encare a inteligência artificial mais sarcástica dos laboratórios.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Puzzle / Cooperação','avaliacao'=>4.9,'preco_original'=>36.90,'preco_atual'=>7.38,'desconto'=>80,'promocao_status'=>'Oferta relâmpago'],
        ['id'=>18,'nome'=>'The Sims 4','slug'=>'the-sims-4','descricao'=>'Crie personagens, construa casas e conduza histórias únicas em uma simulação de vida criativa.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Simulação','avaliacao'=>4.3,'preco_original'=>99.90,'preco_atual'=>49.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>19,'nome'=>'Terraria','slug'=>'terraria','descricao'=>'Cave, lute, explore e construa em um mundo 2D repleto de biomas, chefes e descobertas.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Sandbox / Aventura','avaliacao'=>4.8,'preco_original'=>39.90,'preco_atual'=>19.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>20,'nome'=>'Sekiro: Shadows Die Twice','slug'=>'sekiro-shadows-die-twice','descricao'=>'Domine a espada de um shinobi em uma jornada de vingança no Japão do período Sengoku.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Soulslike','avaliacao'=>4.8,'preco_original'=>229.90,'preco_atual'=>160.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
        ['id'=>21,'nome'=>'Death Stranding','slug'=>'death-stranding','descricao'=>'Reconecte uma América fragmentada em uma experiência de ação, exploração e ficção científica.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Aventura','avaliacao'=>4.4,'preco_original'=>199.90,'preco_atual'=>69.96,'desconto'=>65,'promocao_status'=>'Oferta relâmpago'],
        ['id'=>22,'nome'=>'No Man’s Sky','slug'=>'no-mans-sky','descricao'=>'Explore um universo praticamente infinito, construa bases e compartilhe descobertas com outros viajantes.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Exploração / Sobrevivência','avaliacao'=>4.5,'preco_original'=>199.90,'preco_atual'=>99.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>23,'nome'=>'Sea of Thieves','slug'=>'sea-of-thieves','descricao'=>'Viva aventuras piratas em alto-mar, sozinho ou em tripulação, em um mundo compartilhado.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Multiplayer','avaliacao'=>4.4,'preco_original'=>149.90,'preco_atual'=>74.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>24,'nome'=>'Cuphead','slug'=>'cuphead','descricao'=>'Enfrente chefes desafiadores em uma animação inspirada nos desenhos clássicos dos anos 1930.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Plataforma','avaliacao'=>4.7,'preco_original'=>79.90,'preco_atual'=>39.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>25,'nome'=>'Celeste','slug'=>'celeste','descricao'=>'Ajude Madeline a escalar uma montanha enquanto supera desafios precisos e conflitos interiores.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Plataforma / Narrativa','avaliacao'=>4.9,'preco_original'=>59.90,'preco_atual'=>29.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
        ['id'=>26,'nome'=>'Control','slug'=>'control','descricao'=>'Domine habilidades sobrenaturais e descubra uma agência secreta em uma aventura de ação paranormal.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Ação / Ficção científica','avaliacao'=>4.5,'preco_original'=>149.90,'preco_atual'=>44.97,'desconto'=>70,'promocao_status'=>'Oferta relâmpago'],
        ['id'=>27,'nome'=>'Doom Eternal','slug'=>'doom-eternal','descricao'=>'O Slayer está de volta para atravessar dimensões e destruir hordas demoníacas em combate explosivo.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'FPS / Ação','avaliacao'=>4.8,'preco_original'=>199.90,'preco_atual'=>99.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
	        ['id'=>28,'nome'=>'Final Fantasy VII Remake','slug'=>'final-fantasy-vii-remake','descricao'=>'Redescubra a história de Cloud e Avalanche em uma releitura visualmente impressionante de Midgar.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'RPG / Ação','avaliacao'=>4.6,'preco_original'=>349.90,'preco_atual'=>244.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
	        ['id'=>29,'nome'=>'Batalha Estelar: Origens','slug'=>'batalha-estelar-origens','descricao'=>'Comande uma frota rebelde e proteja colônias humanas em uma campanha tática de ficção científica.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Estratégia / Sci-Fi','avaliacao'=>4.2,'preco_original'=>79.90,'preco_atual'=>39.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
	        ['id'=>30,'nome'=>'Neon Drift Racing','slug'=>'neon-drift-racing','descricao'=>'Corridas arcade em pistas futuristas, com veículos personalizáveis, nitro e placares online.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Corrida / Arcade','avaliacao'=>4.1,'preco_original'=>69.90,'preco_atual'=>34.95,'desconto'=>50,'promocao_status'=>'Oferta ativa'],
	        ['id'=>31,'nome'=>'Alan Wake 2','slug'=>'alan-wake-2','descricao'=>'Dois protagonistas enfrentam uma história de terror psicológico que atravessa a fronteira entre ficção e realidade.','imagem'=>'assets/img/capa-padrao.svg','plataforma'=>'PC','genero'=>'Terror / Aventura','avaliacao'=>4.7,'preco_original'=>249.90,'preco_atual'=>174.93,'desconto'=>30,'promocao_status'=>'Oferta ativa'],
	    ];
}

function steamfake_enriquecer(array $jogo): array
{
    $jogo['loja'] = 'SteamFake';
    $jogo['url'] = 'produto.php?slug=' . rawurlencode($jogo['slug']);
    return $jogo;
}

function steamfake_buscar(array $filtros = []): array
{
    $catalogo = array_map('steamfake_enriquecer', steamfake_catalogo());
    if (!empty($filtros['slug'])) {
        return array_values(array_filter($catalogo, fn($j) => $j['slug'] === $filtros['slug']));
    }
    if (!empty($filtros['id'])) {
        return array_values(array_filter($catalogo, fn($j) => (int)$j['id'] === (int)$filtros['id']));
    }
    if (!empty($filtros['busca'])) {
        $termo = mb_strtolower(trim($filtros['busca']), 'UTF-8');
        $catalogo = array_values(array_filter($catalogo, fn($j) => str_contains(mb_strtolower($j['nome'].' '.$j['genero'], 'UTF-8'), $termo)));
    }
    if (isset($filtros['ofertas']) && $filtros['ofertas']) {
        $catalogo = array_values(array_filter($catalogo, fn($j) => $j['desconto'] > 0));
    }
    return $catalogo;
}
