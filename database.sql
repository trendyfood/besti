-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23/10/2024 às 02:47
-- Versão do servidor: 10.11.9-MariaDB
-- Versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `database`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text DEFAULT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `blog_title` text DEFAULT NULL,
  `blog_image` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `blog_content` text DEFAULT NULL,
  `blog_created` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `url` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `name_lang` text NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `child_panels`
--

CREATE TABLE `child_panels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `panel_domain` text DEFAULT NULL,
  `panel_currency` text DEFAULT NULL,
  `panel_status` varchar(225) NOT NULL DEFAULT 'pending',
  `panel_price` text DEFAULT NULL,
  `panel_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `first_name` varchar(225) DEFAULT NULL,
  `last_name` varchar(225) DEFAULT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double NOT NULL,
  `spent` double NOT NULL DEFAULT 0,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) NOT NULL,
  `register_ip` varchar(225) NOT NULL,
  `apikey` text NOT NULL,
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `admin_theme` enum('1','2') NOT NULL DEFAULT '1',
  `referral` varchar(225) DEFAULT NULL,
  `referral_code` varchar(225) NOT NULL,
  `refchar` varchar(225) NOT NULL DEFAULT '0',
  `reforder` varchar(225) NOT NULL DEFAULT '0',
  `total_click` varchar(225) NOT NULL DEFAULT '0',
  `sms_verify` int(11) NOT NULL DEFAULT 1,
  `mail_verify` int(11) NOT NULL DEFAULT 1,
  `currency` int(11) DEFAULT NULL,
  `coustm_rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `clients`
--

INSERT INTO `clients` (`client_id`, `first_name`, `last_name`, `email`, `username`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `register_ip`, `apikey`, `client_type`, `access`, `lang`, `timezone`, `admin_theme`, `referral`, `referral_code`, `refchar`, `reforder`, `total_click`, `sms_verify`, `mail_verify`, `currency`, `coustm_rate`) VALUES
(1, 'Admin', 'Admin (;', 'Admin@gmail.com', 'Admin', '69005bb62e9622ee1de61958aacf0f63', '00000000000', 1250, '2', 0, 123, '2024-01-30 18:22:46', '2024-10-22 23:39:37', '197.44.545.543', '', '', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"tasks\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"blog\":\"1\",\"seo\":\"1\",\"menu\":\"1\",\"subject\":\"1\",\"child_panels\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"modules\":\"1\",\"themes\":\"1\",\"language\":\"1\",\"logs\":\"1\",\"update-prices\":\"1\",\"provider_logs\":\"1\",\"guard_logs\":\"1\",\"bulk\":\"1\",\"bulkc\":\"1\",\"admins\":\"1\",\"kuponlar\":\"1\",\"currency_settings\":\"1\",\"refill\":\"1\",\"crons\":\"1\",\"sam\":\"1\"}', 'pt-BR', -21600, '2', NULL, '2acc4', '0', '0', '0', 1, 2, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `crons`
--

CREATE TABLE `crons` (
  `cron_id` int(11) NOT NULL,
  `cron_name` varchar(50) NOT NULL,
  `cron_operation` varchar(200) NOT NULL,
  `cron_updefault` int(11) NOT NULL DEFAULT 1,
  `cron_endup` int(11) NOT NULL,
  `cron_date_update` timestamp NOT NULL DEFAULT current_timestamp(),
  `cron_status` int(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `crons`
--

INSERT INTO `crons` (`cron_id`, `cron_name`, `cron_operation`, `cron_updefault`, `cron_endup`, `cron_date_update`, `cron_status`) VALUES
(1, 'Pedidos da API', 'API Order', 1, 1, '2024-10-22 23:46:01', 1),
(2, 'Drip-Feed', 'Dripfeed Control', 2, 2, '2024-10-22 23:44:03', 1),
(3, 'Controle de pedidos', 'Order Control', 1, 1, '2024-10-22 23:46:01', 1),
(4, 'Sync', 'API Provider Control', 1, 1, '2024-10-22 23:43:41', 1),
(5, 'Fornecedores', 'Provider', 1, 1, '2024-10-22 23:45:04', 1),
(6, 'Enviar tarefas', 'Posting a Task', 1, 1, '2024-10-22 23:45:04', 1),
(7, 'Alerta de saldo', 'Balance alert', 15, 15, '2024-10-22 23:41:10', 1),
(8, 'Recargas', 'Refill', 1, 1, '2023-10-16 15:22:55', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `crons_report`
--

CREATE TABLE `crons_report` (
  `crons_id` int(11) NOT NULL,
  `crons_service_name` varchar(255) NOT NULL,
  `crons_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `crons_detail` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `symbol` text DEFAULT NULL,
  `value` double DEFAULT NULL,
  `name` varchar(225) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1',
  `default` enum('2','1') NOT NULL DEFAULT '2',
  `nouse` enum('1','2') NOT NULL DEFAULT '2',
  `rate` int(11) NOT NULL,
  `inverse_value` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `currency`
--

INSERT INTO `currency` (`id`, `symbol`, `value`, `name`, `status`, `default`, `nouse`, `rate`, `inverse_value`) VALUES
(1, '$', 0.176, 'USD', '1', '2', '2', 2, 5.691),
(14, '€', 0.162, 'EUR', '1', '2', '2', 2, 6.157),
(23, 'R$', 1, 'BRL', '1', '1', '2', 2, 1),
(28, '₹', 14.773, 'INR', '1', '2', '2', 2, 0.068),
(27, '₽', 16.91, 'RUB', '1', '2', '2', 2, 0.059),
(29, '₺', 6.015, 'TRY', '1', '2', '2', 2, 0.166),
(30, '₦', 288.125, 'NGN', '1', '2', '2', 2, 0.003),
(31, '¥', 1.251, 'CNY', '1', '2', '2', 2, 0.799),
(32, 'د.ك', 0.054, 'KWD', '1', '2', '2', 2, 18.56),
(33, '£', 8.554, 'EGP', '1', '2', '2', 2, 0.117),
(34, 'Rs', 48.874, 'PKR', '1', '2', '2', 2, 0.02),
(35, '₩', 242.317, 'KRW', '1', '2', '2', 2, 0.004),
(36, '฿', 5.88, 'THB', '1', '2', '2', 2, 0.17),
(37, 'ر.س', 0.66, 'SAR', '1', '2', '2', 2, 1.515),
(38, '₫', 4452.811, 'VND', '1', '2', '2', 2, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `decoration`
--

CREATE TABLE `decoration` (
  `id` int(11) NOT NULL,
  `snow_effect` int(3) NOT NULL,
  `snow_colour` text NOT NULL,
  `diwali_lights` int(3) NOT NULL,
  `video_link` text NOT NULL,
  `christmas_deco` varchar(5000) NOT NULL,
  `action_link` text NOT NULL,
  `pop_noti` int(2) NOT NULL,
  `pop_title` text NOT NULL,
  `pop_desc` text NOT NULL,
  `action_text` varchar(10) NOT NULL,
  `action_button` int(2) NOT NULL,
  `snow_fall` varchar(500) DEFAULT NULL,
  `garlands` text DEFAULT NULL,
  `fire_works` text DEFAULT NULL,
  `toys` text DEFAULT NULL,
  `snowflakes` int(10) NOT NULL,
  `snow_speed` int(20) NOT NULL,
  `gar_shape` text NOT NULL,
  `gar_style` text NOT NULL,
  `fire_size` varchar(100) NOT NULL,
  `fire_speed` text NOT NULL,
  `toy_size` int(20) NOT NULL,
  `toy_quantity` int(50) NOT NULL,
  `toy_speed` int(10) NOT NULL,
  `toy_launch` varchar(100) NOT NULL,
  `toy_a` varchar(50) NOT NULL,
  `toy_b` varchar(50) NOT NULL,
  `toy_c` varchar(50) NOT NULL,
  `toy_d` varchar(50) NOT NULL,
  `toy_e` varchar(50) NOT NULL,
  `toy_f` varchar(50) NOT NULL,
  `toy_g` varchar(50) NOT NULL,
  `toy_h` varchar(50) NOT NULL,
  `toy_i` varchar(50) NOT NULL,
  `toy_j` varchar(50) NOT NULL,
  `toy_k` varchar(50) NOT NULL,
  `psw_license` text NOT NULL,
  `toy_l` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `link` text DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `guard_log`
--

CREATE TABLE `guard_log` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` varchar(225) NOT NULL,
  `date` varchar(225) NOT NULL,
  `ip` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `integrations`
--

CREATE TABLE `integrations` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `icon_url` varchar(225) NOT NULL,
  `code` text NOT NULL,
  `visibility` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `integrations`
--

INSERT INTO `integrations` (`id`, `name`, `description`, `icon_url`, `code`, `visibility`, `status`) VALUES
(1, 'Beamer', 'Anuncie atualizações e receba feedback com a central de notificações, widgets e changelog no aplicativo', '/img/integrations/Beamer.svg', '', 1, 1),
(2, 'Getsitecontrol', 'Ele ajuda a evitar que os visitantes do site saiam do seu site sem realizar nenhuma ação.', '/img/integrations/Getsitecontrol.svg', '', 3, 1),
(3, 'Google Analytics', 'Estatísticas e ferramentas analíticas básicas para otimização de mecanismos de pesquisa (SEO) e fins de marketing', '/img/integrations/Google%20Analytics.svg', '', 1, 1),
(4, 'Google Tag manager', 'Gerencie todas as tags do seu site sem editar o código usando soluções simples de gerenciamento de tags', '/img/integrations/Google%20Tag%20manager.svg', '', 1, 1),
(5, 'JivoChat', 'Mensageiro de negócios completo para conversar com os clientes: chat ao vivo, telefone, e-mail e redes sociais', '/img/integrations/JivoChat.svg', '', 1, 1),
(6, 'Onesignal', 'Líder no envolvimento do cliente, capacita mensagens push móveis, web push, e-mail e no aplicativo', '/img/integrations/Onesignal.svg', '', 1, 1),
(7, 'Push alert', 'Aumente o alcance, a receita e redirecione os usuários com notificações push em computadores e dispositivos móveis', '/img/integrations/Push%20alert.svg', '', 1, 1),
(8, 'Smartsupp', 'Bate-papo ao vivo, caixa de entrada de e-mail e Facebook Messenger em uma plataforma de mensagens para clientes', '/img/integrations/Smartsupp.svg', '', 1, 1),
(9, 'Tawk.to', 'Rastreie e converse com visitantes em seu site, aplicativo móvel ou em uma página personalizável gratuita', '/img/integrations/Tawk.to.svg', '', 1, 1),
(10, 'Tidio', 'Comunicador para empresas que mantêm chat ao vivo, chatbots, Messenger e e-mail em um só lugar', '/img/integrations/Tidio.svg', '', 1, 1),
(11, 'Zendesk Chat', 'Ajuda a responder rapidamente às perguntas dos clientes, reduzir os tempos de espera e aumentar as vendas', '/img/integrations/Zendesk%20Chat.svg', '', 1, 1),
(12, 'Getbutton.io', 'Converse com visitantes do site por meio de aplicativos de mensagens populares. Botão de contato do Whatsapp, messenger etc.', '/img/integrations/Getbutton.svg', '', 1, 1),
(13, 'Google reCAPTCHA v2', 'Ele usa um mecanismo avançado de análise de risco e desafios adaptativos para evitar que malware se envolva em atividades abusivas em seu site.', '/img/integrations/reCAPTCHA.svg', '', 1, 2),
(14, 'SEO Adjustments', 'Search Engine Optimization (SEO) é o nome dado a todo o trabalho realizado para que os sites tenham um melhor desempenho nos motores de busca.', '/img/integrations/Seo settings.png', '', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Português (BR)', 'pt-BR', '2', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tag` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `public` int(11) NOT NULL,
  `edit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `menu`
--

INSERT INTO `menu` (`id`, `name`, `tag`, `status`, `public`, `edit`) VALUES
(2, 'API', 'api', 2, 2, 0),
(3, 'Termos', 'terms', 2, 2, 0),
(4, 'FAQ', 'faq', 2, 2, 0),
(5, 'Blog', 'blog', 1, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `menu_line` double NOT NULL,
  `type` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `slug` varchar(225) NOT NULL DEFAULT '2',
  `icon` varchar(225) DEFAULT NULL,
  `menu_status` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `visible` enum('Internal','External') NOT NULL DEFAULT 'Internal',
  `active` varchar(225) NOT NULL,
  `tiptext` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Despejando dados para a tabela `menus`
--

INSERT INTO `menus` (`id`, `name`, `menu_line`, `type`, `slug`, `icon`, `menu_status`, `visible`, `active`, `tiptext`) VALUES
(2, 'New Order', 2, '2', '/', 'fas fa-cart-plus', '1', 'Internal', 'neworder', 'Shown only if Mass Order system enabled for use'),
(4, 'Refill', 5, '2', '/refill', 'fas fa-recycle', '1', 'Internal', 'refill', 'Shown only if user have at least one refill task'),
(5, 'Login', 2, '2', '/', 'fas fa-sign-in-alt', '1', 'External', 'login', ''),
(6, 'Services', 6, '2', '/services', 'fas fa-cogs', '1', 'Internal', 'services', ''),
(7, 'Add Funds', 7, '2', '/addfunds', 'fas fa-cogs', '1', 'Internal', 'addfunds', ''),
(9, 'Tickets ', 9, '2', '/tickets', 'fas fa-headset', '1', 'Internal', 'tickets', ''),
(8, 'Orders', 8, '2', '/orders', 'fas fa-cogs', '1', 'Internal', 'orders', ''),
(11, 'Refer & Earn', 8, '1', '/refer', 'fas fa-cogs', '1', 'Internal', 'refer', 'Shown only if affiliate system enabled for use'),
(15, 'Api', 4, '2', '/api', 'fas fa-code', '1', 'External', 'api', ''),
(18, 'Services', 5, '2', '/services', 'fas fa-list-alt', '1', 'External', 'terms', ''),
(45, 'Terms', 13, '2', 'terms', 'fas fa-cogs', '1', 'Internal', 'terms', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `ajax_name` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `mod_sec` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `modules`
--

INSERT INTO `modules` (`id`, `name`, `description`, `ajax_name`, `status`, `mod_sec`) VALUES
(2, 'Painel Revendedor', 'Um painel com recursos limitados que só pode extrair APIs de você. Os usuários podem solicitar painéis secundários do seu painel.', 'module_child', 2, 1),
(3, 'Saldo Grátis', 'Saldo automático gratuito e único para membros recém-registrados.', 'module_balance', 1, 1),
(6, 'Segurança', 'Segurança máxima 24 horas por dia, 7 dias por semana, limite todas as atividades! 100% de proteção contra ataques.', 'module_guard', 1, 2),
(7, 'Cache ', 'O objetivo é criar um sistema mais eficiente que aumente a velocidade do site, reduzindo o consumo de recursos do site.', 'module_cache', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `news_icon` varchar(225) NOT NULL,
  `news_title` varchar(225) NOT NULL,
  `news_content` varchar(225) NOT NULL,
  `news_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `news`
--

INSERT INTO `news` (`id`, `news_icon`, `news_title`, `news_content`, `news_date`) VALUES
(54, 'instagram', 'Anúncios', 'Agradecemos a todos que vem usando nossos serviços. Sempre estamos fazendo nosso melhor para trazer um serviço de qualidade para vocês.', '2023-12-30 03:14:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications_popup`
--

CREATE TABLE `notifications_popup` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_link` text NOT NULL,
  `isAllPage` enum('0','1') NOT NULL DEFAULT '0',
  `isAllUser` enum('1','0') NOT NULL DEFAULT '0',
  `expiry_date` date NOT NULL,
  `status` enum('1','2','0') NOT NULL DEFAULT '1',
  `allPages` varchar(225) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `action_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text NOT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double DEFAULT NULL,
  `api_currencycharge` double NOT NULL DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double DEFAULT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(1, 'Login', 'auth', ''),
(2, 'Serviços', 'services', ''),
(3, 'FAQ', 'faq', ''),
(4, 'Termos', 'terms', '<h4 style=\"margin-top: 0px; margin-bottom: 0.5rem; line-height: 1.2; font-size: 1.5rem;\" segoe=\"\" ui\",=\"\" roboto,=\"\" oxygen,=\"\" ubuntu,=\"\" cantarell,=\"\" \"open=\"\" sans\",=\"\" \"helvetica=\"\" neue\",=\"\" sans-serif;\"=\"\"><br></h4>'),
(5, 'Novo Pedido', 'neworder', ''),
(6, 'Adicionar Saldo', 'addfunds', ''),
(7, 'Painel Revendedor', 'child-panels', ''),
(8, 'Suporte', 'tickets', ''),
(9, 'Saldo Grátis', 'affiliates', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` double NOT NULL DEFAULT 0,
  `payment_amount` double NOT NULL,
  `papara_amount` double DEFAULT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` text NOT NULL,
  `payment_mode` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`) VALUES
(19, 'MercadoPago (QR code)', 'pix_auto', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"\\u2705\\ufe0f | PIX - Autom\\u00e1tico (M\\u00edn. R$1.00)\",\"min\":\"1\",\"max\":\"0\",\"access_token\":\"APP_USR-5425215792475714-111615-37a950573d8cb8bc090c217cd2131110-1529812768\",\"fee\":\"0\"}', 1),
(52, 'eXPay Brasil', 'pix_auto3', 5, 0, '2', '{\"method_type\":\"2\",\"name\":\"\\u2705\\ufe0f | PIX - Autom\\u00e1tico (M\\u00edn. R$5.00)\",\"min\":\"5\",\"max\":\"0\",\"passphrase\":\"\",\"usd\":\"\",\"merchant_website\":\"$2y$10$SQRsYDaBfFDGzSYR4MrPNOz2JFbpuIGj0uWREk8GeazVvz1DDzadi\",\"fee\":\"0\"}', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `proxy`
--

CREATE TABLE `proxy` (
  `id` int(11) NOT NULL,
  `user` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pass` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ip` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `port` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `referral`
--

CREATE TABLE `referral` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `refferal` int(11) NOT NULL,
  `action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `register_date` varchar(225) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `refill_status`
--

CREATE TABLE `refill_status` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `refill_apiid` int(11) DEFAULT NULL,
  `order_url` text NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `refill_status` mediumtext DEFAULT 'Pending',
  `order_apiid` int(11) DEFAULT 0,
  `refill_response` text DEFAULT NULL,
  `refill_where` enum('site','api') DEFAULT 'site'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `reset_log`
--

CREATE TABLE `reset_log` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `token` varchar(225) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL,
  `operation` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `api_detail` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `service_name` text NOT NULL,
  `service_description` text NOT NULL,
  `service_price` double NOT NULL DEFAULT 0,
  `sync_price` int(11) NOT NULL,
  `sync_rate` int(11) NOT NULL,
  `service_min` double NOT NULL,
  `sync_min` int(11) NOT NULL,
  `service_max` double NOT NULL,
  `sync_max` int(11) NOT NULL,
  `service_dripfeed` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `want_username` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'normal',
  `price_cal` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `start_count` enum('none','instagram_follower','instagram_photo','') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `instagram_private` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `name_lang` text NOT NULL,
  `description_lang` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cancel_type` int(11) NOT NULL DEFAULT 1,
  `refill_type` int(11) NOT NULL DEFAULT 1,
  `refill_time` int(11) NOT NULL,
  `sync_lastcheck` varchar(225) DEFAULT NULL,
  `provider_lastcheck` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Enviar, 1 -> Enviado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `service_api`
--

INSERT INTO `service_api` (`id`, `api_name`, `api_url`, `api_key`, `api_type`, `api_limit`, `api_alert`) VALUES
(73, 'revisionsmm.com', 'https://revisionsmm.com/api/v2', 'Sua Api Key Aqui', 1, 0, '2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_title` text NOT NULL,
  `site_description` text NOT NULL,
  `site_keywords` text NOT NULL,
  `site_currency` text NOT NULL,
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_timezone` int(11) NOT NULL,
  `max_ticket` int(11) NOT NULL DEFAULT 2,
  `skype_area` enum('1','2') NOT NULL DEFAULT '1',
  `name_secret` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `terms_checkbox` int(11) NOT NULL DEFAULT 1,
  `service_speed` enum('1','2') NOT NULL DEFAULT '2',
  `service_list` enum('1','2') NOT NULL DEFAULT '2',
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_newpayment` enum('1','2') NOT NULL,
  `alert_newbankpayment` enum('1','2') NOT NULL DEFAULT '1',
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `alert_failorder` enum('1','2') NOT NULL,
  `admin_mail` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `site_frozen` int(11) NOT NULL DEFAULT 1,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `panel_selling` int(11) NOT NULL,
  `panel_price` int(11) NOT NULL,
  `free_balance` int(11) NOT NULL,
  `free_amount` int(11) NOT NULL,
  `referral` enum('1','2') NOT NULL DEFAULT '1',
  `ref_bonus` int(11) NOT NULL,
  `ref_max` int(11) NOT NULL,
  `ref_type` enum('0','1') NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL,
  `cache_time` int(11) NOT NULL,
  `guard_system_status` int(11) NOT NULL,
  `guard_services_status` int(11) NOT NULL,
  `guard_services_type` int(11) NOT NULL,
  `guard_notify_status` int(11) NOT NULL,
  `guard_notify_type` int(11) NOT NULL,
  `guard_roles_status` int(11) NOT NULL,
  `guard_roles_type` int(11) NOT NULL,
  `guard_apikey_type` int(11) NOT NULL,
  `neworder_terms` int(11) NOT NULL,
  `guard_cron_system` int(11) NOT NULL DEFAULT 1,
  `secret_key` varchar(225) NOT NULL,
  `avarage` int(11) NOT NULL,
  `sms_verify` int(11) NOT NULL DEFAULT 1,
  `mail_verify` int(11) NOT NULL DEFAULT 1,
  `ser_sync` int(11) NOT NULL,
  `auto_refill` varchar(225) DEFAULT NULL,
  `fundstransfer_fees` varchar(10) NOT NULL,
  `panner_confirmation` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 -> ON, 2 -> NO',
  `banner_text_ar` text DEFAULT NULL,
  `banner_text_en` text DEFAULT NULL,
  `banner_url` text DEFAULT NULL,
  `notifacon_popup` enum('1','2') NOT NULL DEFAULT '1',
  `notifications_message` varchar(225) NOT NULL,
  `notifications_url` varchar(225) NOT NULL,
  `notifications_url_text` varchar(225) NOT NULL,
  `enable_transfer_funds` int(11) NOT NULL DEFAULT 1,
  `music_url` text DEFAULT NULL,
  `demo_mode` int(11) NOT NULL DEFAULT 0,
  `otp` int(111) NOT NULL,
  `google` int(111) NOT NULL,
  `gkey` longtext NOT NULL,
  `gsecret` longtext NOT NULL,
  `fake_order_service_enabled` int(111) NOT NULL,
  `fake_order_max` double NOT NULL,
  `min` double NOT NULL,
  `cr_onn` int(111) NOT NULL,
  `coupon_code` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `site_logo`, `site_name`, `site_title`, `site_description`, `site_keywords`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_timezone`, `max_ticket`, `skype_area`, `name_secret`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `terms_checkbox`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_newpayment`, `alert_newbankpayment`, `alert_serviceapialert`, `alert_failorder`, `admin_mail`, `resetpass_page`, `resetpass_email`, `site_maintenance`, `site_frozen`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `admin_telephone`, `resetpass_sms`, `panel_selling`, `panel_price`, `free_balance`, `free_amount`, `referral`, `ref_bonus`, `ref_max`, `ref_type`, `cache`, `cache_time`, `guard_system_status`, `guard_services_status`, `guard_services_type`, `guard_notify_status`, `guard_notify_type`, `guard_roles_status`, `guard_roles_type`, `guard_apikey_type`, `neworder_terms`, `guard_cron_system`, `secret_key`, `avarage`, `sms_verify`, `mail_verify`, `ser_sync`, `auto_refill`, `fundstransfer_fees`, `panner_confirmation`, `banner_text_ar`, `banner_text_en`, `banner_url`, `notifacon_popup`, `notifications_message`, `notifications_url`, `notifications_url_text`, `enable_transfer_funds`, `music_url`, `demo_mode`, `otp`, `google`, `gkey`, `gsecret`, `fake_order_service_enabled`, `fake_order_max`, `min`, `cr_onn`, `coupon_code`) VALUES
(1, 'images/02a32ad2669e6fe298e607fe7cc0e1a0.png', 'RevisionSMM', '', '', '', '23', 'images/08a35293e09f508494096c1c1b3819edb9df50db.png', 'pt-BR', 'osweld', -21600, 99, '1', '1', '1', '6LcPn30oAAAAAMGlzWOBYKDm2za9qlDNLqpLBiwh', '6LcPn30oAAAAAG_SzqF7thPFPHE6Mkqj_0b-DM3T', '', '', '2', '2', 2, '1', '2', 1, 1, 'emaildahospedagemaqui@gmail.com', '123456789', 'smtp.hostinger.com', '587', 'tls', '2', '1', '1', '1', '1', '1', '1', '1', 'seuemail@gmail.com', '2', '2', '2', 1, '', '', '', '', '', '', 2, 10, 1, 10, '2', 2, 25, '1', 2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, '', 0, 0, 1, 1, '2', '', '', NULL, NULL, NULL, '', '', '', '', 0, NULL, 0, 0, 2, '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', '1091242934112-t3gjd8e80ak0phm0s55bumnbu895ot46.apps.googleusercontent.com', 2, 100, 10, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `task_type` varchar(225) DEFAULT NULL,
  `task_status` varchar(225) DEFAULT 'pending',
  `task_date` datetime DEFAULT NULL,
  `refill_orderid` varchar(225) DEFAULT NULL,
  `res` mediumtext NOT NULL,
  `check_refill_status` int(111) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Despejando dados para a tabela `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`) VALUES
(39, 'Tema-2', 'osweld', '\n{\"stylesheets\":[\"css/panel/osweld/bootstrap.min.css\",\"css/panel/osweld/style.css\",\"js\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\",\"https:\\/\\/cdn.mypanel.link\\/css\\/font-awesome\\/css\\/all.min.css\"],\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/panel/osweld/script.js\",\"js/1main.js\",\"js/panel/osweld/bootstrap.min.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}'),
(77, 'Tema-1', 'smmaxom', '{\"scripts\":[\"https:\\/\\/cdnjs.cloudflare.com\\/ajax\\/libs\\/jquery\\/1.12.4\\/jquery.min.js\",\"js/main.js\",\"js\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"js\\/datepicker\\/locales\\/bootstrap-datepicker.tr.min.js\"]}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `support_team` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ticket_subjects`
--

CREATE TABLE `ticket_subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `content` text DEFAULT NULL,
  `auto_reply` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ticket_subjects`
--

INSERT INTO `ticket_subjects` (`subject_id`, `subject`, `content`, `auto_reply`) VALUES
(5, 'Pedido', '', '0'),
(6, 'Pagamento', '', '0'),
(8, 'Outros Assuntos', '', '0');

-- --------------------------------------------------------

--
-- Estrutura para tabela `verify_log`
--

CREATE TABLE `verify_log` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `token` varchar(225) NOT NULL,
  `type` int(11) NOT NULL,
  `verify` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Índices de tabela `child_panels`
--
ALTER TABLE `child_panels`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices de tabela `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `crons`
--
ALTER TABLE `crons`
  ADD PRIMARY KEY (`cron_id`);

--
-- Índices de tabela `crons_report`
--
ALTER TABLE `crons_report`
  ADD PRIMARY KEY (`crons_id`);

--
-- Índices de tabela `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `decoration`
--
ALTER TABLE `decoration`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `guard_log`
--
ALTER TABLE `guard_log`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notifications_popup`
--
ALTER TABLE `notifications_popup`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `api_orderid` (`api_orderid`),
  ADD KEY `order_api` (`order_api`),
  ADD KEY `api_serviceid` (`api_serviceid`);

--
-- Índices de tabela `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `page_id` (`page_id`);

--
-- Índices de tabela `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `payment_privatecode` (`payment_privatecode`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `client_balance` (`client_balance`),
  ADD KEY `payment_amount` (`payment_amount`),
  ADD KEY `payment_method` (`payment_method`),
  ADD KEY `payment_status` (`payment_status`);

--
-- Índices de tabela `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Índices de tabela `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `proxy`
--
ALTER TABLE `proxy`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `refill_status`
--
ALTER TABLE `refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `reset_log`
--
ALTER TABLE `reset_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Índices de tabela `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Índices de tabela `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

--
-- Índices de tabela `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Índices de tabela `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Índices de tabela `verify_log`
--
ALTER TABLE `verify_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de tabela `child_panels`
--
ALTER TABLE `child_panels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3652;

--
-- AUTO_INCREMENT de tabela `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45885;

--
-- AUTO_INCREMENT de tabela `crons`
--
ALTER TABLE `crons`
  MODIFY `cron_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `crons_report`
--
ALTER TABLE `crons_report`
  MODIFY `crons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324687;

--
-- AUTO_INCREMENT de tabela `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `decoration`
--
ALTER TABLE `decoration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guard_log`
--
ALTER TABLE `guard_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `integrations`
--
ALTER TABLE `integrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `notifications_popup`
--
ALTER TABLE `notifications_popup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27192;

--
-- AUTO_INCREMENT de tabela `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12634;

--
-- AUTO_INCREMENT de tabela `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `proxy`
--
ALTER TABLE `proxy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `referral`
--
ALTER TABLE `referral`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `refill_status`
--
ALTER TABLE `refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de tabela `reset_log`
--
ALTER TABLE `reset_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT de tabela `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2664;

--
-- AUTO_INCREMENT de tabela `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=939;

--
-- AUTO_INCREMENT de tabela `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de tabela `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3820;

--
-- AUTO_INCREMENT de tabela `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4803;

--
-- AUTO_INCREMENT de tabela `ticket_subjects`
--
ALTER TABLE `ticket_subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `verify_log`
--
ALTER TABLE `verify_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
