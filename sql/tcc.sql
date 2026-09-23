-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/09/2026 às 13:04
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
-- Banco de dados: `tcc`
--
CREATE DATABASE IF NOT EXISTS `tcc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tcc`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mensagem` text NOT NULL,
  `status` enum('novo','lido','respondido') NOT NULL DEFAULT 'novo',
  `data_envio` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `generos`
--

DROP TABLE IF EXISTS `generos`;
CREATE TABLE `generos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `generos`
--

INSERT INTO `generos` (`id`, `nome`, `slug`, `data_cadastro`) VALUES
(1, 'Action RPG', 'action-rpg', '2026-09-18 18:23:04'),
(2, 'Action Adventure', 'action-adventure', '2026-09-18 18:23:04'),
(3, 'CRPG', 'crpg', '2026-09-18 18:23:04'),
(4, 'Metroidvania', 'metroidvania', '2026-09-18 18:23:04'),
(5, 'Roguelike', 'roguelike', '2026-09-18 18:23:04'),
(6, 'Platformer', 'platformer', '2026-09-18 18:23:04'),
(7, 'Simulation', 'simulation', '2026-09-18 18:23:04'),
(8, 'Sandbox', 'sandbox', '2026-09-18 18:23:04'),
(9, 'Survival Horror', 'survival-horror', '2026-09-18 18:23:04'),
(10, 'JRPG', 'jrpg', '2026-09-18 18:23:04'),
(11, 'Run and Gun', 'run-and-gun', '2026-09-18 18:23:04'),
(12, 'Co-op Adventure', 'co-op-adventure', '2026-09-18 18:23:04'),
(13, 'Soulslike', 'soulslike', '2026-09-18 18:23:04'),
(14, 'FPS', 'fps', '2026-09-18 18:23:04'),
(15, 'Estratégia', 'estrategia', '2026-09-18 18:23:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogos`
--

DROP TABLE IF EXISTS `jogos`;
CREATE TABLE `jogos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(150) NOT NULL,
  `slug` varchar(180) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `plataforma` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `etaria` varchar(10) DEFAULT NULL,
  `status` enum('ativo','inativo') NOT NULL DEFAULT 'ativo',
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo_genero`
--

DROP TABLE IF EXISTS `jogo_genero`;
CREATE TABLE `jogo_genero` (
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `genero_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo_plataforma`
--

DROP TABLE IF EXISTS `jogo_plataforma`;
CREATE TABLE `jogo_plataforma` (
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `plataforma_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
CREATE TABLE `plataformas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `plataformas`
--

INSERT INTO `plataformas` (`id`, `nome`, `slug`, `data_cadastro`) VALUES
(1, 'PC', 'pc', '2026-09-18 18:23:04'),
(2, 'PS5', 'ps5', '2026-09-18 18:23:04'),
(3, 'PS4', 'ps4', '2026-09-18 18:23:04'),
(4, 'Xbox Series', 'xbox-series', '2026-09-18 18:23:04'),
(5, 'Xbox One', 'xbox-one', '2026-09-18 18:23:04'),
(6, 'Nintendo Switch', 'nintendo-switch', '2026-09-18 18:23:04'),
(7, 'Mobile', 'mobile', '2026-09-18 18:23:04');

-- --------------------------------------------------------

--
-- Estrutura para tabela `precos`
--

DROP TABLE IF EXISTS `precos`;
CREATE TABLE `precos` (
  `id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `loja` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT 0.00,
  `desconto` decimal(5,2) NOT NULL DEFAULT 0.00,
  `disponibilidade` enum('disponivel','indisponivel') NOT NULL DEFAULT 'disponivel',
  `url` varchar(255) DEFAULT NULL,
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `role` enum('usuario','admin') NOT NULL DEFAULT 'usuario',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `preferencias_cor` varchar(20) DEFAULT NULL,
  `preferencias_animacoes` tinyint(1) NOT NULL DEFAULT 0,
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `email`, `senha`, `role`, `ativo`, `foto_perfil`, `preferencias_cor`, `preferencias_animacoes`, `data_cadastro`, `data_atualizacao`) VALUES
(1, '1', '1', '123@gmail.com', '$2y$10$Zbji9u8VFowXIm3aVA0SgOo6NtqIZeL/ZqbPW7FEyu9Vjw9W6n9IK', 'usuario', 1, 'assets/uploads/perfil/usuario_1_1db960969bab959c38dad325.png', NULL, 0, '2026-09-18 16:13:20', '2026-09-18 16:26:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_jogos`
--

DROP TABLE IF EXISTS `usuario_jogos`;
CREATE TABLE `usuario_jogos` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `status` enum('possuo','jogando','zerado','abandonado') DEFAULT 'possuo',
  `data_adicionado` datetime DEFAULT current_timestamp(),
  `data_atualizacao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_lista`
--

DROP TABLE IF EXISTS `usuario_lista`;
CREATE TABLE `usuario_lista` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `jogo_id` int(10) UNSIGNED NOT NULL,
  `notificar_promocao` tinyint(1) DEFAULT 1,
  `notificar_preco` tinyint(1) DEFAULT 1,
  `preco_alvo` decimal(10,2) DEFAULT NULL,
  `desconto_minimo` decimal(5,2) DEFAULT NULL,
  `data_adicionado` datetime DEFAULT current_timestamp(),
  `data_atualizacao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_preferencias`
--

DROP TABLE IF EXISTS `usuario_preferencias`;
CREATE TABLE `usuario_preferencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `desconto_minimo` decimal(5,2) DEFAULT 0.00,
  `preco_maximo` decimal(10,2) DEFAULT NULL,
  `notificar_promocoes` tinyint(1) DEFAULT 1,
  `notificar_queda_preco` tinyint(1) DEFAULT 1,
  `plataformas_interesse` text DEFAULT NULL,
  `generos_interesse` text DEFAULT NULL,
  `lojas_interesse` text DEFAULT NULL,
  `data_atualizacao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_feedback_status` (`status`);

--
-- Índices de tabela `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_generos_slug` (`slug`);

--
-- Índices de tabela `jogos`
--
ALTER TABLE `jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_slug` (`slug`),
  ADD KEY `idx_jogos_status` (`status`);

--
-- Índices de tabela `jogo_genero`
--
ALTER TABLE `jogo_genero`
  ADD PRIMARY KEY (`jogo_id`,`genero_id`),
  ADD KEY `idx_jg_genero` (`genero_id`);

--
-- Índices de tabela `jogo_plataforma`
--
ALTER TABLE `jogo_plataforma`
  ADD PRIMARY KEY (`jogo_id`,`plataforma_id`),
  ADD KEY `idx_jp_plataforma` (`plataforma_id`);

--
-- Índices de tabela `plataformas`
--
ALTER TABLE `plataformas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_plataformas_slug` (`slug`);

--
-- Índices de tabela `precos`
--
ALTER TABLE `precos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_precos_jogo` (`jogo_id`),
  ADD KEY `idx_precos_disponibilidade` (`disponibilidade`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario` (`usuario`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Índices de tabela `usuario_jogos`
--
ALTER TABLE `usuario_jogos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario_jogo` (`usuario_id`,`jogo_id`),
  ADD KEY `jogo_id` (`jogo_id`);

--
-- Índices de tabela `usuario_lista`
--
ALTER TABLE `usuario_lista`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario_lista` (`usuario_id`,`jogo_id`),
  ADD KEY `jogo_id` (`jogo_id`);

--
-- Índices de tabela `usuario_preferencias`
--
ALTER TABLE `usuario_preferencias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_usuario_preferencias` (`usuario_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `jogos`
--
ALTER TABLE `jogos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plataformas`
--
ALTER TABLE `plataformas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `precos`
--
ALTER TABLE `precos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario_jogos`
--
ALTER TABLE `usuario_jogos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_lista`
--
ALTER TABLE `usuario_lista`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_preferencias`
--
ALTER TABLE `usuario_preferencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `jogo_genero`
--
ALTER TABLE `jogo_genero`
  ADD CONSTRAINT `fk_jg_genero` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jg_jogo` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `jogo_plataforma`
--
ALTER TABLE `jogo_plataforma`
  ADD CONSTRAINT `fk_jp_jogo` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jp_plataforma` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `precos`
--
ALTER TABLE `precos`
  ADD CONSTRAINT `precos_ibfk_1` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_jogos`
--
ALTER TABLE `usuario_jogos`
  ADD CONSTRAINT `usuario_jogos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_jogos_ibfk_2` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_lista`
--
ALTER TABLE `usuario_lista`
  ADD CONSTRAINT `usuario_lista_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuario_lista_ibfk_2` FOREIGN KEY (`jogo_id`) REFERENCES `jogos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_preferencias`
--
ALTER TABLE `usuario_preferencias`
  ADD CONSTRAINT `usuario_preferencias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
