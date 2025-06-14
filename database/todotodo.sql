-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 08:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todotodo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_12_130015_create_tasks_table', 1),
(6, '2025_06_12_145608_create_sessions_table', 2),
(7, '2025_06_13_030648_add_api_token_to_users_table', 2),
(8, '2025_06_13_155438_change_priority_to_string_in_tasks_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '130f6cc76658542b41da1b8be696407b6e59f08cd78ca2c536b5f620b42adcd6', '[\"*\"]', NULL, NULL, '2025-06-13 06:08:30', '2025-06-13 06:08:30'),
(2, 'App\\Models\\User', 1, 'auth_token', 'f839473607695e52849f07c18fd4eaf16ca9f1b2fc2e9093885026e79d9117b6', '[\"*\"]', NULL, NULL, '2025-06-13 06:08:47', '2025-06-13 06:08:47'),
(3, 'App\\Models\\User', 2, 'auth_token', '64cb98df5d9f8e373b6894dd25b8ecfa044a605eb852a82f7c52bed7e9dd76aa', '[\"*\"]', NULL, NULL, '2025-06-13 06:28:22', '2025-06-13 06:28:22'),
(4, 'App\\Models\\User', 2, 'auth_token', '673f8bbaf3f1a8fa19101f4a36dd57063e19222f462b14307a2aee2e00ac8f3a', '[\"*\"]', NULL, NULL, '2025-06-13 06:28:36', '2025-06-13 06:28:36'),
(5, 'App\\Models\\User', 3, 'auth_token', '6f99defb686467561dd3be8ad9e59d5b945885a67b23622adf93e484bedbf759', '[\"*\"]', NULL, NULL, '2025-06-13 08:15:18', '2025-06-13 08:15:18'),
(6, 'App\\Models\\User', 3, 'auth_token', 'd01a0cfaa69e5e6f3e8597021196e2f3eb9339c105fa38bd99c30927b5f830c2', '[\"*\"]', NULL, NULL, '2025-06-13 08:15:34', '2025-06-13 08:15:34'),
(7, 'App\\Models\\User', 4, 'auth_token', 'f865c10cd7ac4ac5468cee0310d44f0872611bf66dce7f83158c2516c9aed558', '[\"*\"]', NULL, NULL, '2025-06-13 08:28:53', '2025-06-13 08:28:53'),
(8, 'App\\Models\\User', 4, 'auth_token', '342f18ef2d61fb0f060616dde0dd909bffd2806e4aab0a78d8ac0332d84434c3', '[\"*\"]', NULL, NULL, '2025-06-13 08:29:07', '2025-06-13 08:29:07'),
(9, 'App\\Models\\User', 5, 'auth_token', 'b356396dc5acfcc477891ead3c0b574c4a2c02a98c2f0b7b9d7f630e11b25827', '[\"*\"]', NULL, NULL, '2025-06-13 08:44:46', '2025-06-13 08:44:46'),
(10, 'App\\Models\\User', 5, 'auth_token', '36fbd2e1fb047ab393d7662a6fb0898e37535b80e8f757ba3de1efed45ce9bd8', '[\"*\"]', NULL, NULL, '2025-06-13 08:44:58', '2025-06-13 08:44:58'),
(11, 'App\\Models\\User', 6, 'auth_token', '722ee7b394eb2dbac2cc325f452f8ef1d442bb9b0930f80d8a544a4ec4ba805b', '[\"*\"]', NULL, NULL, '2025-06-13 09:11:59', '2025-06-13 09:11:59'),
(12, 'App\\Models\\User', 6, 'auth_token', '6c5a2975d116864dd0bf69c2c4810731d4664283258f0e540050f4f82210bc58', '[\"*\"]', NULL, NULL, '2025-06-13 09:12:12', '2025-06-13 09:12:12'),
(13, 'App\\Models\\User', 5, 'auth_token', '6d737ea15560f0e07d85687e42fa24dcb9012172f0c6be11c031cf11abf54af9', '[\"*\"]', NULL, NULL, '2025-06-13 09:20:18', '2025-06-13 09:20:18'),
(14, 'App\\Models\\User', 5, 'auth_token', 'e46af70a40925644050223dda4f6c010c5c76198967d1ceaf9de42e67bca8c42', '[\"*\"]', NULL, NULL, '2025-06-13 09:32:10', '2025-06-13 09:32:10'),
(15, 'App\\Models\\User', 5, 'auth_token', '673a6d71c85816bf58894949348970b1a53696d6e4e257f2ff7cd5a195902f31', '[\"*\"]', NULL, NULL, '2025-06-13 09:33:01', '2025-06-13 09:33:01'),
(16, 'App\\Models\\User', 5, 'auth_token', '1068db16f55a65bc941501b6c5688dd919aea4f4061da0801076e3f1c1945f9e', '[\"*\"]', NULL, NULL, '2025-06-13 09:41:17', '2025-06-13 09:41:17'),
(17, 'App\\Models\\User', 7, 'auth_token', '547ce84473e1857143ce853f9392d295014bd140b86d4b29f98792124078c07b', '[\"*\"]', NULL, NULL, '2025-06-13 15:59:22', '2025-06-13 15:59:22'),
(18, 'App\\Models\\User', 7, 'auth_token', '1d38931644ecfa3e736521f593d2fecd9ccc564e35cf785ed3a023b77667122d', '[\"*\"]', NULL, NULL, '2025-06-13 15:59:48', '2025-06-13 15:59:48'),
(19, 'App\\Models\\User', 8, 'auth_token', '412baf5316ecca48fb75d824161a7c737223f966de63dd4bbda7a7de7a2005d9', '[\"*\"]', NULL, NULL, '2025-06-13 16:11:47', '2025-06-13 16:11:47'),
(20, 'App\\Models\\User', 8, 'auth_token', '07541922280436ceb5400c0fb653d631347694fe42812f9514ebdb810e2b8304', '[\"*\"]', NULL, NULL, '2025-06-13 16:11:59', '2025-06-13 16:11:59'),
(21, 'App\\Models\\User', 8, 'auth_token', '93d48a921f347140b26dd88e72b9823a5a34dee3a2c2085518b3225f973d5f3f', '[\"*\"]', NULL, NULL, '2025-06-13 16:16:14', '2025-06-13 16:16:14'),
(22, 'App\\Models\\User', 8, 'auth_token', 'ccf8240ea2d545dde09da103c6f832a99cbc15647d7f0babeee824019239aa1f', '[\"*\"]', NULL, NULL, '2025-06-13 16:27:51', '2025-06-13 16:27:51'),
(23, 'App\\Models\\User', 8, 'auth_token', '5a5d148bb50ec8cece9f973ec8a245a946aa06b607934253a9edf9f3a54da849', '[\"*\"]', '2025-06-13 17:53:59', NULL, '2025-06-13 16:34:03', '2025-06-13 17:53:59'),
(24, 'App\\Models\\User', 5, 'auth_token', '25f89fad16714b54970c52b19ee189e0aa681ca89e5f9313c8ee8049f475d8c1', '[\"*\"]', NULL, NULL, '2025-06-13 17:43:28', '2025-06-13 17:43:28'),
(25, 'App\\Models\\User', 5, 'auth_token', 'c62844c2b89c77a9a33e62811ab1a73a498803bad98f201f043df88d67e8e322', '[\"*\"]', NULL, NULL, '2025-06-13 17:55:25', '2025-06-13 17:55:25'),
(26, 'App\\Models\\User', 5, 'auth_token', '3e5e502fe26feafdf29bbc749c1a1ee2fc756d1845d89104abb40eaaf0a30d57', '[\"*\"]', NULL, NULL, '2025-06-13 17:58:02', '2025-06-13 17:58:02'),
(27, 'App\\Models\\User', 8, 'auth_token', '5b47aac066ce615f9b70f2e4bdf9f3b105ec07032ac47331d31bc2515c8b97ef', '[\"*\"]', NULL, NULL, '2025-06-13 18:57:58', '2025-06-13 18:57:58'),
(28, 'App\\Models\\User', 8, 'auth_token', '1fb518508e5b5ecd25bac16a340b2bb7119d000380d16fa745aa4192245083d8', '[\"*\"]', '2025-06-13 19:23:50', NULL, '2025-06-13 19:06:02', '2025-06-13 19:23:50'),
(29, 'App\\Models\\User', 8, 'auth_token', 'f142d3b2492a21f043f0891aad3068f821387a7eee5b55a8babbb9350dbb07f3', '[\"*\"]', NULL, NULL, '2025-06-13 19:07:06', '2025-06-13 19:07:06'),
(30, 'App\\Models\\User', 8, 'auth_token', 'a79605098ff225e770689e868e2d787bdcc4693c78a13312b7306c98607268b5', '[\"*\"]', NULL, NULL, '2025-06-13 19:20:56', '2025-06-13 19:20:56'),
(31, 'App\\Models\\User', 8, 'auth_token', 'a8c83fdd6f3cb1ba7a8ac846f4925226c0fb439f8b5a78c2b67e592a8305ccff', '[\"*\"]', NULL, NULL, '2025-06-13 19:41:18', '2025-06-13 19:41:18'),
(32, 'App\\Models\\User', 8, 'auth_token', 'aeee7687c28bff2ead77a4c8c3ecd5ff263d642e435a7f2dab9fd3064fe431ea', '[\"*\"]', NULL, NULL, '2025-06-13 19:44:09', '2025-06-13 19:44:09'),
(33, 'App\\Models\\User', 5, 'auth_token', '46d04e9146b2d2b916878bc600477cb0206171de8f2080be2f75ddf9b02e683b', '[\"*\"]', NULL, NULL, '2025-06-13 19:46:51', '2025-06-13 19:46:51'),
(34, 'App\\Models\\User', 5, 'auth_token', 'f66240892b004080a3bf032b0dfca30bc02cb05138e202c23a0d2329c02fa25b', '[\"*\"]', '2025-06-13 19:51:56', NULL, '2025-06-13 19:51:55', '2025-06-13 19:51:56'),
(35, 'App\\Models\\User', 5, 'auth_token', 'fbbdd4d057987d0b7a6cb102e41d7c6ac7ac99d3a0f005af8f7c3a766a5e7a75', '[\"*\"]', '2025-06-13 19:58:26', NULL, '2025-06-13 19:56:58', '2025-06-13 19:58:26'),
(36, 'App\\Models\\User', 5, 'auth_token', '871d1ed646a304afe9cacdb197622e32fca3981aa92367873cfcf93a52b19a52', '[\"*\"]', '2025-06-13 20:08:19', NULL, '2025-06-13 20:07:21', '2025-06-13 20:08:19'),
(37, 'App\\Models\\User', 8, 'auth_token', '2e37a34f94b45c73cd16a191de1159b74ca4dbd776a63ddac200861ff7321d45', '[\"*\"]', '2025-06-13 20:33:14', NULL, '2025-06-13 20:33:13', '2025-06-13 20:33:14'),
(38, 'App\\Models\\User', 8, 'auth_token', 'a55d242eeeaebdb64dd4a5341697fe57d92a52488e28cba85f2d13f542c2a1ab', '[\"*\"]', '2025-06-13 20:33:35', NULL, '2025-06-13 20:33:34', '2025-06-13 20:33:35'),
(39, 'App\\Models\\User', 5, 'auth_token', '1a8f1bdc59916d76eb39ff0a3706827a430c40e9aead5b239aff43356c944fde', '[\"*\"]', '2025-06-13 20:38:25', NULL, '2025-06-13 20:38:03', '2025-06-13 20:38:25'),
(40, 'App\\Models\\User', 5, 'auth_token', '465055ce3f73976dc30a218975ea06c703fafcc4eaa68ae85d8851df95a21463', '[\"*\"]', '2025-06-13 20:51:54', NULL, '2025-06-13 20:50:38', '2025-06-13 20:51:54'),
(41, 'App\\Models\\User', 8, 'auth_token', 'd0c1f855ae6c3deacf61d50d534d431337612c39969cdace7c630782c25bcacd', '[\"*\"]', '2025-06-13 20:56:25', NULL, '2025-06-13 20:55:36', '2025-06-13 20:56:25'),
(42, 'App\\Models\\User', 8, 'auth_token', '55baf8363db48332ccdd4024daf7c29a3496bc699427cf487c3ff3d08d70e215', '[\"*\"]', '2025-06-13 21:05:28', NULL, '2025-06-13 21:04:00', '2025-06-13 21:05:28'),
(43, 'App\\Models\\User', 8, 'auth_token', '7ecedbc5516fe7580d715dc97f6b1d63951482df19f18c2f0e4b1c5e75412a01', '[\"*\"]', '2025-06-13 21:10:02', NULL, '2025-06-13 21:09:13', '2025-06-13 21:10:02'),
(44, 'App\\Models\\User', 5, 'auth_token', '67bcc96b558cafd6b7afb2f4977f587a60f5a63fd2375d3f4aef075a89a31dca', '[\"*\"]', '2025-06-13 21:22:41', NULL, '2025-06-13 21:21:56', '2025-06-13 21:22:41'),
(45, 'App\\Models\\User', 5, 'auth_token', '5193d75b9a8b9d5d1d1ef5aafdbbe17936c81eecf7e35312763cfdd529c6a9e4', '[\"*\"]', '2025-06-13 21:26:52', NULL, '2025-06-13 21:26:05', '2025-06-13 21:26:52'),
(46, 'App\\Models\\User', 9, 'auth_token', '747c21a1d0cd554535e03ed9c26c352d10988fec56cf28ab976fbd6734f148b6', '[\"*\"]', NULL, NULL, '2025-06-13 21:30:06', '2025-06-13 21:30:06'),
(47, 'App\\Models\\User', 9, 'auth_token', '7a4722410fe5fa36d638edd957c6e88744b5bbb87a7bdc8cd2096c0acfb5429a', '[\"*\"]', '2025-06-13 21:31:39', NULL, '2025-06-13 21:30:19', '2025-06-13 21:31:39'),
(48, 'App\\Models\\User', 10, 'auth_token', '680e1d3bb10239ee5ddaf7c854e8b44f94960bf06a78208df424d9c0d7d11cc3', '[\"*\"]', NULL, NULL, '2025-06-13 22:21:34', '2025-06-13 22:21:34'),
(49, 'App\\Models\\User', 10, 'auth_token', '6e25eafae821cb776f358e75206d1916ee650ce124938b490ac52bad0fa784a3', '[\"*\"]', '2025-06-13 22:22:45', NULL, '2025-06-13 22:21:52', '2025-06-13 22:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('y8tqyZJGV3uR1IPV7Axp8gfCOFdfG7CSM8SzLm3y', NULL, '192.168.117.110', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTh3V0dnS2FzVGsySDB6SjI0Y1lXNmVmUDZWTndvaGpUV1Y1WDh3ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjExNy4xMDc6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749857955);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `due_date` datetime NOT NULL,
  `priority` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
