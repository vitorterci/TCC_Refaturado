-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/09/2026 às 13:08
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
-- Banco de dados: `fake_gog`
--
CREATE DATABASE IF NOT EXISTS `fake_gog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fake_gog`;

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
(1, 1, 50.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(2, 2, 50.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(3, 3, 10.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(4, 4, 30.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(5, 5, 30.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(6, 6, 40.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(7, 7, 20.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51'),
(8, 8, 50.00, '2026-08-01 00:00:00', '2026-12-31 23:59:59', 1, '2026-08-27 11:04:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gogfake_ofertas`
--

DROP TABLE IF EXISTS `gogfake_ofertas`;
CREATE TABLE `gogfake_ofertas` (
  `id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(150) NOT NULL,
  `plataforma` varchar(60) NOT NULL DEFAULT 'PC',
  `preco_original` decimal(10,2) NOT NULL,
  `preco_atual` decimal(10,2) NOT NULL,
  `desconto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `url` varchar(500) NOT NULL,
  `loja` varchar(40) NOT NULL DEFAULT 'GOGFake',
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `gogfake_ofertas`
--

INSERT INTO `gogfake_ofertas` (`id`, `jogo_id`, `slug`, `plataforma`, `preco_original`, `preco_atual`, `desconto`, `url`, `loja`, `data_atualizacao`) VALUES
(1, 1, 'elden-ring', 'PC', 86.90, 56.49, 34.99, '/tcc/simulados/gogfake/detalhes.php?slug=elden-ring', 'GOGFake', '2026-09-11 15:13:31'),
(2, 2, 'god-of-war-ragnarok', 'PC', 123.90, 111.51, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=god-of-war-ragnarok', 'GOGFake', '2026-09-11 15:13:31'),
(3, 3, 'the-legend-of-zelda-totk', 'PC', 160.90, 160.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=the-legend-of-zelda-totk', 'GOGFake', '2026-09-11 15:13:31'),
(4, 4, 'baldurs-gate-3', 'PC', 197.90, 197.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=baldurs-gate-3', 'GOGFake', '2026-09-11 15:13:31'),
(5, 5, 'cyberpunk-2077', 'PC', 234.90, 152.69, 35.00, '/tcc/simulados/gogfake/detalhes.php?slug=cyberpunk-2077', 'GOGFake', '2026-09-11 15:13:31'),
(6, 6, 'red-dead-redemption-2', 'PC', 271.90, 244.71, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=red-dead-redemption-2', 'GOGFake', '2026-09-11 15:13:31'),
(7, 7, 'the-witcher-3', 'PC', 57.90, 57.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=the-witcher-3', 'GOGFake', '2026-09-11 15:13:31'),
(8, 8, 'hollow-knight', 'PC', 94.90, 94.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=hollow-knight', 'GOGFake', '2026-09-11 15:13:31'),
(9, 9, 'hades', 'PC', 131.90, 85.74, 35.00, '/tcc/simulados/gogfake/detalhes.php?slug=hades', 'GOGFake', '2026-09-11 15:13:31'),
(10, 10, 'celeste', 'PC', 168.90, 152.01, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=celeste', 'GOGFake', '2026-09-11 15:13:31'),
(11, 11, 'stardew-valley', 'PC', 205.90, 205.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=stardew-valley', 'GOGFake', '2026-09-11 15:13:31'),
(12, 12, 'terraria', 'PC', 242.90, 242.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=terraria', 'GOGFake', '2026-09-11 15:13:31'),
(13, 13, 'minecraft', 'PC', 279.90, 181.94, 35.00, '/tcc/simulados/gogfake/detalhes.php?slug=minecraft', 'GOGFake', '2026-09-11 15:13:31'),
(14, 14, 'gta-v', 'PC', 65.90, 59.31, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=gta-v', 'GOGFake', '2026-09-11 15:13:31'),
(15, 15, 'the-last-of-us-part-ii', 'PC', 102.90, 102.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=the-last-of-us-part-ii', 'GOGFake', '2026-09-11 15:13:31'),
(16, 16, 'ghost-of-tsushima', 'PC', 139.90, 139.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=ghost-of-tsushima', 'GOGFake', '2026-09-11 15:13:31'),
(17, 17, 'horizon-forbidden-west', 'PC', 176.90, 114.99, 35.00, '/tcc/simulados/gogfake/detalhes.php?slug=horizon-forbidden-west', 'GOGFake', '2026-09-11 15:13:31'),
(18, 18, 'spider-man-2', 'PC', 213.90, 192.51, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=spider-man-2', 'GOGFake', '2026-09-11 15:13:31'),
(19, 19, 'resident-evil-4-remake', 'PC', 250.90, 250.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=resident-evil-4-remake', 'GOGFake', '2026-09-11 15:13:31'),
(20, 20, 'alan-wake-2', 'PC', 287.90, 287.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=alan-wake-2', 'GOGFake', '2026-09-11 15:13:31'),
(21, 21, 'starfield', 'PC', 73.90, 48.04, 34.99, '/tcc/simulados/gogfake/detalhes.php?slug=starfield', 'GOGFake', '2026-09-11 15:13:31'),
(22, 22, 'final-fantasy-xvi', 'PC', 110.90, 99.81, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=final-fantasy-xvi', 'GOGFake', '2026-09-11 15:13:31'),
(23, 23, 'persona-5-royal', 'PC', 147.90, 147.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=persona-5-royal', 'GOGFake', '2026-09-11 15:13:31'),
(24, 24, 'nier-automata', 'PC', 184.90, 184.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=nier-automata', 'GOGFake', '2026-09-11 15:13:31'),
(25, 25, 'dark-souls-3', 'PC', 221.90, 144.24, 35.00, '/tcc/simulados/gogfake/detalhes.php?slug=dark-souls-3', 'GOGFake', '2026-09-11 15:13:31'),
(26, 26, 'sekiro', 'PC', 258.90, 233.01, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=sekiro', 'GOGFake', '2026-09-11 15:13:31'),
(27, 27, 'bloodborne', 'PC', 295.90, 295.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=bloodborne', 'GOGFake', '2026-09-11 15:13:31'),
(28, 28, 'cuphead', 'PC', 81.90, 81.90, 0.00, '/tcc/simulados/gogfake/detalhes.php?slug=cuphead', 'GOGFake', '2026-09-11 15:13:31'),
(29, 29, 'ori-and-the-will-of-the-wisps', 'PC', 118.90, 77.29, 35.00, '/tcc/simulados/gogfake/detalhes.php?slug=ori-and-the-will-of-the-wisps', 'GOGFake', '2026-09-11 15:13:31'),
(30, 30, 'it-takes-two', 'PC', 155.90, 140.31, 10.00, '/tcc/simulados/gogfake/detalhes.php?slug=it-takes-two', 'GOGFake', '2026-09-11 15:13:31');

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
(1, 'cyberpunk-2077', 'Cyberpunk 2077', 'RPG de ação em mundo aberto ambientado em Night City.', 'gogfake/assets/img/cyberpunk-2077.svg', 'RPG / Ação', 9.1, 'popular', 0, 1, 'CD Projekt Red', '70 GB', '18', '2026-08-27 11:04:51'),
(2, 'the-witcher-3', 'The Witcher 3: Wild Hunt', 'Uma aventura épica de fantasia em um mundo aberto repleto de escolhas.', 'gogfake/assets/img/the-witcher-3.svg', 'RPG / Fantasia', 9.5, 'popular', 0, 1, 'CD Projekt Red', '50 GB', '16', '2026-08-27 11:04:51'),
(3, 'baldurs-gate-3', 'Baldur\'s Gate 3', 'RPG narrativo baseado em Dungeons & Dragons com liberdade de decisões.', 'gogfake/assets/img/baldurs-gate-3.svg', 'RPG', 9.7, 'popular', 0, 1, 'Larian Studios', '150 GB', '16', '2026-08-27 11:04:51'),
(4, 'elden-ring', 'Elden Ring', 'Uma jornada de fantasia sombria em um vasto mundo aberto.', 'gogfake/assets/img/elden-ring.svg', 'RPG / Ação', 9.4, 'popular', 0, 1, 'FromSoftware', '60 GB', '16', '2026-08-27 11:04:51'),
(5, 'hogwarts-legacy', 'Hogwarts Legacy', 'Explore Hogwarts e descubra sua própria história no mundo bruxo.', 'gogfake/assets/img/hogwarts-legacy.svg', 'Ação / Aventura', 8.8, 'lancamento', 0, 1, 'Avalanche Software', '85 GB', '12', '2026-08-27 11:04:51'),
(6, 'resident-evil-4', 'Resident Evil 4', 'Remake de uma missão de resgate em uma vila tomada pelo terror.', 'gogfake/assets/img/resident-evil-4.svg', 'Terror / Ação', 9.0, 'promocao', 0, 1, 'Capcom', '67 GB', '18', '2026-08-27 11:04:51'),
(7, 'stardew-valley', 'Stardew Valley', 'Construa uma nova vida em uma fazenda cercada por uma comunidade acolhedora.', 'gogfake/assets/img/stardew-valley.svg', 'Simulação / RPG', 9.2, 'popular', 0, 1, 'ConcernedApe', '1 GB', 'L', '2026-08-27 11:04:51'),
(8, 'among-us', 'Among Us', 'Descubra o impostor em partidas cooperativas de investigação e estratégia.', 'gogfake/assets/img/among-us.svg', 'Ação / Social', 8.1, 'popular', 0, 1, 'Innersloth', '250 MB', 'L', '2026-08-27 11:04:51');

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
(1, 1, 1, '2026-08-27 11:04:51'),
(1, 4, 1, '2026-08-27 11:04:51'),
(2, 1, 1, '2026-08-27 11:04:51'),
(2, 4, 1, '2026-08-27 11:04:51'),
(3, 1, 1, '2026-08-27 11:04:51'),
(3, 4, 1, '2026-08-27 11:04:51'),
(4, 1, 1, '2026-08-27 11:04:51'),
(4, 4, 1, '2026-08-27 11:04:51'),
(5, 1, 1, '2026-08-27 11:04:51'),
(5, 4, 1, '2026-08-27 11:04:51'),
(6, 1, 1, '2026-08-27 11:04:51'),
(6, 4, 1, '2026-08-27 11:04:51'),
(7, 1, 1, '2026-08-27 11:04:51'),
(8, 1, 1, '2026-08-27 11:04:51');

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
(1, 1, 1, 'gogfake/jogo.php?slug=cyberpunk-2077', 'produto', 1, '2026-08-27 11:04:51'),
(2, 2, 1, 'gogfake/jogo.php?slug=the-witcher-3', 'produto', 1, '2026-08-27 11:04:51'),
(3, 3, 1, 'gogfake/jogo.php?slug=baldurs-gate-3', 'produto', 1, '2026-08-27 11:04:51'),
(4, 4, 1, 'gogfake/jogo.php?slug=elden-ring', 'produto', 1, '2026-08-27 11:04:51'),
(5, 5, 1, 'gogfake/jogo.php?slug=hogwarts-legacy', 'produto', 1, '2026-08-27 11:04:51'),
(6, 6, 1, 'gogfake/jogo.php?slug=resident-evil-4', 'produto', 1, '2026-08-27 11:04:51'),
(7, 7, 1, 'gogfake/jogo.php?slug=stardew-valley', 'produto', 1, '2026-08-27 11:04:51'),
(8, 8, 1, 'gogfake/jogo.php?slug=among-us', 'produto', 1, '2026-08-27 11:04:51');

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
(1, 1, 1, 179.90, 89.95, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(2, 2, 1, 129.90, 64.95, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(3, 3, 1, 239.90, 215.91, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(4, 4, 1, 219.90, 153.93, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(5, 5, 1, 239.90, 167.93, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(6, 6, 1, 189.90, 113.94, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(7, 7, 1, 21.99, 17.59, 'BRL', 'disponivel', '2026-08-27 11:04:51'),
(8, 8, 1, 14.90, 7.45, 'BRL', 'disponivel', '2026-08-27 11:04:51');

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
-- Índices de tabela `gogfake_ofertas`
--
ALTER TABLE `gogfake_ofertas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_gogfake_oferta_slug` (`slug`);

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
-- AUTO_INCREMENT de tabela `gogfake_ofertas`
--
ALTER TABLE `gogfake_ofertas`
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
