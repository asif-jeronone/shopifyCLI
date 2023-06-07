-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 07, 2023 at 05:51 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock_notification`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_product_updates`
--

CREATE TABLE `email_product_updates` (
  `id` int(11) NOT NULL,
  `shop` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `body_content` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_product_updates`
--

INSERT INTO `email_product_updates` (`id`, `shop`, `heading`, `body_content`, `created_at`, `updated_at`) VALUES
(1, 'jeronone-app.myshopify.com', 'Notify me', NULL, '2023-05-20 10:22:46', '2023-06-06 12:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2021_05_03_050717_create_sessions_table', 1),
(3, '2021_05_05_071311_add_scope_expires_access_token_to_sessions', 1),
(4, '2021_05_11_151158_add_online_access_info_to_sessions', 1),
(5, '2021_05_17_152611_change_sessions_user_id_type', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `title`, `handle`, `created_at`, `updated_at`) VALUES
(1, '8351005442347', 'Test Product', 'test-product', '2023-05-26 06:31:43', '2023-05-26 06:31:43'),
(2, '8351603622187', 'My product', 'my-product', '2023-05-26 10:32:59', '2023-05-26 10:32:59'),
(3, '8351650578731', 'vvvvvvvvvvvvvvvvvv', 'vvvvvvvvvvvvvvvvvv', '2023-05-26 10:56:47', '2023-05-26 10:56:47'),
(4, '8351722144043', 'fgfgfg', 'fgfgfg', '2023-05-26 11:31:05', '2023-05-26 11:31:05'),
(5, '8351783682347', 'trhrthrth vvvvvv', 'trhrthrth-vvvvvv', '2023-05-26 12:02:14', '2023-05-26 12:02:14'),
(6, '8351789580587', 'ffsfsd', 'ffsfsd', '2023-05-26 12:04:17', '2023-05-26 12:04:17'),
(7, '8351796003115', 'ghfhdgh', 'ghfhdgh', '2023-05-26 12:06:53', '2023-05-26 12:06:53'),
(8, '8351800197419', 'bbbbbbbbbbb', 'bbbbbbbbbbb', '2023-05-26 12:11:50', '2023-05-26 12:11:50'),
(9, '8351808160043', 'aaaa', 'aaaa', '2023-05-26 12:14:18', '2023-05-26 12:14:18'),
(10, '8351810978091', 'dsd', 'dsd', '2023-05-26 12:16:09', '2023-05-26 12:16:09'),
(11, '8351812223275', 'ad', 'ad', '2023-05-26 12:18:13', '2023-05-26 12:18:13'),
(12, '8351822381355', 'aaa123', 'aaa123', '2023-05-26 12:26:22', '2023-05-26 12:26:22'),
(13, '8351826542891', 'aaaaaa1111111', 'aaaaaa1111111', '2023-05-26 12:27:42', '2023-05-26 12:27:42'),
(14, '8351832441131', 'hhty', 'hhty', '2023-05-26 12:29:55', '2023-05-26 12:29:55'),
(15, '8351835554091', 'sdvsf', 'sdvsf', '2023-05-26 12:30:49', '2023-05-26 12:30:49'),
(16, '8351846727979', 'gfhfgh', 'gfhfgh', '2023-05-26 12:34:42', '2023-05-26 12:34:42'),
(17, '8351848530219', 'xvxcbxb', 'xvxcbxb', '2023-05-26 12:35:54', '2023-05-26 12:35:54'),
(18, '8351849087275', 'dfgdf', 'dfgdf', '2023-05-26 12:37:06', '2023-05-26 12:37:06'),
(19, '8351849251115', 'vb vb', 'vb-vb', '2023-05-26 12:37:44', '2023-05-26 12:37:44'),
(20, '8351851610411', 'fghfgh', 'fghfgh', '2023-05-26 12:40:50', '2023-05-26 12:40:50'),
(21, '8351856460075', 'aaabbbbccc', 'aaabbbbccc', '2023-05-26 12:42:18', '2023-05-26 12:42:18'),
(22, '8351859605803', 'fffff', 'fffff', '2023-05-26 12:44:34', '2023-05-26 12:44:34'),
(23, '8351860654379', 'gfbfg', 'gfbfg', '2023-05-26 12:45:39', '2023-05-26 12:45:39'),
(24, '8351862292779', 'hrthrt', 'hrthrt', '2023-05-26 12:47:25', '2023-05-26 12:47:25'),
(25, '8351866257707', 'svsfv', 'svsfv', '2023-05-26 12:49:43', '2023-05-26 12:49:43'),
(26, '8351885066539', 'getg', 'getg', '2023-05-26 12:59:44', '2023-05-26 12:59:44'),
(27, '8351891620139', 'thrth', 'thrth', '2023-05-26 13:05:17', '2023-05-26 13:05:17'),
(28, '8351958532395', 'faaaaaaaaaaaaaaaadgfdgdfgdfhdfh', 'faaaaaaaaaaaaaaaadgfdgdfgdfhdfh', '2023-05-26 13:30:16', '2023-05-26 13:30:16'),
(29, '8351962497323', 'fgfdhdgh', 'fgfdhdgh', '2023-05-26 13:32:14', '2023-05-26 13:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `shop` varchar(255) NOT NULL,
  `is_online` tinyint(1) NOT NULL,
  `state` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_first_name` varchar(255) DEFAULT NULL,
  `user_last_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_email_verified` tinyint(1) DEFAULT NULL,
  `account_owner` tinyint(1) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `collaborator` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_details`
--

CREATE TABLE `shop_details` (
  `id` int(11) NOT NULL,
  `shop_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `sub_domain` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_syncs`
--

CREATE TABLE `shop_syncs` (
  `id` int(11) NOT NULL,
  `store_one` varchar(255) DEFAULT NULL,
  `store_two` varchar(255) DEFAULT NULL,
  `store_three` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_syncs`
--

INSERT INTO `shop_syncs` (`id`, `store_one`, `store_two`, `store_three`, `created_at`, `updated_at`) VALUES
(1, 'jeronone-app.myshopify.com', 'jptl-myapp.myshopify.com', '', '2023-06-01 06:34:48', '2023-06-01 06:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `store` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `variant_id` varchar(255) DEFAULT NULL,
  `product_variant` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `email_product_updates`
--
ALTER TABLE `email_product_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sessions_session_id_unique` (`session_id`);

--
-- Indexes for table `shop_details`
--
ALTER TABLE `shop_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_syncs`
--
ALTER TABLE `shop_syncs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `email_product_updates`
--
ALTER TABLE `email_product_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_details`
--
ALTER TABLE `shop_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_syncs`
--
ALTER TABLE `shop_syncs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
