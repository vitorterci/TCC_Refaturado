-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/09/2026 às 13:09
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
-- Banco de dados: `fake_steam`
--
CREATE DATABASE IF NOT EXISTS `fake_steam` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fake_steam`;

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `steamfake_jogos`
--

DROP TABLE IF EXISTS `steamfake_jogos`;
CREATE TABLE `steamfake_jogos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) NOT NULL,
  `slug` varchar(160) NOT NULL,
  `descricao` text NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `plataforma` varchar(60) NOT NULL DEFAULT 'PC',
  `genero` varchar(100) NOT NULL,
  `avaliacao` decimal(2,1) NOT NULL DEFAULT 0.0,
  `preco_original` decimal(10,2) NOT NULL,
  `preco_atual` decimal(10,2) NOT NULL,
  `desconto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `promocao_status` varchar(80) NOT NULL DEFAULT 'Preço regular',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `steamfake_jogos`
--

INSERT INTO `steamfake_jogos` (`id`, `nome`, `slug`, `descricao`, `imagem`, `plataforma`, `genero`, `avaliacao`, `preco_original`, `preco_atual`, `desconto`, `promocao_status`, `criado_em`, `atualizado_em`) VALUES
(1, 'Cyberpunk 2077', 'cyberpunk-2077', 'RPG de ação em mundo aberto ambientado em Night City.', 'assets/img/capa-padrao.svg', 'PC', 'RPG / Ação', 4.7, 199.90, 99.95, 50.00, 'Oferta por tempo limitado', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(2, 'Red Dead Redemption 2', 'red-dead-redemption-2', 'Uma jornada épica pelo Velho Oeste americano.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Aventura', 4.9, 249.90, 124.95, 50.00, 'Oferta por tempo limitado', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(3, 'Hogwarts Legacy', 'hogwarts-legacy', 'Explore Hogwarts no século XIX e aprenda feitiços.', 'assets/img/capa-padrao.svg', 'PC', 'RPG / Aventura', 4.6, 249.90, 124.95, 50.00, 'Oferta por tempo limitado', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(4, 'Forza Horizon 5', 'forza-horizon-5', 'Corridas pelas paisagens vibrantes do México.', 'assets/img/capa-padrao.svg', 'PC', 'Corrida', 4.8, 249.90, 149.94, 40.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(5, 'Elden Ring', 'elden-ring', 'Fantasia sombria com exploração livre e combates intensos.', 'assets/img/capa-padrao.svg', 'PC', 'RPG / Soulslike', 4.9, 229.90, 160.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(6, 'Baldur’s Gate 3', 'baldurs-gate-3', 'RPG baseado em escolhas, dados e consequências.', 'assets/img/capa-padrao.svg', 'PC', 'RPG / Estratégia', 4.9, 199.90, 139.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(7, 'Minecraft', 'minecraft', 'Construa, explore e sobreviva em um universo de blocos.', 'assets/img/capa-padrao.svg', 'PC', 'Sandbox / Aventura', 4.8, 119.90, 119.90, 0.00, 'Preço regular', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(8, 'The Witcher 3: Wild Hunt', 'the-witcher-3-wild-hunt', 'Geralt de Rívia rastreia monstros em um continente em guerra.', 'assets/img/capa-padrao.svg', 'PC', 'RPG / Ação', 4.9, 149.90, 44.97, 70.00, 'Oferta relâmpago', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(9, 'Grand Theft Auto V', 'grand-theft-auto-v', 'Três criminosos se unem em golpes na cidade de Los Santos.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Mundo aberto', 4.7, 99.90, 24.97, 75.00, 'Oferta relâmpago', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(10, 'Hades', 'hades', 'Desafie o deus dos mortos em uma fuga pelo submundo.', 'assets/img/capa-padrao.svg', 'PC', 'Roguelike / Ação', 4.9, 89.90, 44.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(11, 'Hollow Knight', 'hollow-knight', 'Desbrave um reino subterrâneo repleto de segredos.', 'assets/img/capa-padrao.svg', 'PC', 'Metroidvania', 4.8, 57.90, 28.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(12, 'Dead Cells', 'dead-cells', 'Roguelite de ação com combate veloz e exploração ramificada.', 'assets/img/capa-padrao.svg', 'PC', 'Roguelite / Ação', 4.7, 59.90, 35.94, 40.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(13, 'Stardew Valley', 'stardew-valley', 'Cultive sua fazenda, faça amizades e descubra o vale.', 'assets/img/capa-padrao.svg', 'PC', 'Simulação / RPG', 4.9, 39.90, 19.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(14, 'Resident Evil 4', 'resident-evil-4', 'Leon enfrenta uma missão de resgate em uma vila isolada.', 'assets/img/capa-padrao.svg', 'PC', 'Terror / Ação', 4.8, 249.90, 174.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(15, 'Street Fighter 6', 'street-fighter-6', 'A nova geração dos jogos de luta.', 'assets/img/capa-padrao.svg', 'PC', 'Luta', 4.6, 249.90, 174.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(16, 'Bioshock Infinite', 'bioshock-infinite', 'Uma aventura de ficção científica na cidade aérea de Columbia.', 'assets/img/capa-padrao.svg', 'PC', 'FPS / Narrativa', 4.6, 79.90, 15.98, 80.00, 'Oferta relâmpago', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(17, 'Portal 2', 'portal-2', 'Resolva quebra-cabeças com portais e muita ironia.', 'assets/img/capa-padrao.svg', 'PC', 'Puzzle / Cooperação', 4.9, 36.90, 7.38, 80.00, 'Oferta relâmpago', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(18, 'The Sims 4', 'the-sims-4', 'Crie personagens, construa casas e conte novas histórias.', 'assets/img/capa-padrao.svg', 'PC', 'Simulação', 4.3, 99.90, 49.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(19, 'Terraria', 'terraria', 'Cave, lute, explore e construa em um mundo 2D.', 'assets/img/capa-padrao.svg', 'PC', 'Sandbox / Aventura', 4.8, 39.90, 19.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(20, 'Sekiro: Shadows Die Twice', 'sekiro-shadows-die-twice', 'Domine a espada de um shinobi no Japão Sengoku.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Soulslike', 4.8, 229.90, 160.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(21, 'Death Stranding', 'death-stranding', 'Reconecte uma América fragmentada.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Aventura', 4.4, 199.90, 69.96, 65.00, 'Oferta relâmpago', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(22, 'No Man’s Sky', 'no-mans-sky', 'Explore um universo praticamente infinito.', 'assets/img/capa-padrao.svg', 'PC', 'Exploração / Sobrevivência', 4.5, 199.90, 99.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(23, 'Sea of Thieves', 'sea-of-thieves', 'Aventuras piratas em alto-mar com sua tripulação.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Multiplayer', 4.4, 149.90, 74.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(24, 'Cuphead', 'cuphead', 'Chefes desafiadores em animação clássica.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Plataforma', 4.7, 79.90, 39.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(25, 'Celeste', 'celeste', 'Ajude Madeline a escalar uma montanha.', 'assets/img/capa-padrao.svg', 'PC', 'Plataforma / Narrativa', 4.9, 59.90, 29.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(26, 'Control', 'control', 'Habilidades sobrenaturais em uma agência secreta.', 'assets/img/capa-padrao.svg', 'PC', 'Ação / Ficção científica', 4.5, 149.90, 44.97, 70.00, 'Oferta relâmpago', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(27, 'Doom Eternal', 'doom-eternal', 'Destrua hordas demoníacas em combate explosivo.', 'assets/img/capa-padrao.svg', 'PC', 'FPS / Ação', 4.8, 199.90, 99.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(28, 'Final Fantasy VII Remake', 'final-fantasy-vii-remake', 'A releitura visualmente impressionante de Midgar.', 'assets/img/capa-padrao.svg', 'PC', 'RPG / Ação', 4.6, 349.90, 244.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(29, 'Batalha Estelar: Origens', 'batalha-estelar-origens', 'Comande uma frota rebelde em uma campanha tática.', 'assets/img/capa-padrao.svg', 'PC', 'Estratégia / Sci-Fi', 4.2, 79.90, 39.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(30, 'Neon Drift Racing', 'neon-drift-racing', 'Corridas arcade em pistas futuristas.', 'assets/img/capa-padrao.svg', 'PC', 'Corrida / Arcade', 4.1, 69.90, 34.95, 50.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38'),
(31, 'Alan Wake 2', 'alan-wake-2', 'Dois protagonistas enfrentam uma história de terror psicológico que atravessa a fronteira entre ficção e realidade.', 'assets/img/capa-padrao.svg', 'PC', 'Terror / Aventura', 4.7, 249.90, 174.93, 30.00, 'Oferta ativa', '2026-08-27 14:14:38', '2026-08-27 14:14:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `steamfake_ofertas`
--

DROP TABLE IF EXISTS `steamfake_ofertas`;
CREATE TABLE `steamfake_ofertas` (
  `id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(150) NOT NULL,
  `plataforma` varchar(60) NOT NULL DEFAULT 'PC',
  `preco_original` decimal(10,2) NOT NULL,
  `preco_atual` decimal(10,2) NOT NULL,
  `desconto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `url` varchar(500) NOT NULL,
  `loja` varchar(40) NOT NULL DEFAULT 'SteamFake',
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `steamfake_ofertas`
--

INSERT INTO `steamfake_ofertas` (`id`, `jogo_id`, `slug`, `plataforma`, `preco_original`, `preco_atual`, `desconto`, `url`, `loja`, `data_atualizacao`) VALUES
(1, 1, 'elden-ring', 'PC', 86.90, 73.87, 14.99, '/tcc/simulados/steamfake/produto.php?slug=elden-ring', 'SteamFake', '2026-09-11 15:13:38'),
(2, 2, 'god-of-war-ragnarok', 'PC', 123.90, 123.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=god-of-war-ragnarok', 'SteamFake', '2026-09-11 15:13:38'),
(3, 3, 'the-legend-of-zelda-totk', 'PC', 160.90, 160.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=the-legend-of-zelda-totk', 'SteamFake', '2026-09-11 15:13:38'),
(4, 4, 'baldurs-gate-3', 'PC', 197.90, 138.53, 30.00, '/tcc/simulados/steamfake/produto.php?slug=baldurs-gate-3', 'SteamFake', '2026-09-11 15:13:38'),
(5, 5, 'cyberpunk-2077', 'PC', 234.90, 199.67, 15.00, '/tcc/simulados/steamfake/produto.php?slug=cyberpunk-2077', 'SteamFake', '2026-09-11 15:13:38'),
(6, 6, 'red-dead-redemption-2', 'PC', 271.90, 271.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=red-dead-redemption-2', 'SteamFake', '2026-09-11 15:13:38'),
(7, 7, 'the-witcher-3', 'PC', 57.90, 57.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=the-witcher-3', 'SteamFake', '2026-09-11 15:13:38'),
(8, 8, 'hollow-knight', 'PC', 94.90, 66.43, 30.00, '/tcc/simulados/steamfake/produto.php?slug=hollow-knight', 'SteamFake', '2026-09-11 15:13:38'),
(9, 9, 'hades', 'PC', 131.90, 112.12, 15.00, '/tcc/simulados/steamfake/produto.php?slug=hades', 'SteamFake', '2026-09-11 15:13:38'),
(10, 10, 'celeste', 'PC', 168.90, 168.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=celeste', 'SteamFake', '2026-09-11 15:13:38'),
(11, 11, 'stardew-valley', 'PC', 205.90, 205.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=stardew-valley', 'SteamFake', '2026-09-11 15:13:38'),
(12, 12, 'terraria', 'PC', 242.90, 170.03, 30.00, '/tcc/simulados/steamfake/produto.php?slug=terraria', 'SteamFake', '2026-09-11 15:13:38'),
(13, 13, 'minecraft', 'PC', 279.90, 237.92, 15.00, '/tcc/simulados/steamfake/produto.php?slug=minecraft', 'SteamFake', '2026-09-11 15:13:38'),
(14, 14, 'gta-v', 'PC', 65.90, 65.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=gta-v', 'SteamFake', '2026-09-11 15:13:38'),
(15, 15, 'the-last-of-us-part-ii', 'PC', 102.90, 102.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=the-last-of-us-part-ii', 'SteamFake', '2026-09-11 15:13:38'),
(16, 16, 'ghost-of-tsushima', 'PC', 139.90, 97.93, 30.00, '/tcc/simulados/steamfake/produto.php?slug=ghost-of-tsushima', 'SteamFake', '2026-09-11 15:13:38'),
(17, 17, 'horizon-forbidden-west', 'PC', 176.90, 150.37, 15.00, '/tcc/simulados/steamfake/produto.php?slug=horizon-forbidden-west', 'SteamFake', '2026-09-11 15:13:38'),
(18, 18, 'spider-man-2', 'PC', 213.90, 213.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=spider-man-2', 'SteamFake', '2026-09-11 15:13:38'),
(19, 19, 'resident-evil-4-remake', 'PC', 250.90, 250.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=resident-evil-4-remake', 'SteamFake', '2026-09-11 15:13:38'),
(20, 20, 'alan-wake-2', 'PC', 287.90, 201.53, 30.00, '/tcc/simulados/steamfake/produto.php?slug=alan-wake-2', 'SteamFake', '2026-09-11 15:13:38'),
(21, 21, 'starfield', 'PC', 73.90, 62.82, 14.99, '/tcc/simulados/steamfake/produto.php?slug=starfield', 'SteamFake', '2026-09-11 15:13:38'),
(22, 22, 'final-fantasy-xvi', 'PC', 110.90, 110.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=final-fantasy-xvi', 'SteamFake', '2026-09-11 15:13:38'),
(23, 23, 'persona-5-royal', 'PC', 147.90, 147.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=persona-5-royal', 'SteamFake', '2026-09-11 15:13:38'),
(24, 24, 'nier-automata', 'PC', 184.90, 129.43, 30.00, '/tcc/simulados/steamfake/produto.php?slug=nier-automata', 'SteamFake', '2026-09-11 15:13:38'),
(25, 25, 'dark-souls-3', 'PC', 221.90, 188.62, 15.00, '/tcc/simulados/steamfake/produto.php?slug=dark-souls-3', 'SteamFake', '2026-09-11 15:13:38'),
(26, 26, 'sekiro', 'PC', 258.90, 258.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=sekiro', 'SteamFake', '2026-09-11 15:13:38'),
(27, 27, 'bloodborne', 'PC', 295.90, 295.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=bloodborne', 'SteamFake', '2026-09-11 15:13:38'),
(28, 28, 'cuphead', 'PC', 81.90, 57.33, 30.00, '/tcc/simulados/steamfake/produto.php?slug=cuphead', 'SteamFake', '2026-09-11 15:13:38'),
(29, 29, 'ori-and-the-will-of-the-wisps', 'PC', 118.90, 101.07, 15.00, '/tcc/simulados/steamfake/produto.php?slug=ori-and-the-will-of-the-wisps', 'SteamFake', '2026-09-11 15:13:38'),
(30, 30, 'it-takes-two', 'PC', 155.90, 155.90, 0.00, '/tcc/simulados/steamfake/produto.php?slug=it-takes-two', 'SteamFake', '2026-09-11 15:13:38');

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
-- Índices de tabela `steamfake_jogos`
--
ALTER TABLE `steamfake_jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_steamfake_slug` (`slug`);

--
-- Índices de tabela `steamfake_ofertas`
--
ALTER TABLE `steamfake_ofertas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_steamfake_oferta_slug` (`slug`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `descontos`
--
ALTER TABLE `descontos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT de tabela `steamfake_jogos`
--
ALTER TABLE `steamfake_jogos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `steamfake_ofertas`
--
ALTER TABLE `steamfake_ofertas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
