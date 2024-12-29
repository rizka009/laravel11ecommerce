-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 04:32 AM
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
(1, 2, 'rizka', '1234567890', 'Pauh', '123', 'padang', 'indonesia', 'indonesia', 'kos', '123456', 'home', 1, '2024-11-25 01:54:11', '2024-11-25 01:54:11'),
(3, 4, 'ojakk', '1234567891', 'jl.2215', '1234', 'padangg', 'sumbarr', 'indonesia', 'kos-kos', '123457', 'home', 1, '2024-12-04 21:22:23', '2024-12-21 06:31:45');

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
(2, 'admin', 'admin@gmail.com', '08123456789', 'Project Ini Sangat Bagus', '2024-12-28 03:05:09', '2024-12-28 03:05:09');

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
(2, 'OFF30', 'percent', 30.00, 150.00, '2024-11-28', '2024-11-21 05:01:40', '2024-11-21 05:01:40'),
(4, 'OFF20', 'fixed', 10.00, 400.00, '2024-11-30', '2024-11-24 03:48:50', '2024-11-24 03:48:50');

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
(27, '2024_12_21_163351_add_production_and_expiry_date_to_products_table', 9);

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
(7, 4, 180000.00, 0.00, 37800.00, 217800.00, 'ojak', '1234567890', 'jl.221', '123', 'padang', 'sumbar', 'indonesia', 'kos', '123456', 'home', 'delivered', 0, '2024-12-05', NULL, '2024-12-04 21:42:57', '2024-12-05 06:32:36'),
(8, 4, 90000.00, 0.00, 18900.00, 108900.00, 'ojak', '1234567890', 'jl.221', '123', 'padang', 'sumbar', 'indonesia', 'kos', '123456', 'home', 'canceled', 0, NULL, '2024-12-05', '2024-12-04 22:36:39', '2024-12-05 07:32:21'),
(9, 4, 90000.00, 0.00, 18900.00, 108900.00, 'ojak', '1234567890', 'jl.221', '123', 'padang', 'sumbar', 'indonesia', 'kos', '123456', 'home', 'canceled', 0, NULL, '2024-12-05', '2024-12-05 07:37:40', '2024-12-05 07:37:52'),
(15, 4, 270000.00, 0.00, 56700.00, 326700.00, 'ojakk', '1234567891', 'jl.2215', '1234', 'padangg', 'sumbarr', 'indonesia', 'kos-kos', '123457', 'home', 'ordered', 0, NULL, NULL, '2024-12-27 09:46:09', '2024-12-27 09:46:09'),
(16, 4, 90000.00, 0.00, 18900.00, 108900.00, 'ojakk', '1234567891', 'jl.2215', '1234', 'padangg', 'sumbarr', 'indonesia', 'kos-kos', '123457', 'home', 'ordered', 0, NULL, NULL, '2024-12-27 21:54:55', '2024-12-27 21:54:55'),
(17, 4, 90000.00, 0.00, 18900.00, 108900.00, 'ojakk', '1234567891', 'jl.2215', '1234', 'padangg', 'sumbarr', 'indonesia', 'kos-kos', '123457', 'home', 'ordered', 0, NULL, NULL, '2024-12-27 21:55:42', '2024-12-27 21:55:42'),
(20, 4, 450000.00, 0.00, 94500.00, 544500.00, 'ojakk', '1234567891', 'jl.2215', '1234', 'padangg', 'sumbarr', 'indonesia', 'kos-kos', '123457', 'home', 'ordered', 0, NULL, NULL, '2024-12-27 22:18:04', '2024-12-27 22:18:04'),
(23, 4, 180000.00, 0.00, 37800.00, 217800.00, 'ojakk', '1234567891', 'jl.2215', '1234', 'padangg', 'sumbarr', 'indonesia', 'kos-kos', '123457', 'home', 'delivered', 0, '2024-12-28', NULL, '2024-12-27 22:43:26', '2024-12-28 01:34:14');

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
(14, 30, 7, 90000.00, 1, NULL, 0, '2024-12-04 21:42:57', '2024-12-04 21:42:57'),
(15, 29, 7, 90000.00, 1, NULL, 0, '2024-12-04 21:42:57', '2024-12-04 21:42:57'),
(16, 28, 8, 90000.00, 1, NULL, 0, '2024-12-04 22:36:39', '2024-12-04 22:36:39'),
(17, 30, 9, 90000.00, 1, NULL, 0, '2024-12-05 07:37:40', '2024-12-05 07:37:40'),
(23, 39, 15, 90000.00, 1, NULL, 0, '2024-12-27 09:46:09', '2024-12-27 09:46:09'),
(24, 21, 15, 90000.00, 1, NULL, 0, '2024-12-27 09:46:09', '2024-12-27 09:46:09'),
(25, 27, 15, 90000.00, 1, NULL, 0, '2024-12-27 09:46:09', '2024-12-27 09:46:09'),
(26, 39, 16, 90000.00, 1, NULL, 0, '2024-12-27 21:54:55', '2024-12-27 21:54:55'),
(27, 39, 17, 90000.00, 1, NULL, 0, '2024-12-27 21:55:42', '2024-12-27 21:55:42'),
(28, 42, 20, 90000.00, 5, NULL, 0, '2024-12-27 22:18:04', '2024-12-27 22:18:04'),
(29, 40, 23, 90000.00, 2, NULL, 0, '2024-12-27 22:43:26', '2024-12-27 22:43:26');

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
(23, 'Napoleon Extra Cheese', 'napoleon-extra-cheese', 'ini adalah Napoleon Extra Cheese', 'ini adalah Napoleon Extra Cheese', 100000.00, 90000.00, 'NC-EC', 'instock', 1, 10, '1733368105.jpg', '', 7, 8, NULL, NULL, '2024-12-04 20:08:25', '2024-12-04 20:08:25'),
(24, 'Napoleon Great Chocolate', 'napoleon-great-chocolate', 'ini adalah Napoleon Great Chocolate', 'ini adalah Napoleon Great Chocolate', 100000.00, 90000.00, 'NC-GreatC', 'instock', 1, 10, '1733368220.jpg', '', 7, 8, NULL, NULL, '2024-12-04 20:10:20', '2024-12-04 20:10:20'),
(25, 'Napoleon Green Tea', 'napoleon-green-tea', 'ini adalah Napoleon Green Tea\"', 'ini adalah Napoleon Green Tea', 100000.00, 90000.00, 'NC-GT', 'instock', 1, 10, '1733368315.jpg', '1734399076-1.jpg,1734399076-2.jpg,1734399076-3.jpg,1734399076-4.jpg', 7, 8, NULL, NULL, '2024-12-04 20:11:56', '2024-12-16 18:31:17'),
(26, 'Napoleon Kopi', 'napoleon-kopi', 'ini adalah Napoleon Kopi\"', 'ini adalah Napoleon Kopi', 100000.00, 90000.00, 'NC-Kopi', 'instock', 1, 10, '1733368367.jpg', '1734399020-1.jpg', 7, 8, NULL, NULL, '2024-12-04 20:12:47', '2024-12-16 18:30:20'),
(27, 'Napoleon Red Velvet', 'napoleon-red-velvet', 'ini adalah Napoleon Red Velvet\"\"', 'ini adalah Napoleon Red Velvet', 100000.00, 90000.00, 'NC-RV', 'instock', 1, 10, '1733368418.jpg', '1735361544-1.jpg,1735361544-2.jpg,1735361544-3.jpg,1735361544-4.jpg,1735361544-5.jpg', 7, 8, '2024-12-24', '2024-12-31', '2024-12-04 20:13:38', '2024-12-27 21:52:25'),
(28, 'Napoleon Tiramisu', 'napoleon-tiramisu', 'ini adalah Napoleon Tiramisu\"\"', 'ini adalah Napoleon Tiramisu', 100000.00, 90000.00, 'NC-Tiramisu', 'instock', 1, 10, '1733368487.jpg', '1735374816-1.jpg,1735374816-2.jpg,1735374816-3.jpg,1735374816-4.jpg', 7, 8, '2024-12-28', '2025-01-04', '2024-12-04 20:14:47', '2024-12-28 01:33:39'),
(29, 'Roll cake Cokelat', 'roll-cake-cokelat', 'ini adalah Roll cake Cokelat\"\"', 'ini adalah Roll cake Cokelat', 100000.00, 90000.00, 'RC-Cokelat', 'instock', 1, 10, '1733368553.jpg', '1735373679-1.jpg,1735373679-2.jpg', 8, 8, '2024-12-28', '2025-01-04', '2024-12-04 20:15:54', '2024-12-28 01:14:40'),
(30, 'Roll cake Keju', 'roll-cake-keju', 'ini adalah Roll cake Keju\"\"\"', 'ini adalah Roll cake Keju', 100000.00, 90000.00, 'RC-Keju', 'instock', 1, 10, '1733368602.jpg', '1735373613-1.jpg,1735373613-2.jpg,1735373613-3.jpg', 8, 8, '2024-12-28', '2025-01-04', '2024-12-04 20:16:42', '2024-12-28 01:13:36'),
(39, '1', '1', '\"fedfssdfcs\"\"', 'sdfsdcf', 100000.00, 90000.00, '1', 'instock', 0, 2, '1735317512.jpg', '', 10, 9, '2024-12-28', '2025-01-11', '2024-12-27 09:38:33', '2024-12-27 21:59:02'),
(40, '3', '3', '\"sxgvfvgd\"', 'dggfgvfd', 100000.00, 90000.00, '3', 'instock', 0, 1, '1735356147.jpg', '1735356147-1.jpg', 7, 8, '2024-12-28', '2024-12-30', '2024-12-27 20:22:27', '2024-12-27 22:43:26'),
(41, '4', '4', '\"fedrfe\"', 'rgtergref', 100000.00, 90000.00, '4', 'instock', 0, 3, '1735357333.jpg', '', 7, 9, '2024-12-27', '2024-12-28', '2024-12-27 20:42:14', '2024-12-27 20:45:52'),
(42, '5', '5', '\"dgidgdgd', 'gdgdgdr', 100000.00, 90000.00, '5', 'outofstock', 0, 0, '1735361989.jpg', '1735361989-1.jpg', 6, 8, '2024-12-28', '2024-12-31', '2024-12-27 21:59:50', '2024-12-27 22:18:04'),
(43, '6', '6', '\"dgdg', 'dgdgd', 100000.00, 90000.00, '6', 'instock', 0, 4, '1735366004.jpg', '1735366004-1.jpg', 4, 8, '2024-12-28', '2024-12-30', '2024-12-27 23:06:44', '2024-12-27 23:06:44'),
(44, '7', '7', '\"gsgdg', 'dgdg', 100000.00, 90000.00, '7', 'instock', 0, 7, '1735366689.jpg', '', 10, 9, '2024-12-28', '2024-12-30', '2024-12-27 23:18:10', '2024-12-27 23:18:10'),
(45, '8', '8', '\"sdfsxdegx', 'cfghcdfbgcf', 100000.00, 90000.00, '8', 'instock', 0, 8, '1735369355.jpg', '1735369355-1.jpg', 4, 9, '2024-12-28', '2024-12-29', '2024-12-28 00:02:35', '2024-12-28 00:02:35'),
(46, '9', '9', '\"hffh', 'fj', 100000.00, 90000.00, '9', 'instock', 0, 3, '1735376238.jpg', '1735376238-1.jpg', 4, 9, '2024-12-28', '2025-01-04', '2024-12-28 01:57:18', '2024-12-28 01:57:18'),
(47, '10', '10', '\"dscffcers\"', 'fefecfr', 100000.00, 90000.00, '10', 'outofstock', 0, 5, '1735376396.jpg', '1735376396-1.jpg', 5, 8, '2024-12-28', '2025-01-04', '2024-12-28 01:59:57', '2024-12-28 02:00:08'),
(48, '11', '11', '\"xasikxcb', 'csdcsdac', 100000.00, 90000.00, '11', 'instock', 0, 5, '1735383902.jpg', '1735383902-1.jpg', 5, 8, '2024-12-28', '2025-01-04', '2024-12-28 04:05:02', '2024-12-28 04:05:02'),
(49, '12', '12', '\"dfsfsw', 'sdfsedfsw', 100000.00, 90000.00, '12', 'instock', 0, 6, '1735386907.jpg', '1735386907-1.jpg', 10, 8, '2024-12-28', '2025-01-04', '2024-12-28 04:55:07', '2024-12-28 04:55:07');

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
('oTzpsSx7Q30QxBuAtUvp0WXjkQzocwRNp7asSlPR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSU5rUW94WjBuS2pTV0FaWXAyNHZHOEx3aW1tYngxUTltTkRnb2NBbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1735387003);

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
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(7, 4, 7, 'cod', 'approved', '2024-12-04 21:42:57', '2024-12-05 06:30:35'),
(8, 4, 8, 'cod', 'pending', '2024-12-04 22:36:39', '2024-12-04 22:36:39'),
(9, 4, 9, 'cod', 'pending', '2024-12-05 07:37:40', '2024-12-05 07:37:40'),
(15, 4, 15, 'cod', 'pending', '2024-12-27 09:46:09', '2024-12-27 09:46:09'),
(16, 4, 17, 'cod', 'pending', '2024-12-27 21:55:42', '2024-12-27 21:55:42'),
(17, 4, 20, 'cod', 'pending', '2024-12-27 22:18:04', '2024-12-27 22:18:04'),
(18, 4, 23, 'cod', 'approved', '2024-12-27 22:43:26', '2024-12-28 01:34:13');

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
(1, 'admin', 'admin@gmail.com', '083185279521', NULL, '$2y$12$ZnR/A4G0uxhDJ/Euu6QRbeKOoAqBnximyHzgivIEcx6kxWiCuzssu', 'ADM', NULL, '2024-10-17 09:08:47', '2024-12-27 09:37:48'),
(2, 'user', 'user@gmail.com', '081234567890', NULL, '$2y$12$A4g.6qhgPw4q2G8m78217O9ks5KNkpd0/nXzWx6i9zIArTbJbsroG', 'USR', NULL, '2024-10-17 09:11:10', '2024-10-17 09:11:10'),
(4, 'ojakkk', 'ojak@gmail.com', '098765432190', NULL, '$2y$12$TIojrgQTIMZNhtnjikWbSepo1Dd6zFY4KpPrWFYwloDtQOsJxBX3S', 'USR', NULL, '2024-12-04 21:17:46', '2024-12-28 00:01:20'),
(6, 'nelhayatii', 'nel@gmail.com', '098765432112', NULL, '$2y$12$teDNxgSQ3Aewzvjzr4JwpeeC38vayJQeUkhBYDmFGdlP0zyNS.NXy', 'USR', NULL, '2024-12-21 12:19:45', '2024-12-28 00:06:45');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `month_names`
--
ALTER TABLE `month_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
