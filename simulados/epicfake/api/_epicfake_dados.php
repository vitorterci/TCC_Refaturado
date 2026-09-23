<?php
/**
 * Catálogo local da EpicFake.
 * Os dados são utilizados pelos endpoints para inicialização automática do MySQL.
 */

function epicfakeCatalogo(): array
{
    return [
        [
            'id' => 1, 'slug' => 'cyberpunk-2077', 'nome' => 'Cyberpunk 2077',
            'descricao' => 'Um RPG de ação em mundo aberto ambientado em Night City, uma megalópole obcecada por poder, glamour e modificações corporais.',
            'plataforma' => 'PC', 'genero' => 'RPG / Ação', 'avaliacao' => 4.7,
            'preco_original' => 199.90, 'preco_atual' => 89.90, 'desconto' => 55,
            'imagem' => 'assets/img/cyberpunk-2077.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 100,
            'desenvolvedora' => 'CD PROJEKT RED', 'tamanho' => '70 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 2, 'slug' => 'red-dead-redemption-2', 'nome' => 'Red Dead Redemption 2',
            'descricao' => 'Acompanhe Arthur Morgan e a gangue Van der Linde em uma jornada épica pelo coração da América no fim da era dos fora da lei.',
            'plataforma' => 'PC', 'genero' => 'Ação / Aventura', 'avaliacao' => 4.9,
            'preco_original' => 249.90, 'preco_atual' => 139.90, 'desconto' => 44,
            'imagem' => 'assets/img/red-dead-redemption-2.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 99,
            'desenvolvedora' => 'Rockstar Games', 'tamanho' => '150 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 3, 'slug' => 'hogwarts-legacy', 'nome' => 'Hogwarts Legacy',
            'descricao' => 'Explore o mundo bruxo do século XIX, descubra uma habilidade ancestral e escreva sua própria história em Hogwarts.',
            'plataforma' => 'PC', 'genero' => 'RPG / Aventura', 'avaliacao' => 4.6,
            'preco_original' => 249.90, 'preco_atual' => 99.90, 'desconto' => 60,
            'imagem' => 'assets/img/hogwarts-legacy.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 96,
            'desenvolvedora' => 'Avalanche Software', 'tamanho' => '85 GB', 'classificacao' => '12 anos'
        ],
        [
            'id' => 4, 'slug' => 'forza-horizon-5', 'nome' => 'Forza Horizon 5',
            'descricao' => 'Dirija pelas paisagens vibrantes do México em uma celebração automotiva repleta de liberdade, velocidade e descobertas.',
            'plataforma' => 'PC / Xbox', 'genero' => 'Corrida', 'avaliacao' => 4.8,
            'preco_original' => 249.90, 'preco_atual' => 124.90, 'desconto' => 50,
            'imagem' => 'assets/img/forza-horizon-5.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 95,
            'desenvolvedora' => 'Playground Games', 'tamanho' => '110 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 5, 'slug' => 'elden-ring', 'nome' => 'Elden Ring',
            'descricao' => 'Atravesse as Terras Intermédias em uma fantasia sombria criada em colaboração por Hidetaka Miyazaki e George R. R. Martin.',
            'plataforma' => 'PC', 'genero' => 'RPG / Soulslike', 'avaliacao' => 4.9,
            'preco_original' => 229.90, 'preco_atual' => 159.90, 'desconto' => 30,
            'imagem' => 'assets/img/elden-ring.svg', 'categoria' => 'popular', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 98,
            'desenvolvedora' => 'FromSoftware', 'tamanho' => '60 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 6, 'slug' => 'baldurs-gate-3', 'nome' => "Baldur's Gate 3",
            'descricao' => 'Reúna seu grupo e retorne aos Reinos Esquecidos em uma aventura de RPG de nova geração, com escolhas que moldam tudo.',
            'plataforma' => 'PC / Mac', 'genero' => 'RPG / Estratégia', 'avaliacao' => 4.9,
            'preco_original' => 199.90, 'preco_atual' => 129.90, 'desconto' => 35,
            'imagem' => 'assets/img/baldurs-gate-3.svg', 'categoria' => 'popular', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 97,
            'desenvolvedora' => 'Larian Studios', 'tamanho' => '150 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 7, 'slug' => 'the-witcher-3', 'nome' => 'The Witcher 3: Wild Hunt',
            'descricao' => 'Torne-se Geralt de Rívia, um caçador de monstros profissional em busca de uma criança da profecia.',
            'plataforma' => 'PC', 'genero' => 'RPG / Aventura', 'avaliacao' => 4.8,
            'preco_original' => 119.90, 'preco_atual' => 39.90, 'desconto' => 67,
            'imagem' => 'assets/img/the-witcher-3.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 94,
            'desenvolvedora' => 'CD PROJEKT RED', 'tamanho' => '50 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 8, 'slug' => 'minecraft', 'nome' => 'Minecraft',
            'descricao' => 'Crie, explore e sobreviva em um universo de blocos onde sua imaginação é a única fronteira.',
            'plataforma' => 'PC / Console', 'genero' => 'Sandbox / Sobrevivência', 'avaliacao' => 4.8,
            'preco_original' => 129.90, 'preco_atual' => 99.90, 'desconto' => 23,
            'imagem' => 'assets/img/minecraft.svg', 'categoria' => 'popular', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 93,
            'desenvolvedora' => 'Mojang Studios', 'tamanho' => '4 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 9, 'slug' => 'gta-v', 'nome' => 'Grand Theft Auto V',
            'descricao' => 'Viva uma história de crime e ambição em Los Santos, com campanha cinematográfica e mundo online em constante evolução.',
            'plataforma' => 'PC', 'genero' => 'Ação / Mundo Aberto', 'avaliacao' => 4.7,
            'preco_original' => 149.90, 'preco_atual' => 74.90, 'desconto' => 50,
            'imagem' => 'assets/img/gta-v.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 92,
            'desenvolvedora' => 'Rockstar Games', 'tamanho' => '110 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 10, 'slug' => 'resident-evil-4', 'nome' => 'Resident Evil 4',
            'descricao' => 'Uma releitura moderna do clássico de terror e sobrevivência que redefiniu o gênero com ação intensa e suspense.',
            'plataforma' => 'PC', 'genero' => 'Terror / Ação', 'avaliacao' => 4.8,
            'preco_original' => 199.90, 'preco_atual' => 119.90, 'desconto' => 40,
            'imagem' => 'assets/img/resident-evil-4.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 91,
            'desenvolvedora' => 'Capcom', 'tamanho' => '67 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 11, 'slug' => 'assassins-creed-mirage', 'nome' => "Assassin's Creed Mirage",
            'descricao' => 'Viva a transformação de Basim, um ladrão de rua que se torna um Mestre Assassino na Bagdá do século IX.',
            'plataforma' => 'PC', 'genero' => 'Ação / Furtividade', 'avaliacao' => 4.4,
            'preco_original' => 199.90, 'preco_atual' => 89.90, 'desconto' => 55,
            'imagem' => 'assets/img/assassins-creed-mirage.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 86,
            'desenvolvedora' => 'Ubisoft Bordeaux', 'tamanho' => '40 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 12, 'slug' => 'starfield', 'nome' => 'Starfield',
            'descricao' => 'Crie seu personagem e explore a galáxia em uma nova geração de RPG espacial dos criadores de Skyrim.',
            'plataforma' => 'PC / Xbox', 'genero' => 'RPG / Ficção científica', 'avaliacao' => 4.2,
            'preco_original' => 299.90, 'preco_atual' => 179.90, 'desconto' => 40,
            'imagem' => 'assets/img/starfield.svg', 'categoria' => 'lancamento', 'gratuito' => 0, 'lancamento' => 1, 'popularidade' => 88,
            'desenvolvedora' => 'Bethesda Game Studios', 'tamanho' => '125 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 13, 'slug' => 'helldivers-2', 'nome' => 'Helldivers 2',
            'descricao' => 'A união faz a força em um tiro em terceira pessoa cooperativo, caótico e repleto de batalhas pela liberdade.',
            'plataforma' => 'PC / PS5', 'genero' => 'Ação / Cooperativo', 'avaliacao' => 4.7,
            'preco_original' => 199.90, 'preco_atual' => 149.90, 'desconto' => 25,
            'imagem' => 'assets/img/helldivers-2.svg', 'categoria' => 'lancamento', 'gratuito' => 0, 'lancamento' => 1, 'popularidade' => 89,
            'desenvolvedora' => 'Arrowhead Game Studios', 'tamanho' => '100 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 14, 'slug' => 'hades', 'nome' => 'Hades',
            'descricao' => 'Desafie o deus dos mortos em uma fuga do submundo que mistura ação veloz, narrativa dinâmica e mitologia grega.',
            'plataforma' => 'PC / Switch', 'genero' => 'Ação / Roguelike', 'avaliacao' => 4.9,
            'preco_original' => 99.90, 'preco_atual' => 49.90, 'desconto' => 50,
            'imagem' => 'assets/img/hades.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 90,
            'desenvolvedora' => 'Supergiant Games', 'tamanho' => '15 GB', 'classificacao' => '12 anos'
        ],
        [
            'id' => 15, 'slug' => 'dead-by-daylight', 'nome' => 'Dead by Daylight',
            'descricao' => 'Um terror multiplayer assimétrico em que um assassino enfrenta quatro sobreviventes em uma luta pela vida.',
            'plataforma' => 'PC / Console', 'genero' => 'Terror / Multiplayer', 'avaliacao' => 4.5,
            'preco_original' => 79.90, 'preco_atual' => 31.90, 'desconto' => 60,
            'imagem' => 'assets/img/dead-by-daylight.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 85,
            'desenvolvedora' => 'Behaviour Interactive', 'tamanho' => '50 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 16, 'slug' => 'rocket-league', 'nome' => 'Rocket League',
            'descricao' => 'Futebol com carros movidos a foguete, partidas rápidas e habilidade para jogadores de todos os níveis.',
            'plataforma' => 'PC / Console', 'genero' => 'Esporte / Multiplayer', 'avaliacao' => 4.6,
            'preco_original' => 0.00, 'preco_atual' => 0.00, 'desconto' => 0,
            'imagem' => 'assets/img/rocket-league.svg', 'categoria' => 'gratuito', 'gratuito' => 1, 'lancamento' => 0, 'popularidade' => 87,
            'desenvolvedora' => 'Psyonix', 'tamanho' => '25 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 17, 'slug' => 'fortnite', 'nome' => 'Fortnite',
            'descricao' => 'Construa, lute e crie em um universo social que reúne battle royale, experiências e eventos ao vivo.',
            'plataforma' => 'PC / Console / Mobile', 'genero' => 'Ação / Battle Royale', 'avaliacao' => 4.4,
            'preco_original' => 0.00, 'preco_atual' => 0.00, 'desconto' => 0,
            'imagem' => 'assets/img/fortnite.svg', 'categoria' => 'gratuito', 'gratuito' => 1, 'lancamento' => 0, 'popularidade' => 100,
            'desenvolvedora' => 'EpicFake Studios', 'tamanho' => '45 GB', 'classificacao' => '12 anos'
        ],
        [
            'id' => 18, 'slug' => 'fall-guys', 'nome' => 'Fall Guys',
            'descricao' => 'Supere pistas absurdas e concorrentes coloridos em uma gincana multiplayer cheia de quedas e risadas.',
            'plataforma' => 'PC / Console', 'genero' => 'Party / Multiplayer', 'avaliacao' => 4.3,
            'preco_original' => 0.00, 'preco_atual' => 0.00, 'desconto' => 0,
            'imagem' => 'assets/img/fall-guys.svg', 'categoria' => 'gratuito', 'gratuito' => 1, 'lancamento' => 0, 'popularidade' => 82,
            'desenvolvedora' => 'Mediatonic', 'tamanho' => '2 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 19, 'slug' => 'warframe', 'nome' => 'Warframe',
            'descricao' => 'Desperte como um guerreiro Tenno e domine armaduras biomecânicas em combates cooperativos de ficção científica.',
            'plataforma' => 'PC / Console', 'genero' => 'Ação / RPG', 'avaliacao' => 4.5,
            'preco_original' => 0.00, 'preco_atual' => 0.00, 'desconto' => 0,
            'imagem' => 'assets/img/warframe.svg', 'categoria' => 'gratuito', 'gratuito' => 1, 'lancamento' => 0, 'popularidade' => 79,
            'desenvolvedora' => 'Digital Extremes', 'tamanho' => '50 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 20, 'slug' => 'destiny-2', 'nome' => 'Destiny 2',
            'descricao' => 'Defenda a última cidade segura da humanidade e descubra novos poderes em um universo de ação compartilhado.',
            'plataforma' => 'PC / Console', 'genero' => 'FPS / MMO', 'avaliacao' => 4.3,
            'preco_original' => 0.00, 'preco_atual' => 0.00, 'desconto' => 0,
            'imagem' => 'assets/img/destiny-2.svg', 'categoria' => 'gratuito', 'gratuito' => 1, 'lancamento' => 0, 'popularidade' => 84,
            'desenvolvedora' => 'Bungie', 'tamanho' => '105 GB', 'classificacao' => '14 anos'
        ],
        [
            'id' => 21, 'slug' => 'dragon-age-the-veilguard', 'nome' => 'Dragon Age: The Veilguard',
            'descricao' => 'Monte sua equipe de heróis e enfrente uma ameaça ancestral em uma nova aventura de fantasia narrativa.',
            'plataforma' => 'PC / Console', 'genero' => 'RPG / Aventura', 'avaliacao' => 4.5,
            'preco_original' => 299.90, 'preco_atual' => 209.90, 'desconto' => 30,
            'imagem' => 'assets/img/dragon-age-the-veilguard.svg', 'categoria' => 'lancamento', 'gratuito' => 0, 'lancamento' => 1, 'popularidade' => 80,
            'desenvolvedora' => 'BioWare', 'tamanho' => '100 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 22, 'slug' => 'black-myth-wukong', 'nome' => 'Black Myth: Wukong',
            'descricao' => 'Encare criaturas lendárias e desvende a verdade por trás de uma lenda chinesa em um RPG de ação cinematográfico.',
            'plataforma' => 'PC / PS5', 'genero' => 'RPG / Ação', 'avaliacao' => 4.6,
            'preco_original' => 249.90, 'preco_atual' => 189.90, 'desconto' => 24,
            'imagem' => 'assets/img/black-myth-wukong.svg', 'categoria' => 'lancamento', 'gratuito' => 0, 'lancamento' => 1, 'popularidade' => 91,
            'desenvolvedora' => 'Game Science', 'tamanho' => '130 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 23, 'slug' => 'palworld', 'nome' => 'Palworld',
            'descricao' => 'Colecione criaturas misteriosas, construa sua base e sobreviva em um mundo aberto repleto de possibilidades.',
            'plataforma' => 'PC / Xbox', 'genero' => 'Sobrevivência / Aventura', 'avaliacao' => 4.3,
            'preco_original' => 99.90, 'preco_atual' => 69.90, 'desconto' => 30,
            'imagem' => 'assets/img/palworld.svg', 'categoria' => 'popular', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 83,
            'desenvolvedora' => 'Pocketpair', 'tamanho' => '40 GB', 'classificacao' => '12 anos'
        ],
        [
            'id' => 24, 'slug' => 'stardew-valley', 'nome' => 'Stardew Valley',
            'descricao' => 'Transforme um terreno abandonado em um lar, cultive relações e descubra os segredos de um vale acolhedor.',
            'plataforma' => 'PC / Console / Mobile', 'genero' => 'Simulação / RPG', 'avaliacao' => 4.9,
            'preco_original' => 39.90, 'preco_atual' => 24.90, 'desconto' => 38,
            'imagem' => 'assets/img/stardew-valley.svg', 'categoria' => 'popular', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 88,
            'desenvolvedora' => 'ConcernedApe', 'tamanho' => '1 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 25, 'slug' => 'it-takes-two', 'nome' => 'It Takes Two',
            'descricao' => 'Uma aventura cooperativa criada exclusivamente para dois, com desafios que transformam a relação entre Cody e May.',
            'plataforma' => 'PC / Console', 'genero' => 'Aventura / Cooperativo', 'avaliacao' => 4.8,
            'preco_original' => 149.90, 'preco_atual' => 59.90, 'desconto' => 60,
            'imagem' => 'assets/img/it-takes-two.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 89,
            'desenvolvedora' => 'Hazelight Studios', 'tamanho' => '50 GB', 'classificacao' => '12 anos'
        ],
        [
            'id' => 26, 'slug' => 'doom-eternal', 'nome' => 'DOOM Eternal',
            'descricao' => 'Torne-se o Slayer e abra caminho por hordas demoníacas em uma campanha frenética e brutal.',
            'plataforma' => 'PC', 'genero' => 'FPS / Ação', 'avaliacao' => 4.8,
            'preco_original' => 149.90, 'preco_atual' => 44.90, 'desconto' => 70,
            'imagem' => 'assets/img/doom-eternal.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 86,
            'desenvolvedora' => 'id Software', 'tamanho' => '80 GB', 'classificacao' => '18 anos'
        ],
        [
            'id' => 27, 'slug' => 'civilization-vi', 'nome' => 'Sid Meier’s Civilization VI',
            'descricao' => 'Construa um império capaz de resistir ao teste do tempo em um clássico de estratégia por turnos.',
            'plataforma' => 'PC / Mac', 'genero' => 'Estratégia / Simulação', 'avaliacao' => 4.5,
            'preco_original' => 129.90, 'preco_atual' => 19.90, 'desconto' => 85,
            'imagem' => 'assets/img/civilization-vi.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 78,
            'desenvolvedora' => 'Firaxis Games', 'tamanho' => '12 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 28, 'slug' => 'among-us', 'nome' => 'Among Us',
            'descricao' => 'Trabalhe em equipe, mas fique atento: entre os tripulantes há impostores decididos a sabotar a missão.',
            'plataforma' => 'PC / Mobile', 'genero' => 'Party / Dedução', 'avaliacao' => 4.4,
            'preco_original' => 19.90, 'preco_atual' => 9.90, 'desconto' => 50,
            'imagem' => 'assets/img/among-us.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 76,
            'desenvolvedora' => 'Innersloth', 'tamanho' => '1 GB', 'classificacao' => 'L'
        ],
        [
            'id' => 29, 'slug' => 'control', 'nome' => 'Control',
            'descricao' => 'Domine poderes sobrenaturais e enfrente uma ameaça inexplicável dentro da enigmática Agência Federal de Controle.',
            'plataforma' => 'PC', 'genero' => 'Ação / Ficção científica', 'avaliacao' => 4.5,
            'preco_original' => 149.90, 'preco_atual' => 34.90, 'desconto' => 77,
            'imagem' => 'assets/img/control.svg', 'categoria' => 'promocao', 'gratuito' => 0, 'lancamento' => 0, 'popularidade' => 81,
            'desenvolvedora' => 'Remedy Entertainment', 'tamanho' => '42 GB', 'classificacao' => '16 anos'
        ],
        [
            'id' => 30, 'slug' => 'alan-wake-2', 'nome' => 'Alan Wake 2',
            'descricao' => 'Dois protagonistas enfrentam uma história de terror psicológico que atravessa a fronteira entre ficção e realidade.',
            'plataforma' => 'PC / PS5 / Xbox', 'genero' => 'Terror / Aventura', 'avaliacao' => 4.7,
            'preco_original' => 249.90, 'preco_atual' => 169.90, 'desconto' => 32,
            'imagem' => 'assets/img/alan-wake-2.svg', 'categoria' => 'lancamento', 'gratuito' => 0, 'lancamento' => 1, 'popularidade' => 87,
            'desenvolvedora' => 'Remedy Entertainment', 'tamanho' => '90 GB', 'classificacao' => '16 anos'
        ]
    ];
}

function epicfakeEncontrarJogo(string $identificador): ?array
{
    $identificador = trim($identificador);
    foreach (epicfakeCatalogo() as $jogo) {
        if ((string)$jogo['id'] === $identificador || $jogo['slug'] === $identificador) {
            return $jogo;
        }
    }
    return null;
}
?>
