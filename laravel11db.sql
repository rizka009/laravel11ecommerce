-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 05:31 AM
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
-- Database: `laravel11db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `isdefault` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `phone`, `locality`, `address`, `city`, `state`, `country`, `landmark`, `zip`, `type`, `isdefault`, `created_at`, `updated_at`) VALUES
(9, 1, 'admin', '083185279521', 'jl.221', '12345s', 'padang', 'sumbar', 'indonesia', 'kos-kosan', '123456', 'home', 1, '2024-12-30 03:34:48', '2024-12-30 03:34:48'),
(10, 13, 'karina', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 1, '2024-12-30 05:10:54', '2025-01-02 19:33:52'),
(11, 11, 'rara', '083185279521', 'jl.221', 'blok E No.3', 'padang', 'sumbar', 'indonesia', 'rumah', '123456', 'home', 1, '2025-01-01 23:23:10', '2025-01-01 23:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(8, 'Napoleon', 'napoleon', '1733366158.png', '2024-12-04 19:35:58', '2024-12-04 19:35:58'),
(9, 'Napoleon X Bombo Doughnut', 'napoleon-x-bombo-doughnut', '1735361909.jpg', '2024-12-16 18:16:55', '2024-12-27 21:58:29');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('karin|127.0.0.1', 'i:1;', 1735476403),
('karin|127.0.0.1:timer', 'i:1735476403;', 1735476403),
('rizka@gmail.com|127.0.0.1', 'i:1;', 1735798920),
('rizka@gmail.com|127.0.0.1:timer', 'i:1735798920;', 1735798920);

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(4, 'Bolu Gulung Mini', 'bolu-gulung-mini', '1733365791.jpg', NULL, '2024-12-04 19:29:54', '2024-12-04 19:29:54'),
(5, 'Brownies Napoleon', 'brownies-napoleon', '1733365894.jpg', NULL, '2024-12-04 19:31:34', '2024-12-04 19:31:34'),
(6, 'Lapis Napoleon', 'lapis-napoleon', '1733365924.jpg', NULL, '2024-12-04 19:32:04', '2024-12-04 19:32:04'),
(7, 'Napoleon Cake', 'napoleon-cake', '1733365959.jpg', NULL, '2024-12-04 19:32:39', '2024-12-04 19:32:39'),
(8, 'Roll Cake', 'roll-cake', '1733365992.jpg', NULL, '2024-12-04 19:33:12', '2024-12-04 19:33:12'),
(10, 'Bombo Doughnut', 'bombo-doughnut', '1735361637.jpg', NULL, '2024-12-16 18:22:56', '2024-12-27 21:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@gmail.com', '08123456789', 'Project Ini Sangat Bagus', '2024-12-28 03:05:09', '2024-12-28 03:05:09'),
(3, 'user', 'user@gmail.com', '083185279526', 'saya sangat puas belanja di sini', '2024-12-29 08:00:13', '2024-12-29 08:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(15,2) NOT NULL,
  `cart_value` decimal(15,2) NOT NULL,
  `expiry_date` date NOT NULL DEFAULT cast(current_timestamp() as date),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `expiry_date`, `created_at`, `updated_at`) VALUES
(2, 'OFF30', 'percent', 30.00, 150.00, '2025-01-06', '2024-11-21 05:01:40', '2024-11-21 05:01:40'),
(4, 'OFF20', 'fixed', 15000.00, 400.00, '2025-01-06', '2024-11-24 03:48:50', '2025-01-02 10:54:42'),
(5, 'SALEJUMAT', 'percent', 10.00, 75000.00, '2025-01-03', '2024-12-29 08:05:14', '2024-12-29 08:05:14'),
(6, '2025sale', 'percent', 10.00, 50000.00, '2025-01-05', '2025-01-02 00:01:38', '2025-01-02 00:01:38');

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
(10, '0001_01_01_000000_create_users_table', 1),
(11, '0001_01_01_000001_create_cache_table', 1),
(12, '0001_01_01_000002_create_jobs_table', 1),
(13, '2024_10_17_161346_create_brands_table', 2),
(16, '2024_10_30_072321_create_categories_table', 3),
(17, '2024_10_30_090856_create_products_table', 3),
(18, '2024_11_21_102943_create_coupons_table', 4),
(19, '2024_11_24_115954_create_orders_table', 5),
(20, '2024_11_24_120021_create_order_items_table', 5),
(21, '2024_11_24_120049_create_addresses_table', 5),
(22, '2024_11_24_120127_create_transactions_table', 5),
(23, '2024_12_06_071246_create_slides_table', 6),
(24, '2024_12_11_093918_create_month_names_table', 7),
(26, '2024_12_16_080817_create_contacts_table', 8),
(27, '2024_12_21_163351_add_production_and_expiry_date_to_products_table', 9),
(28, '2024_12_30_105405_add_transfer_proof_to_transactions_table', 10),
(29, '2024_12_30_122153_update_mode_enum_in_transactions_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `month_names`
--

CREATE TABLE `month_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `month_names`
--

INSERT INTO `month_names` (`id`, `name`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'Juni'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'Oktober'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `zip` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'home',
  `status` enum('ordered','delivered','canceled') NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `delivered_date` date DEFAULT NULL,
  `canceled_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `name`, `phone`, `locality`, `address`, `city`, `state`, `country`, `landmark`, `zip`, `type`, `status`, `is_shipping_different`, `delivered_date`, `canceled_date`, `created_at`, `updated_at`) VALUES
(39, 13, 70000.00, 0.00, 7000.00, 77000.00, 'karin', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'ordered', 0, NULL, NULL, '2025-01-02 10:48:32', '2025-01-02 10:48:32'),
(41, 13, 90000.00, 0.00, 9000.00, 99000.00, 'karin', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'ordered', 0, NULL, NULL, '2025-01-02 10:50:52', '2025-01-02 10:50:52'),
(42, 13, 90000.00, 0.00, 9000.00, 99000.00, 'karin', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'ordered', 0, NULL, NULL, '2025-01-02 10:51:38', '2025-01-02 10:51:38'),
(43, 13, 90000.00, 15000.00, 9000.00, 99000.00, 'karin', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'ordered', 0, NULL, NULL, '2025-01-02 11:23:00', '2025-01-02 11:23:00'),
(44, 13, 75000.00, 15000.00, 7500.00, 82500.00, 'karin', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'ordered', 0, NULL, NULL, '2025-01-02 11:38:38', '2025-01-02 11:38:38'),
(45, 13, 63000.00, 27000.00, 6300.00, 69300.00, 'karin', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'delivered', 0, '2025-01-02', NULL, '2025-01-02 12:03:17', '2025-01-02 12:12:27'),
(46, 11, 108000.00, 12000.00, 10800.00, 118800.00, 'rara', '083185279521', 'jl.221', 'blok E No.3', 'padang', 'sumbar', 'indonesia', 'rumah', '123456', 'home', 'ordered', 0, NULL, NULL, '2025-01-02 19:00:18', '2025-01-02 19:00:18'),
(47, 13, 91000.00, 39000.00, 9100.00, 100100.00, 'karina', '08123456789', 'jl.hatta', 'No.74', 'Padang', 'Sumatera Barat', 'indonesia', 'kos pak muh', '123456', 'home', 'delivered', 0, '2025-01-03', NULL, '2025-01-02 19:34:02', '2025-01-02 19:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `options` longtext DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `price`, `quantity`, `options`, `rstatus`, `created_at`, `updated_at`) VALUES
(49, 53, 39, 70000.00, 1, NULL, 0, '2025-01-02 10:48:32', '2025-01-02 10:48:32'),
(51, 52, 41, 90000.00, 1, NULL, 0, '2025-01-02 10:50:52', '2025-01-02 10:50:52'),
(52, 52, 42, 90000.00, 1, NULL, 0, '2025-01-02 10:51:38', '2025-01-02 10:51:38'),
(53, 52, 43, 90000.00, 1, NULL, 0, '2025-01-02 11:23:00', '2025-01-02 11:23:00'),
(54, 52, 44, 90000.00, 1, NULL, 0, '2025-01-02 11:38:38', '2025-01-02 11:38:38'),
(55, 52, 45, 90000.00, 1, NULL, 0, '2025-01-02 12:03:17', '2025-01-02 12:03:17'),
(56, 51, 46, 60000.00, 2, NULL, 0, '2025-01-02 19:00:18', '2025-01-02 19:00:18'),
(57, 53, 47, 70000.00, 1, NULL, 0, '2025-01-02 19:34:02', '2025-01-02 19:34:02'),
(58, 51, 47, 60000.00, 1, NULL, 0, '2025-01-02 19:34:02', '2025-01-02 19:34:02');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(15,2) NOT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `brand_id`, `production_date`, `expiry_date`, `created_at`, `updated_at`) VALUES
(12, 'Bolu Gulung Mini Black Florest', 'bolu-gulung-mini-black-florest', 'Ini adalah Bolu Gulung Mini Black Florest', 'Ini adalah Bolu Gulung Mini Black Florest', 100000.00, 90000.00, 'BGM-BF', 'instock', 1, 10, '1733366317.jpg', '', 4, 8, NULL, NULL, '2024-12-04 19:38:38', '2024-12-04 19:38:38'),
(13, 'Bolu Gulung Mini Keju', 'bolu-gulung-mini-keju', 'Ini adalah Bolu Gulung Mini Keju', 'Ini adalah Bolu Gulung Mini Keju', 100000.00, 90000.00, 'BGM-Keju', 'instock', 1, 10, '1733366418.jpg', '', 4, 8, NULL, NULL, '2024-12-04 19:40:18', '2024-12-04 19:40:18'),
(14, 'Bolu Gulung Mini Pandan Srikaya', 'bolu-gulung-mini-pandan-srikaya', 'Ini adalah Bolu Gulung Mini Pandan Srikaya', 'Ini adalah Bolu Gulung Mini Pandan Srikaya', 100000.00, 90000.00, 'BGM-PS', 'instock', 1, 10, '1733366478.jpg', '', 4, 8, NULL, NULL, '2024-12-04 19:41:18', '2024-12-04 19:41:18'),
(15, 'Brownies Besekat Napoleon', 'brownies-besekat-napoleon', 'Ini adalah Brownies Besekat Napoleon', 'Ini adalah Brownies Besekat Napoleon', 100000.00, 90000.00, 'BN-Besekat', 'instock', 1, 10, '1733366952.jpg', '', 5, 8, NULL, NULL, '2024-12-04 19:49:13', '2024-12-04 19:49:13'),
(16, 'Lapis Cokelat', 'lapis-cokelat', 'Ini adalah Lapis Cokelat', 'Ini adalah Lapis Cokelat', 100000.00, 90000.00, 'LN-Cokelat', 'instock', 1, 10, '1733367042.jpg', '', 6, 8, NULL, NULL, '2024-12-04 19:50:42', '2024-12-04 19:50:42'),
(17, 'Lapis Durian', 'lapis-durian', 'Ini adalah Lapis Durian', 'Ini adalah Lapis Durian', 100000.00, 90000.00, 'LN-Durian', 'instock', 1, 10, '1733367120.jpg', '', 6, 8, NULL, NULL, '2024-12-04 19:52:00', '2024-12-04 19:52:00'),
(18, 'Lapis Original', 'lapis-original', 'Ini adalah Lapis Original', 'Ini adalah Lapis Original', 100000.00, 90000.00, 'LN-Original', 'instock', 1, 10, '1733367202.jpg', '', 6, 8, NULL, NULL, '2024-12-04 19:53:22', '2024-12-04 19:53:22'),
(19, 'Lapis Pandan', 'lapis-pandan', 'Ini adalah Lapis Pandan', 'Ini adalah Lapis Pandan', 100000.00, 90000.00, 'LN-Pandan', 'instock', 1, 10, '1733367405.jpg', '', 6, 8, NULL, NULL, '2024-12-04 19:56:45', '2024-12-04 19:56:45'),
(20, 'Lapis Ubi Ungu', 'lapis-ubi-ungu', 'Ini adalah Lapis Ubi Ungu', 'Ini adalah Lapis Ubi Ungu', 100000.00, 90000.00, 'LN-UbiU', 'instock', 1, 10, '1733367480.jpg', '', 6, 8, NULL, NULL, '2024-12-04 19:58:00', '2024-12-04 19:58:00'),
(21, 'Napoleon Caramel', 'napoleon-caramel', 'ini adalah Napoleon Caramel', 'ini adalah Napoleon Caramel', 100000.00, 90000.00, 'NC-Caramel', 'instock', 1, 10, '1733367920.jpg', '', 7, 8, NULL, NULL, '2024-12-04 20:05:20', '2024-12-04 20:05:20'),
(22, 'Napoleon Durian', 'napoleon-durian', 'ini adalah Napoleon Durian', 'ini adalah Napoleon Durian', 100000.00, 90000.00, 'NC-Durian', 'instock', 1, 10, '1733367997.jpg', '', 7, 8, NULL, NULL, '2024-12-04 20:06:37', '2024-12-04 20:06:37'),
(23, 'Napoleon Extra Cheese', 'napoleon-extra-cheese', 'ini adalah Napoleon Extra Cheese\"', 'ini adalah Napoleon Extra Cheese', 100000.00, 90000.00, 'NC-EC', 'instock', 1, 10, '1733368105.jpg', '', 7, 8, '2024-12-29', '2024-12-31', '2024-12-04 20:08:25', '2024-12-29 04:16:50'),
(24, 'Napoleon Great Chocolate', 'napoleon-great-chocolate', 'ini adalah Napoleon Great Chocolate\"', 'ini adalah Napoleon Great Chocolate', 100000.00, 90000.00, 'NC-GreatC', 'instock', 1, 10, '1733368220.jpg', '', 7, 8, '2024-12-29', '2025-01-01', '2024-12-04 20:10:20', '2024-12-29 04:16:25'),
(25, 'Napoleon Green Tea', 'napoleon-green-tea', 'ini adalah Napoleon Green Tea\"\"', 'ini adalah Napoleon Green Tea', 100000.00, 90000.00, 'NC-GT', 'instock', 1, 10, '1733368315.jpg', '1734399076-1.jpg,1734399076-2.jpg,1734399076-3.jpg,1734399076-4.jpg', 7, 8, '2024-12-29', '2024-12-31', '2024-12-04 20:11:56', '2024-12-29 04:16:09'),
(26, 'Napoleon Kopi', 'napoleon-kopi', 'ini adalah Napoleon Kopi\"\"', 'ini adalah Napoleon Kopi', 100000.00, 90000.00, 'NC-Kopi', 'instock', 1, 10, '1733368367.jpg', '1734399020-1.jpg', 7, 8, '2024-12-29', '2024-12-31', '2024-12-04 20:12:47', '2024-12-29 04:15:27'),
(27, 'Napoleon Red Velvet', 'napoleon-red-velvet', 'ini adalah Napoleon Red Velvet\"\"', 'ini adalah Napoleon Red Velvet', 100000.00, 90000.00, 'NC-RV', 'instock', 1, 10, '1733368418.jpg', '1735361544-1.jpg,1735361544-2.jpg,1735361544-3.jpg,1735361544-4.jpg,1735361544-5.jpg', 7, 8, '2024-12-24', '2024-12-31', '2024-12-04 20:13:38', '2024-12-27 21:52:25'),
(28, 'Napoleon Tiramisu', 'napoleon-tiramisu', 'ini adalah Napoleon Tiramisu\"\"', 'ini adalah Napoleon Tiramisu', 100000.00, 90000.00, 'NC-Tiramisu', 'instock', 1, 8, '1733368487.jpg', '1735374816-1.jpg,1735374816-2.jpg,1735374816-3.jpg,1735374816-4.jpg', 7, 8, '2024-12-28', '2025-01-04', '2024-12-04 20:14:47', '2024-12-29 07:52:23'),
(29, 'Roll cake Cokelat', 'roll-cake-cokelat', 'ini adalah Roll cake Cokelat\"\"', 'ini adalah Roll cake Cokelat', 100000.00, 90000.00, 'RC-Cokelat', 'instock', 1, 8, '1733368553.jpg', '1735373679-1.jpg,1735373679-2.jpg', 8, 8, '2024-12-28', '2025-01-04', '2024-12-04 20:15:54', '2024-12-29 07:58:48'),
(30, 'Roll cake Keju', 'roll-cake-keju', 'ini adalah Roll cake Keju\"\"\"\"', 'ini adalah Roll cake Keju', 100000.00, 90000.00, 'RC-Keju', 'instock', 1, 7, '1733368602.jpg', '1735373613-1.jpg,1735373613-2.jpg,1735373613-3.jpg', 8, 8, '2024-12-28', '2025-01-04', '2024-12-04 20:16:42', '2024-12-30 05:10:54'),
(41, '4', '4', '\"fedrfe\"', 'rgtergref', 100000.00, 90000.00, '4', 'instock', 0, 3, '1735357333.jpg', '', 7, 9, '2024-12-27', '2024-12-28', '2024-12-27 20:42:14', '2024-12-27 20:45:52'),
(42, '5', '5', '\"dgidgdgd', 'gdgdgdr', 100000.00, 90000.00, '5', 'outofstock', 0, 0, '1735361989.jpg', '1735361989-1.jpg', 6, 8, '2024-12-28', '2024-12-31', '2024-12-27 21:59:50', '2024-12-27 22:18:04'),
(45, 'Bombo', 'bombo', 'Bom Boooo', 'cfghcdfbgcf', 75000.00, 70000.00, '8', 'instock', 0, 10, '1735369355.jpg', '1735369355-1.jpg', 4, 9, '2025-01-03', '2025-01-10', '2024-12-28 00:02:35', '2025-01-02 12:16:11'),
(51, 'Bomboloni', 'bomboloni', 'Bomboloni Dua Rasa\"', 'Bomboloni yang enak dengan kualitas terbaik', 75000.00, 60000.00, 'BBL', 'instock', 1, 1, '1735484591.jpg', '1735484591-1.jpg', 4, 9, '2024-12-29', '2025-01-08', '2024-12-29 08:03:14', '2025-01-02 19:34:02'),
(52, 'bolu gulung', 'bolu-gulung', '\"sdnasldas\"', 'sndaksdajsd', 100000.00, 90000.00, 'gl', 'instock', 1, 2, '1735562555.jpg', '1735562555-1.jpg', 4, 8, '2024-12-30', '2025-01-03', '2024-12-30 05:42:37', '2025-01-02 12:03:17'),
(53, 'Chiffon Lumer', 'chiffon-lumer', '\"ini chiffon lumer yang enak\"', '\"ini chiffon lumer yang enak', 75000.00, 70000.00, 'chiffon', 'instock', 1, 5, '1735798808.jpg', '1735798808-1.jpg,1735798808-2.jpg', 7, 8, '2025-01-02', '2025-01-09', '2025-01-01 23:20:11', '2025-01-02 19:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HXLEV9itezuhRlpc4bQB0wmSan8enn8GtHrdMnoz', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiU0lTbGdINW94RkVmek1ZSVE4d203Z2VaWnZsbHNhQnE3OEdGUkQ1USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50LW9yZGVycy80Ny9kZXRhaWxzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTM7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzM2OTE1Mzg3O319', 1736915468),
('WGBBKfT8McWgBPXbm6nl36FxF8xmEeZYcJ0Hfmsd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkdhU0M0dHBEWnU1MHFSVjV3a2g3TDFjS3FVMElkaGhtTkhkcWY1TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1735872465);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `tagline`, `title`, `subtitle`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(4, 'New Product', 'Bolu Gulung Mini', 'Black Forest', 'http://127.0.0.1:8000/shop', '1733842830.jpg', 1, '2024-12-10 06:10:07', '2024-12-10 08:00:30'),
(5, 'Best Product', 'Brownies Napoleon', 'Besekat Napoleon', 'http://127.0.0.1:8000/shop', '1733842529.jpg', 1, '2024-12-10 07:55:29', '2024-12-10 07:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('transfer','card','paypal') NOT NULL DEFAULT 'transfer',
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `transfer_proof` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `transfer_proof`, `created_at`, `updated_at`) VALUES
(31, 13, 39, 'transfer', 'pending', NULL, '2025-01-02 10:48:32', '2025-01-02 10:48:32'),
(33, 13, 41, 'transfer', 'pending', NULL, '2025-01-02 10:50:52', '2025-01-02 10:50:52'),
(34, 13, 42, 'transfer', 'pending', NULL, '2025-01-02 10:51:38', '2025-01-02 10:51:38'),
(35, 13, 43, 'transfer', 'pending', NULL, '2025-01-02 11:23:00', '2025-01-02 11:23:00'),
(36, 13, 44, 'transfer', 'pending', NULL, '2025-01-02 11:38:38', '2025-01-02 11:38:38'),
(37, 13, 45, 'transfer', 'approved', 'uploads/transaksi/1735845222_transfer.jpg', '2025-01-02 12:03:17', '2025-01-02 12:13:42'),
(38, 11, 46, 'transfer', 'pending', 'uploads/transaksi/1735869649_transfer.jpg', '2025-01-02 19:00:18', '2025-01-02 19:00:49'),
(39, 13, 47, 'transfer', 'approved', 'uploads/transaksi/1735871665_transfer.jpg', '2025-01-02 19:34:02', '2025-01-02 19:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `utype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'ADM for Admin and USR for User or Customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `utype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '083185279521', NULL, '$2y$12$ZnR/A4G0uxhDJ/Euu6QRbeKOoAqBnximyHzgivIEcx6kxWiCuzssu', 'ADM', NULL, '2024-10-17 09:08:47', '2024-12-30 04:56:10'),
(11, 'raraa', 'rara@gmail.com', '087773636169', NULL, '$2y$12$qskhdDM4fL2nZrPUfHZUi.HHd9GBwnhVBZm0WPITU/kL53goqTOma', 'USR', NULL, '2024-12-30 04:57:42', '2025-01-01 23:44:46'),
(12, 'ika', 'ika@gmail.com', '083185279522', NULL, '$2y$12$OZnd1ZzPVHvtYUbG.fN5Gu0UNZbvgG9cFpTIbLEep89XFvjQoLZpK', 'USR', NULL, '2024-12-30 04:58:54', '2024-12-30 04:58:54'),
(13, 'karin', 'karin@gmail.com', '081234567895', NULL, '$2y$12$dMmwjGHlabXK2F720KYNwe3RS3IprLR/KinD4wuZCbgOF0qXwsiYK', 'USR', NULL, '2024-12-30 05:00:03', '2024-12-30 05:00:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

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
-- Indexes for table `month_names`
--
ALTER TABLE `month_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `month_names`
--
ALTER TABLE `month_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
