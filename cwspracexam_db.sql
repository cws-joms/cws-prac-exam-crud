-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2023 at 11:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cwspracexam_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `middle_name`, `birth_date`, `gender`, `marital_status`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Jomari Pogi', 'Victoria', 'Gantan', '1997-06-30', 'Male', 'Widowed', '2023-09-07 08:22:48', '2023-09-07 08:29:08', 1),
(2, 'Joms', 'Victoria', 'Gantan', '1997-06-30', 'Male', 'Widowed', '2023-09-07 08:29:34', '2023-09-07 08:29:53', 1),
(3, 'Joms', 'Victoria', 'Gantan', '1997-06-30', 'Male', 'Widowed', '2023-09-07 08:29:34', '2023-09-07 08:29:56', 1),
(4, 'Joms asd', 'Victoria', 'Gantan', '1997-06-30', 'Male', 'Widowed', '2023-09-07 08:29:48', '2023-09-07 08:29:58', 1),
(5, 'Kevin', 'Tobias Lamperouge', 'Delfin', '1997-04-21', 'Female', 'Widowed', '2023-09-07 08:30:24', '2023-09-07 11:45:42', 0),
(6, 'Keon Dave', 'Bauzon', 'Alvendia', '2023-07-05', 'Male', 'Single', '2023-09-07 08:33:45', '2023-09-07 08:33:45', 0),
(7, 'test customer213', 'tester', 'testing', '1956-05-03', 'Male', 'Widowed', '2023-09-07 11:44:11', '2023-09-07 12:25:52', 1),
(8, 'Final1', 'Product1', 'Test1', '1992-03-07', 'Female', 'Widowed', '2023-09-07 12:24:28', '2023-09-07 12:25:10', 0),
(9, 'huhuhu', 'huhuhuh', 'hhuh', '1994-06-05', 'Male', 'Single', '2023-09-07 12:38:00', '2023-09-07 12:54:15', 1),
(10, 'Mari', 'Di Mapigilann', 'Test', '1985-09-05', 'Female', 'Widowed', '2023-09-07 12:53:30', '2023-09-07 12:53:37', 0);

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
(5, '2014_10_12_000000_create_users_table', 1),
(12, '2014_10_12_100000_create_password_resets_table', 2),
(13, '2019_08_19_000000_create_failed_jobs_table', 2),
(14, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(15, '2023_09_03_194204_create_users_table', 2),
(16, '2023_09_06_184554_create_customers_table', 2),
(17, '2023_09_07_154116_create_transactions_table', 3),
(18, '2023_09_07_155140_create_products_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `quantity`, `in_stock`, `unit_price`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Sample Product', 'This is a sample product hehehe', 4, 0, 151.00, '2023-09-07 12:12:47', '2023-09-07 12:17:09', 1),
(2, 'asdsad', 'dsadsa', 2, 0, 124.00, '2023-09-07 12:26:26', '2023-09-07 12:59:36', 1),
(3, 'ddsdsds', 'dsdsasdasddsadsadds', 1, 0, 14.00, '2023-09-07 12:30:03', '2023-09-07 12:30:24', 1),
(4, 'Sample Product', 'This is just a sample product angsakitngulokogustokonamatulog to test', 15, 1, 185.00, '2023-09-07 12:42:07', '2023-09-07 12:42:07', 0),
(5, 'Sample Product 2', 'Sampleeeeeeeweqewqe', 20, 1, 28.00, '2023-09-07 12:59:23', '2023-09-07 12:59:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` varchar(255) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `reference_id`, `customer_id`, `product_name`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, '20230907190601', 5, 'Sample', 3, 25.00, '2023-09-07 11:06:01', '2023-09-07 11:06:01'),
(2, '20230907190830', 6, 'Sample 2', 5, 20.00, '2023-09-07 11:08:30', '2023-09-07 11:08:30'),
(3, '20230907194005', 5, 'Keyboard', 2, 2000.00, '2023-09-07 11:40:05', '2023-09-07 11:40:05'),
(4, '20230907194446', 7, 'test prod', 25, 151.00, '2023-09-07 11:44:46', '2023-09-07 11:44:46'),
(5, '20230907202530', 8, 'Sample Product', 2, 25.00, '2023-09-07 12:25:30', '2023-09-07 12:25:30'),
(6, '20230907203916', 9, 'product to', 12, 1289.00, '2023-09-07 12:39:16', '2023-09-07 12:39:16'),
(7, '20230907204039', 9, 'gamit', 2, 124.00, '2023-09-07 12:40:39', '2023-09-07 12:40:39'),
(8, '20230907205405', 10, 'Wifi', 10, 1500.00, '2023-09-07 12:54:05', '2023-09-07 12:54:05');

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
  `role` varchar(255) NOT NULL DEFAULT 'USER',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `is_deleted`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@domain.com', '2023-09-06 11:02:20', '$2y$10$Lt.MH96bQMofDPa6bArQsOrwWdocjDwMOAbZe9E4ZkMnFSrwVy/RW', 'ADMIN', 0, 'NVrNkfykBMFOtju1Gb82PGOTIjd8I2aibXd4EnXmpORHZriKgk1bzOm78qNR', '2023-09-06 11:02:20', '2023-09-06 11:02:20'),
(2, 'Jomari Victoriaaa', 'jomarivictoria199@gmail.com', NULL, '$2y$10$4UUunbLzX1BaeMpuhG7vne86iNcLeuOpnCAI/qAEiSB4Fgkrm90FO', 'ADMIN', 1, NULL, '2023-09-06 11:06:53', '2023-09-06 11:08:28'),
(3, 'Jomari Victoria', 'jomarivictoria@gmail.com', NULL, '$2y$10$AsMHTxTDAJYIhZj9nrX.tO7sVbdgF1td6F1yKOgXTzurubRlJzGb6', 'ADMIN', 0, NULL, '2023-09-06 12:15:43', '2023-09-06 12:17:07'),
(4, 'asdasd', 'asd@mail.coms', NULL, '$2y$10$zUKk.Umc8xjRwc/m/dEMuu1fy3eigtVRBmkTcoMgGanC4.HDaWswm', 'ADMIN', 1, NULL, '2023-09-07 08:11:48', '2023-09-07 08:12:03'),
(5, 'Test User1', 'testuser@gmail.com', NULL, '$2y$10$J0/FOyjCOdfCMq27ZlQageMNabnCiOPVLMKTh8CjPwMKNv.eHoDB2', 'USER', 1, NULL, '2023-09-07 11:43:35', '2023-09-07 11:43:52'),
(6, 'Final Test1', 'test@test1.com', NULL, '$2y$10$jIXV/8PtIu8M2XT24jTrY.3.L/Rqu795uaaOSLzUBAIqGHyq3SRam', 'USER', 1, NULL, '2023-09-07 12:23:51', '2023-09-07 12:24:10'),
(7, 'testing2', 'test@mai1l.com', NULL, '$2y$10$Nll12hrnUHS7mUQBkp15MuVUpdYx8bui.MChxI2FTymUlZMJsEFi6', 'USER', 1, NULL, '2023-09-07 12:49:20', '2023-09-07 12:49:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
