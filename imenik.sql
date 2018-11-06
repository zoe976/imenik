-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2018 at 11:36 PM
-- Server version: 5.7.14
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imenik`
--

-- --------------------------------------------------------

--
-- Table structure for table `informations`
--

CREATE TABLE `informations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_number` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `informations`
--

INSERT INTO `informations` (`id`, `name`, `surname`, `phone_number`, `city`, `street`, `house_number`, `created_at`, `updated_at`) VALUES
(1, 'Petar', 'Petrovic', '123456', 'Beograd', 'Semjuela Beketa', 13, '2018-11-04 13:22:45', '2018-11-04 13:22:45'),
(2, 'Mirko', 'Mirkovic', '232323', 'Nis', 'Dusanova', 3, '2018-11-04 13:25:31', '2018-11-04 14:30:48'),
(3, 'Milica', 'Jovanovic', '6565654', 'Beograd', 'Bulevar umetnosti', 10, '2018-11-04 13:27:17', '2018-11-04 13:27:17'),
(4, 'Jelena', 'Stanjevic', '543554354', 'Beograd', 'Svetogorska', 23, '2018-11-04 13:28:38', '2018-11-04 13:28:38'),
(5, 'Milos', 'Milosevic', '45654654', 'Nis', 'Durmitorska', 34, '2018-11-04 13:30:32', '2018-11-04 14:30:31'),
(6, 'Ivan', 'Ivanovic', '7645745', 'Kragujevac', 'Vojvode Misica', 34, '2018-11-04 13:32:16', '2018-11-04 13:32:16'),
(7, 'Goran', 'Stevanovic', '654654654', 'Uzice', 'Zlatiborska', 11, '2018-11-04 13:33:51', '2018-11-04 14:30:20'),
(8, 'Dusan', 'Markovic', '43543543', 'Uzice', 'Karadjordjeva', 23, '2018-11-04 13:39:52', '2018-11-04 22:54:23'),
(9, 'Nikola', 'Nikolic', '23424', 'Beograd', 'Aleksandra Belica', 23, '2018-11-04 21:37:39', '2018-11-04 21:37:39'),
(10, 'Milan', 'Manojlovic', '423423423', 'Aleksinac', 'Karadjordjeva', 32, '2018-11-04 22:55:10', '2018-11-04 22:55:10'),
(11, 'Milica', 'Milosevic', '432432', 'Uzice', '7. jula', 2, '2018-11-04 22:57:13', '2018-11-04 22:57:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_11_02_220114_create_informations_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zorica', 'zorica.manojlovic@gmail.com', '$2y$10$Hrk6hZIAsqb3/Bq8nJoSnuBBdsNnIoQsbiC.sf.rhYbCfPIkRi4zC', 'XzKmJtWhXiq3wtvozND2IyARnUkmochlQhXH6ZWtPNaZajImlsVimoXxoOrA', '2018-11-02 13:04:21', '2018-11-02 13:04:21'),
(2, 'Nikola', 'nikola@gmail.com', '$2y$10$d7tu4sSvqXQTaFr4tvFdMOPvzuYgwdw9wJ2SyNrdDwXGYkROCRnKS', 'yqIrglvzZ9Asby2F1fKuZwltQgWKEeiWItpTWy70sOI5p7meGIfLrYI5U5dI', '2018-11-05 16:59:36', '2018-11-05 16:59:36'),
(4, 'korisnik', 'korisnik@gmail.com', '$2y$10$w8oi8r3r2hXvuxnyi05wKu4ecuPhfh78SAvbz9HInxZYawbSn9NxK', 'VXNr30b7ffUIoteALTr1DKfLg0lEB2vXScrH21oylyxnilbNYrZW2xJkHWMD', '2018-11-05 22:17:40', '2018-11-05 22:17:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `informations`
--
ALTER TABLE `informations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `informations`
--
ALTER TABLE `informations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
