-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/09/2026 às 13:07
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fake_epic`
--
CREATE DATABASE IF NOT EXISTS `fake_epic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fake_epic`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `descontos`
--

DROP TABLE IF EXISTS `descontos`;
CREATE TABLE `descontos` (
  `id` int(10) UNSIGNED NOT NULL,
  `preco_id` int(10) UNSIGNED NOT NULL,
  `percentual` decimal(5,2) NOT NULL DEFAULT 0.00,
  `inicio` datetime DEFAULT NULL,
  `fim` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `descontos`
--

INSERT INTO `descontos` (`id`, `preco_id`, `percentual`, `inicio`, `fim`, `ativo`, `data_atualizacao`) VALUES
(1, 1, 50.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(2, 2, 50.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(3, 3, 20.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(4, 4, 30.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(5, 5, 35.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(6, 6, 40.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(7, 7, 20.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38'),
(8, 8, 50.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:01:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `epicfake_jogos`
--

DROP TABLE IF EXISTS `epicfake_jogos`;
CREATE TABLE `epicfake_jogos` (
  `id` int(11) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `nome` varchar(180) NOT NULL,
  `descricao` text NOT NULL,
  `plataforma` varchar(100) NOT NULL,
  `genero` varchar(100) NOT NULL,
  `avaliacao` decimal(3,1) NOT NULL DEFAULT 0.0,
  `preco_original` decimal(10,2) NOT NULL DEFAULT 0.00,
  `preco_atual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `desconto` int(11) NOT NULL DEFAULT 0,
  `imagem` varchar(255) NOT NULL,
  `categoria` varchar(30) NOT NULL DEFAULT 'popular',
  `gratuito` tinyint(1) NOT NULL DEFAULT 0,
  `lancamento` tinyint(1) NOT NULL DEFAULT 0,
  `popularidade` int(11) NOT NULL DEFAULT 0,
  `desenvolvedora` varchar(180) NOT NULL,
  `tamanho` varchar(30) NOT NULL,
  `classificacao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `epicfake_jogos`
--

INSERT INTO `epicfake_jogos` (`id`, `slug`, `nome`, `descricao`, `plataforma`, `genero`, `avaliacao`, `preco_original`, `preco_atual`, `desconto`, `imagem`, `categoria`, `gratuito`, `lancamento`, `popularidade`, `desenvolvedora`, `tamanho`, `classificacao`) VALUES
(1, 'cyberpunk-2077', 'Cyberpunk 2077', 'Um RPG de ação em mundo aberto ambientado em Night City, uma megalópole obcecada por poder, glamour e modificações corporais.', 'PC', 'RPG / Ação', 4.7, 199.90, 89.90, 55, 'epicfake/assets/img/cyberpunk-2077.svg', 'promocao', 0, 0, 100, 'CD PROJEKT RED', '70 GB', '18 anos'),
(2, 'red-dead-redemption-2', 'Red Dead Redemption 2', 'Acompanhe Arthur Morgan e a gangue Van der Linde em uma jornada épica pelo coração da América no fim da era dos fora da lei.', 'PC', 'Ação / Aventura', 4.9, 249.90, 139.90, 44, 'epicfake/assets/img/red-dead-redemption-2.svg', 'promocao', 0, 0, 99, 'Rockstar Games', '150 GB', '18 anos'),
(3, 'hogwarts-legacy', 'Hogwarts Legacy', 'Explore o mundo bruxo do século XIX, descubra uma habilidade ancestral e escreva sua própria história em Hogwarts.', 'PC', 'RPG / Aventura', 4.6, 249.90, 99.90, 60, 'epicfake/assets/img/hogwarts-legacy.svg', 'promocao', 0, 0, 96, 'Avalanche Software', '85 GB', '12 anos'),
(4, 'forza-horizon-5', 'Forza Horizon 5', 'Dirija pelas paisagens vibrantes do México em uma celebração automotiva repleta de liberdade, velocidade e descobertas.', 'PC / Xbox', 'Corrida', 4.8, 249.90, 124.90, 50, 'epicfake/assets/img/forza-horizon-5.svg', 'promocao', 0, 0, 95, 'Playground Games', '110 GB', 'L'),
(5, 'elden-ring', 'Elden Ring', 'Atravesse as Terras Intermédias em uma fantasia sombria criada em colaboração por Hidetaka Miyazaki e George R. R. Martin.', 'PC', 'RPG / Soulslike', 4.9, 229.90, 159.90, 30, 'epicfake/assets/img/elden-ring.svg', 'popular', 0, 0, 98, 'FromSoftware', '60 GB', '16 anos'),
(6, 'baldurs-gate-3', 'Baldur\'s Gate 3', 'Reúna seu grupo e retorne aos Reinos Esquecidos em uma aventura de RPG de nova geração, com escolhas que moldam tudo.', 'PC / Mac', 'RPG / Estratégia', 4.9, 199.90, 129.90, 35, 'epicfake/assets/img/baldurs-gate-3.svg', 'popular', 0, 0, 97, 'Larian Studios', '150 GB', '16 anos'),
(7, 'the-witcher-3', 'The Witcher 3: Wild Hunt', 'Torne-se Geralt de Rívia, um caçador de monstros profissional em busca de uma criança da profecia.', 'PC', 'RPG / Aventura', 4.8, 119.90, 39.90, 67, 'epicfake/assets/img/the-witcher-3.svg', 'promocao', 0, 0, 94, 'CD PROJEKT RED', '50 GB', '18 anos'),
(8, 'minecraft', 'Minecraft', 'Crie, explore e sobreviva em um universo de blocos onde sua imaginação é a única fronteira.', 'PC / Console', 'Sandbox / Sobrevivência', 4.8, 129.90, 99.90, 23, 'epicfake/assets/img/minecraft.svg', 'popular', 0, 0, 93, 'Mojang Studios', '4 GB', 'L'),
(9, 'gta-v', 'Grand Theft Auto V', 'Viva uma história de crime e ambição em Los Santos, com campanha cinematográfica e mundo online em constante evolução.', 'PC', 'Ação / Mundo Aberto', 4.7, 149.90, 74.90, 50, 'epicfake/assets/img/gta-v.svg', 'promocao', 0, 0, 92, 'Rockstar Games', '110 GB', '18 anos'),
(10, 'resident-evil-4', 'Resident Evil 4', 'Uma releitura moderna do clássico de terror e sobrevivência que redefiniu o gênero com ação intensa e suspense.', 'PC', 'Terror / Ação', 4.8, 199.90, 119.90, 40, 'epicfake/assets/img/resident-evil-4.svg', 'promocao', 0, 0, 91, 'Capcom', '67 GB', '18 anos'),
(11, 'assassins-creed-mirage', 'Assassin\'s Creed Mirage', 'Viva a transformação de Basim, um ladrão de rua que se torna um Mestre Assassino na Bagdá do século IX.', 'PC', 'Ação / Furtividade', 4.4, 199.90, 89.90, 55, 'epicfake/assets/img/assassins-creed-mirage.svg', 'promocao', 0, 0, 86, 'Ubisoft Bordeaux', '40 GB', '16 anos'),
(12, 'starfield', 'Starfield', 'Crie seu personagem e explore a galáxia em uma nova geração de RPG espacial dos criadores de Skyrim.', 'PC / Xbox', 'RPG / Ficção científica', 4.2, 299.90, 179.90, 40, 'epicfake/assets/img/starfield.svg', 'lancamento', 0, 1, 88, 'Bethesda Game Studios', '125 GB', '16 anos'),
(13, 'helldivers-2', 'Helldivers 2', 'A união faz a força em um tiro em terceira pessoa cooperativo, caótico e repleto de batalhas pela liberdade.', 'PC / PS5', 'Ação / Cooperativo', 4.7, 199.90, 149.90, 25, 'epicfake/assets/img/helldivers-2.svg', 'lancamento', 0, 1, 89, 'Arrowhead Game Studios', '100 GB', '16 anos'),
(14, 'hades', 'Hades', 'Desafie o deus dos mortos em uma fuga do submundo que mistura ação veloz, narrativa dinâmica e mitologia grega.', 'PC / Switch', 'Ação / Roguelike', 4.9, 99.90, 49.90, 50, 'epicfake/assets/img/hades.svg', 'promocao', 0, 0, 90, 'Supergiant Games', '15 GB', '12 anos'),
(15, 'dead-by-daylight', 'Dead by Daylight', 'Um terror multiplayer assimétrico em que um assassino enfrenta quatro sobreviventes em uma luta pela vida.', 'PC / Console', 'Terror / Multiplayer', 4.5, 79.90, 31.90, 60, 'epicfake/assets/img/dead-by-daylight.svg', 'promocao', 0, 0, 85, 'Behaviour Interactive', '50 GB', '18 anos'),
(16, 'rocket-league', 'Rocket League', 'Futebol com carros movidos a foguete, partidas rápidas e habilidade para jogadores de todos os níveis.', 'PC / Console', 'Esporte / Multiplayer', 4.6, 0.00, 0.00, 0, 'epicfake/assets/img/rocket-league.svg', 'gratuito', 1, 0, 87, 'Psyonix', '25 GB', 'L'),
(17, 'fortnite', 'Fortnite', 'Construa, lute e crie em um universo social que reúne battle royale, experiências e eventos ao vivo.', 'PC / Console / Mobile', 'Ação / Battle Royale', 4.4, 0.00, 0.00, 0, 'epicfake/assets/img/fortnite.svg', 'gratuito', 1, 0, 100, 'EpicFake Studios', '45 GB', '12 anos'),
(18, 'fall-guys', 'Fall Guys', 'Supere pistas absurdas e concorrentes coloridos em uma gincana multiplayer cheia de quedas e risadas.', 'PC / Console', 'Party / Multiplayer', 4.3, 0.00, 0.00, 0, 'epicfake/assets/img/fall-guys.svg', 'gratuito', 1, 0, 82, 'Mediatonic', '2 GB', 'L'),
(19, 'warframe', 'Warframe', 'Desperte como um guerreiro Tenno e domine armaduras biomecânicas em combates cooperativos de ficção científica.', 'PC / Console', 'Ação / RPG', 4.5, 0.00, 0.00, 0, 'epicfake/assets/img/warframe.svg', 'gratuito', 1, 0, 79, 'Digital Extremes', '50 GB', '16 anos'),
(20, 'destiny-2', 'Destiny 2', 'Defenda a última cidade segura da humanidade e descubra novos poderes em um universo de ação compartilhado.', 'PC / Console', 'FPS / MMO', 4.3, 0.00, 0.00, 0, 'epicfake/assets/img/destiny-2.svg', 'gratuito', 1, 0, 84, 'Bungie', '105 GB', '14 anos'),
(21, 'dragon-age-the-veilguard', 'Dragon Age: The Veilguard', 'Monte sua equipe de heróis e enfrente uma ameaça ancestral em uma nova aventura de fantasia narrativa.', 'PC / Console', 'RPG / Aventura', 4.5, 299.90, 209.90, 30, 'epicfake/assets/img/dragon-age-the-veilguard.svg', 'lancamento', 0, 1, 80, 'BioWare', '100 GB', '16 anos'),
(22, 'black-myth-wukong', 'Black Myth: Wukong', 'Encare criaturas lendárias e desvende a verdade por trás de uma lenda chinesa em um RPG de ação cinematográfico.', 'PC / PS5', 'RPG / Ação', 4.6, 249.90, 189.90, 24, 'epicfake/assets/img/black-myth-wukong.svg', 'lancamento', 0, 1, 91, 'Game Science', '130 GB', '16 anos'),
(23, 'palworld', 'Palworld', 'Colecione criaturas misteriosas, construa sua base e sobreviva em um mundo aberto repleto de possibilidades.', 'PC / Xbox', 'Sobrevivência / Aventura', 4.3, 99.90, 69.90, 30, 'epicfake/assets/img/palworld.svg', 'popular', 0, 0, 83, 'Pocketpair', '40 GB', '12 anos'),
(24, 'stardew-valley', 'Stardew Valley', 'Transforme um terreno abandonado em um lar, cultive relações e descubra os segredos de um vale acolhedor.', 'PC / Console / Mobile', 'Simulação / RPG', 4.9, 39.90, 24.90, 38, 'epicfake/assets/img/stardew-valley.svg', 'popular', 0, 0, 88, 'ConcernedApe', '1 GB', 'L'),
(25, 'it-takes-two', 'It Takes Two', 'Uma aventura cooperativa criada exclusivamente para dois, com desafios que transformam a relação entre Cody e May.', 'PC / Console', 'Aventura / Cooperativo', 4.8, 149.90, 59.90, 60, 'epicfake/assets/img/it-takes-two.svg', 'promocao', 0, 0, 89, 'Hazelight Studios', '50 GB', '12 anos'),
(26, 'doom-eternal', 'DOOM Eternal', 'Torne-se o Slayer e abra caminho por hordas demoníacas em uma campanha frenética e brutal.', 'PC', 'FPS / Ação', 4.8, 149.90, 44.90, 70, 'epicfake/assets/img/doom-eternal.svg', 'promocao', 0, 0, 86, 'id Software', '80 GB', '18 anos'),
(27, 'civilization-vi', 'Sid Meier’s Civilization VI', 'Construa um império capaz de resistir ao teste do tempo em um clássico de estratégia por turnos.', 'PC / Mac', 'Estratégia / Simulação', 4.5, 129.90, 19.90, 85, 'epicfake/assets/img/civilization-vi.svg', 'promocao', 0, 0, 78, 'Firaxis Games', '12 GB', 'L'),
(28, 'among-us', 'Among Us', 'Trabalhe em equipe, mas fique atento: entre os tripulantes há impostores decididos a sabotar a missão.', 'PC / Mobile', 'Party / Dedução', 4.4, 19.90, 9.90, 50, 'epicfake/assets/img/among-us.svg', 'promocao', 0, 0, 76, 'Innersloth', '1 GB', 'L'),
(29, 'control', 'Control', 'Domine poderes sobrenaturais e enfrente uma ameaça inexplicável dentro da enigmática Agência Federal de Controle.', 'PC', 'Ação / Ficção científica', 4.5, 149.90, 34.90, 77, 'epicfake/assets/img/control.svg', 'promocao', 0, 0, 81, 'Remedy Entertainment', '42 GB', '16 anos'),
(30, 'alan-wake-2', 'Alan Wake 2', 'Dois protagonistas enfrentam uma história de terror psicológico que atravessa a fronteira entre ficção e realidade.', 'PC / PS5 / Xbox', 'Terror / Aventura', 4.7, 249.90, 169.90, 32, 'epicfake/assets/img/alan-wake-2.svg', 'lancamento', 0, 1, 87, 'Remedy Entertainment', '90 GB', '16 anos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `epicfake_ofertas`
--

DROP TABLE IF EXISTS `epicfake_ofertas`;
CREATE TABLE `epicfake_ofertas` (
  `id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(150) NOT NULL,
  `plataforma` varchar(60) NOT NULL DEFAULT 'PC',
  `preco_original` decimal(10,2) NOT NULL,
  `preco_atual` decimal(10,2) NOT NULL,
  `desconto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `url` varchar(500) NOT NULL,
  `loja` varchar(40) NOT NULL DEFAULT 'EpicFake',
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `epicfake_ofertas`
--

INSERT INTO `epicfake_ofertas` (`id`, `jogo_id`, `slug`, `plataforma`, `preco_original`, `preco_atual`, `desconto`, `url`, `loja`, `data_atualizacao`) VALUES
(1, 1, 'elden-ring', 'PC', 86.90, 86.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=elden-ring', 'EpicFake', '2026-09-11 15:13:17'),
(2, 2, 'god-of-war-ragnarok', 'PC', 123.90, 74.34, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=god-of-war-ragnarok', 'EpicFake', '2026-09-11 15:13:17'),
(3, 3, 'the-legend-of-zelda-totk', 'PC', 160.90, 128.72, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=the-legend-of-zelda-totk', 'EpicFake', '2026-09-11 15:13:17'),
(4, 4, 'baldurs-gate-3', 'PC', 197.90, 197.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=baldurs-gate-3', 'EpicFake', '2026-09-11 15:13:17'),
(5, 5, 'cyberpunk-2077', 'PC', 234.90, 234.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=cyberpunk-2077', 'EpicFake', '2026-09-11 15:13:17'),
(6, 6, 'red-dead-redemption-2', 'PC', 271.90, 163.14, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=red-dead-redemption-2', 'EpicFake', '2026-09-11 15:13:17'),
(7, 7, 'the-witcher-3', 'PC', 57.90, 46.32, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=the-witcher-3', 'EpicFake', '2026-09-11 15:13:17'),
(8, 8, 'hollow-knight', 'PC', 94.90, 94.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=hollow-knight', 'EpicFake', '2026-09-11 15:13:17'),
(9, 9, 'hades', 'PC', 131.90, 131.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=hades', 'EpicFake', '2026-09-11 15:13:17'),
(10, 10, 'celeste', 'PC', 168.90, 101.34, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=celeste', 'EpicFake', '2026-09-11 15:13:17'),
(11, 11, 'stardew-valley', 'PC', 205.90, 164.72, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=stardew-valley', 'EpicFake', '2026-09-11 15:13:17'),
(12, 12, 'terraria', 'PC', 242.90, 242.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=terraria', 'EpicFake', '2026-09-11 15:13:17'),
(13, 13, 'minecraft', 'PC', 279.90, 279.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=minecraft', 'EpicFake', '2026-09-11 15:13:17'),
(14, 14, 'gta-v', 'PC', 65.90, 39.54, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=gta-v', 'EpicFake', '2026-09-11 15:13:17'),
(15, 15, 'the-last-of-us-part-ii', 'PC', 102.90, 82.32, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=the-last-of-us-part-ii', 'EpicFake', '2026-09-11 15:13:17'),
(16, 16, 'ghost-of-tsushima', 'PC', 139.90, 139.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=ghost-of-tsushima', 'EpicFake', '2026-09-11 15:13:17'),
(17, 17, 'horizon-forbidden-west', 'PC', 176.90, 176.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=horizon-forbidden-west', 'EpicFake', '2026-09-11 15:13:17'),
(18, 18, 'spider-man-2', 'PC', 213.90, 128.34, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=spider-man-2', 'EpicFake', '2026-09-11 15:13:17'),
(19, 19, 'resident-evil-4-remake', 'PC', 250.90, 200.72, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=resident-evil-4-remake', 'EpicFake', '2026-09-11 15:13:17'),
(20, 20, 'alan-wake-2', 'PC', 287.90, 287.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=alan-wake-2', 'EpicFake', '2026-09-11 15:13:17'),
(21, 21, 'starfield', 'PC', 73.90, 73.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=starfield', 'EpicFake', '2026-09-11 15:13:17'),
(22, 22, 'final-fantasy-xvi', 'PC', 110.90, 66.54, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=final-fantasy-xvi', 'EpicFake', '2026-09-11 15:13:17'),
(23, 23, 'persona-5-royal', 'PC', 147.90, 118.32, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=persona-5-royal', 'EpicFake', '2026-09-11 15:13:17'),
(24, 24, 'nier-automata', 'PC', 184.90, 184.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=nier-automata', 'EpicFake', '2026-09-11 15:13:17'),
(25, 25, 'dark-souls-3', 'PC', 221.90, 221.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=dark-souls-3', 'EpicFake', '2026-09-11 15:13:17'),
(26, 26, 'sekiro', 'PC', 258.90, 155.34, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=sekiro', 'EpicFake', '2026-09-11 15:13:17'),
(27, 27, 'bloodborne', 'PC', 295.90, 236.72, 20.00, '/tcc/simulados/epicfake/jogo.php?slug=bloodborne', 'EpicFake', '2026-09-11 15:13:17'),
(28, 28, 'cuphead', 'PC', 81.90, 81.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=cuphead', 'EpicFake', '2026-09-11 15:13:17'),
(29, 29, 'ori-and-the-will-of-the-wisps', 'PC', 118.90, 118.90, 0.00, '/tcc/simulados/epicfake/jogo.php?slug=ori-and-the-will-of-the-wisps', 'EpicFake', '2026-09-11 15:13:17'),
(30, 30, 'it-takes-two', 'PC', 155.90, 93.54, 40.00, '/tcc/simulados/epicfake/jogo.php?slug=it-takes-two', 'EpicFake', '2026-09-11 15:13:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogos`
--

DROP TABLE IF EXISTS `jogos`;
CREATE TABLE `jogos` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(150) NOT NULL,
  `nome` varchar(180) NOT NULL,
  `descricao` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `genero` varchar(100) NOT NULL,
  `avaliacao` decimal(3,1) NOT NULL DEFAULT 0.0,
  `categoria` enum('popular','promocao','lancamento','gratuito') NOT NULL DEFAULT 'popular',
  `gratuito` tinyint(1) NOT NULL DEFAULT 0,
  `disponivel` tinyint(1) NOT NULL DEFAULT 1,
  `desenvolvedora` varchar(180) DEFAULT NULL,
  `tamanho` varchar(30) DEFAULT NULL,
  `classificacao` varchar(30) DEFAULT NULL,
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `jogos`
--

INSERT INTO `jogos` (`id`, `slug`, `nome`, `descricao`, `imagem`, `genero`, `avaliacao`, `categoria`, `gratuito`, `disponivel`, `desenvolvedora`, `tamanho`, `classificacao`, `data_atualizacao`) VALUES
(1, 'cyberpunk-2077', 'Cyberpunk 2077', 'RPG de ação em mundo aberto ambientado em Night City.', 'epicfake/assets/img/cyberpunk-2077.svg', 'RPG / Ação', 9.1, 'popular', 0, 1, 'CD Projekt Red', '70 GB', '18', '2026-08-27 11:01:38'),
(2, 'the-witcher-3', 'The Witcher 3: Wild Hunt', 'Uma aventura épica de fantasia em um mundo aberto repleto de escolhas.', 'epicfake/assets/img/the-witcher-3.svg', 'RPG / Fantasia', 9.5, 'popular', 0, 1, 'CD Projekt Red', '50 GB', '16', '2026-08-27 11:01:38'),
(3, 'baldurs-gate-3', 'Baldur\'s Gate 3', 'RPG narrativo baseado em Dungeons & Dragons com liberdade de decisões.', 'epicfake/assets/img/baldurs-gate-3.svg', 'RPG', 9.7, 'popular', 0, 1, 'Larian Studios', '150 GB', '16', '2026-08-27 11:01:38'),
(4, 'elden-ring', 'Elden Ring', 'Uma jornada de fantasia sombria em um vasto mundo aberto.', 'epicfake/assets/img/elden-ring.svg', 'RPG / Ação', 9.4, 'popular', 0, 1, 'FromSoftware', '60 GB', '16', '2026-08-27 11:01:38'),
(5, 'hogwarts-legacy', 'Hogwarts Legacy', 'Explore Hogwarts e descubra sua própria história no mundo bruxo.', 'epicfake/assets/img/hogwarts-legacy.svg', 'Ação / Aventura', 8.8, 'lancamento', 0, 1, 'Avalanche Software', '85 GB', '12', '2026-08-27 11:01:38'),
(6, 'resident-evil-4', 'Resident Evil 4', 'Remake de uma missão de resgate em uma vila tomada pelo terror.', 'epicfake/assets/img/resident-evil-4.svg', 'Terror / Ação', 9.0, 'promocao', 0, 1, 'Capcom', '67 GB', '18', '2026-08-27 11:01:38'),
(7, 'stardew-valley', 'Stardew Valley', 'Construa uma nova vida em uma fazenda cercada por uma comunidade acolhedora.', 'epicfake/assets/img/stardew-valley.svg', 'Simulação / RPG', 9.2, 'popular', 0, 1, 'ConcernedApe', '1 GB', 'L', '2026-08-27 11:01:38'),
(8, 'among-us', 'Among Us', 'Descubra o impostor em partidas cooperativas de investigação e estratégia.', 'epicfake/assets/img/among-us.svg', 'Ação / Social', 8.1, 'popular', 0, 1, 'Innersloth', '250 MB', 'L', '2026-08-27 11:01:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo_plataformas`
--

DROP TABLE IF EXISTS `jogo_plataformas`;
CREATE TABLE `jogo_plataformas` (
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `plataforma_id` smallint(5) UNSIGNED NOT NULL,
  `disponivel` tinyint(1) NOT NULL DEFAULT 1,
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `jogo_plataformas`
--

INSERT INTO `jogo_plataformas` (`jogo_id`, `plataforma_id`, `disponivel`, `data_atualizacao`) VALUES
(1, 1, 1, '2026-08-27 11:01:38'),
(1, 4, 1, '2026-08-27 11:01:38'),
(2, 1, 1, '2026-08-27 11:01:38'),
(2, 4, 1, '2026-08-27 11:01:38'),
(3, 1, 1, '2026-08-27 11:01:38'),
(3, 4, 1, '2026-08-27 11:01:38'),
(4, 1, 1, '2026-08-27 11:01:38'),
(4, 4, 1, '2026-08-27 11:01:38'),
(5, 1, 1, '2026-08-27 11:01:38'),
(5, 4, 1, '2026-08-27 11:01:38'),
(6, 1, 1, '2026-08-27 11:01:38'),
(6, 4, 1, '2026-08-27 11:01:38'),
(7, 1, 1, '2026-08-27 11:01:38'),
(8, 1, 1, '2026-08-27 11:01:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `links_jogos`
--

DROP TABLE IF EXISTS `links_jogos`;
CREATE TABLE `links_jogos` (
  `id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `plataforma_id` smallint(5) UNSIGNED DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `tipo` enum('produto','oferta','suporte') NOT NULL DEFAULT 'produto',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `links_jogos`
--

INSERT INTO `links_jogos` (`id`, `jogo_id`, `plataforma_id`, `url`, `tipo`, `ativo`, `data_atualizacao`) VALUES
(1, 1, 1, 'epicfake/jogo.php?slug=cyberpunk-2077', 'produto', 1, '2026-08-27 11:01:38'),
(2, 2, 1, 'epicfake/jogo.php?slug=the-witcher-3', 'produto', 1, '2026-08-27 11:01:38'),
(3, 3, 1, 'epicfake/jogo.php?slug=baldurs-gate-3', 'produto', 1, '2026-08-27 11:01:38'),
(4, 4, 1, 'epicfake/jogo.php?slug=elden-ring', 'produto', 1, '2026-08-27 11:01:38'),
(5, 5, 1, 'epicfake/jogo.php?slug=hogwarts-legacy', 'produto', 1, '2026-08-27 11:01:38'),
(6, 6, 1, 'epicfake/jogo.php?slug=resident-evil-4', 'produto', 1, '2026-08-27 11:01:38'),
(7, 7, 1, 'epicfake/jogo.php?slug=stardew-valley', 'produto', 1, '2026-08-27 11:01:38'),
(8, 8, 1, 'epicfake/jogo.php?slug=among-us', 'produto', 1, '2026-08-27 11:01:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
CREATE TABLE `plataformas` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `nome` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `plataformas`
--

INSERT INTO `plataformas` (`id`, `nome`) VALUES
(3, 'Linux'),
(2, 'Mac'),
(1, 'PC'),
(5, 'PlayStation 5'),
(4, 'Steam Deck'),
(6, 'Xbox Series X|S');

-- --------------------------------------------------------

--
-- Estrutura para tabela `precos`
--

DROP TABLE IF EXISTS `precos`;
CREATE TABLE `precos` (
  `id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `plataforma_id` smallint(5) UNSIGNED NOT NULL,
  `preco_original` decimal(10,2) NOT NULL DEFAULT 0.00,
  `preco_atual` decimal(10,2) NOT NULL DEFAULT 0.00,
  `moeda` char(3) NOT NULL DEFAULT 'BRL',
  `disponibilidade` enum('disponivel','indisponivel','pre_venda') NOT NULL DEFAULT 'disponivel',
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `precos`
--

INSERT INTO `precos` (`id`, `jogo_id`, `plataforma_id`, `preco_original`, `preco_atual`, `moeda`, `disponibilidade`, `data_atualizacao`) VALUES
(1, 1, 1, 249.90, 124.95, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(2, 2, 1, 179.90, 89.95, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(3, 3, 1, 249.99, 199.99, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(4, 4, 1, 279.90, 195.93, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(5, 5, 1, 249.99, 162.49, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(6, 6, 1, 219.90, 131.94, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(7, 7, 1, 29.99, 23.99, 'BRL', 'disponivel', '2026-08-27 11:01:38'),
(8, 8, 1, 24.90, 12.45, 'BRL', 'disponivel', '2026-08-27 11:01:38');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_catalogo`
-- (Veja abaixo para a visão atual)
--
DROP VIEW IF EXISTS `vw_catalogo`;
CREATE TABLE `vw_catalogo` (
`id` int(10) unsigned
,`slug` varchar(150)
,`nome` varchar(180)
,`descricao` text
,`imagem` varchar(255)
,`genero` varchar(100)
,`avaliacao` decimal(3,1)
,`plataforma` varchar(80)
,`preco_original` decimal(10,2)
,`preco_atual` decimal(10,2)
,`desconto` decimal(5,2)
,`disponibilidade` enum('disponivel','indisponivel','pre_venda')
,`disponivel` tinyint(1)
,`url` varchar(500)
,`data_atualizacao` datetime
);

-- --------------------------------------------------------

--
-- Estrutura para view `vw_catalogo`
--
DROP TABLE IF EXISTS `vw_catalogo`;

DROP VIEW IF EXISTS `vw_catalogo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_catalogo`  AS SELECT `j`.`id` AS `id`, `j`.`slug` AS `slug`, `j`.`nome` AS `nome`, `j`.`descricao` AS `descricao`, `j`.`imagem` AS `imagem`, `j`.`genero` AS `genero`, `j`.`avaliacao` AS `avaliacao`, `p`.`nome` AS `plataforma`, `pr`.`preco_original` AS `preco_original`, `pr`.`preco_atual` AS `preco_atual`, coalesce(`d`.`percentual`,0) AS `desconto`, `pr`.`disponibilidade` AS `disponibilidade`, `j`.`disponivel` AS `disponivel`, `l`.`url` AS `url`, `j`.`data_atualizacao` AS `data_atualizacao` FROM ((((`jogos` `j` join `precos` `pr` on(`pr`.`jogo_id` = `j`.`id`)) join `plataformas` `p` on(`p`.`id` = `pr`.`plataforma_id`)) left join `descontos` `d` on(`d`.`preco_id` = `pr`.`id`)) left join `links_jogos` `l` on(`l`.`jogo_id` = `j`.`id` and `l`.`plataforma_id` = `pr`.`plataforma_id` and `l`.`tipo` = 'produto' and `l`.`ativo` = 1)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_descontos_preco` (`preco_id`),
  ADD KEY `idx_descontos_ativo` (`ativo`),
  ADD KEY `idx_descontos_percentual` (`percentual`),
  ADD KEY `idx_descontos_periodo` (`inicio`,`fim`);

--
-- Índices de tabela `epicfake_jogos`
--
ALTER TABLE `epicfake_jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices de tabela `epicfake_ofertas`
--
ALTER TABLE `epicfake_ofertas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_epicfake_oferta_slug` (`slug`);

--
-- Índices de tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_jogos_slug` (`slug`),
  ADD KEY `idx_jogos_nome` (`nome`),
  ADD KEY `idx_jogos_genero` (`genero`),
  ADD KEY `idx_jogos_disponivel` (`disponivel`),
  ADD KEY `idx_jogos_atualizacao` (`data_atualizacao`);

--
-- Índices de tabela `jogo_plataformas`
--
ALTER TABLE `jogo_plataformas`
  ADD PRIMARY KEY (`jogo_id`,`plataforma_id`),
  ADD KEY `idx_jp_plataforma` (`plataforma_id`),
  ADD KEY `idx_jp_disponivel` (`disponivel`);

--
-- Índices de tabela `links_jogos`
--
ALTER TABLE `links_jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_links_url` (`url`),
  ADD KEY `idx_links_jogo` (`jogo_id`),
  ADD KEY `idx_links_plataforma` (`plataforma_id`),
  ADD KEY `idx_links_ativo` (`ativo`);

--
-- Índices de tabela `plataformas`
--
ALTER TABLE `plataformas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_plataformas_nome` (`nome`);

--
-- Índices de tabela `precos`
--
ALTER TABLE `precos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_precos_jogo_plataforma` (`jogo_id`,`plataforma_id`),
  ADD KEY `idx_precos_jogo` (`jogo_id`),
  ADD KEY `idx_precos_plataforma` (`plataforma_id`),
  ADD KEY `idx_precos_atual` (`preco_atual`),
  ADD KEY `idx_precos_disponibilidade` (`disponibilidade`),
  ADD KEY `idx_precos_atualizacao` (`data_atualizacao`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `epicfake_ofertas`
--
ALTER TABLE `epicfake_ofertas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `jogos`
--
ALTER TABLE `jogos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `links_jogos`
--
ALTER TABLE `links_jogos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `plataformas`
--
ALTER TABLE `plataformas`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `precos`
--
ALTER TABLE `precos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `descontos`
--
ALTER TABLE `descontos`
  ADD CONSTRAINT `fk_descontos_preco` FOREIGN KEY (`preco_id`) REFERENCES `precos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `jogo_plataformas`
--
ALTER TABLE `jogo_plataformas`
  ADD CONSTRAINT `fk_jp_jogo` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jp_plataforma` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `links_jogos`
--
ALTER TABLE `links_jogos`
  ADD CONSTRAINT `fk_links_jogo` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_links_plataforma` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `precos`
--
ALTER TABLE `precos`
  ADD CONSTRAINT `fk_precos_jogo` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_precos_plataforma` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
