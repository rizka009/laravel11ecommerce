-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2024 at 04:48 AM
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
(2, 3, 'rizka', '1234567890', 'jl.221', '123', 'padang', 'sumbar', 'indonesia', 'kos', '123456', 'home', 1, '2024-11-25 19:34:45', '2024-11-25 19:34:45');

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
(2, 'brand 1', 'brand-1', '1729768834.jpg', '2024-10-24 04:20:34', '2024-10-24 04:20:34'),
(3, 'brand 2', 'brand-2', '1729768879.jpg', '2024-10-24 04:21:19', '2024-10-24 04:21:19'),
(4, 'brand 3', 'brand-3', '1729769241.jpg', '2024-10-24 04:27:21', '2024-10-24 04:27:21'),
(8, 'Napoleon', 'napoleon', '1733366158.png', '2024-12-04 19:35:58', '2024-12-04 19:35:58');

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
(1, 'category 1', 'category-1', '1730283479.jpg', NULL, '2024-10-30 03:17:59', '2024-10-30 03:17:59'),
(2, 'category 2', 'category-2', '1730285898.jpg', NULL, '2024-10-30 03:58:18', '2024-10-30 03:58:18'),
(4, 'Bolu Gulung Mini', 'bolu-gulung-mini', '1733365791.jpg', NULL, '2024-12-04 19:29:54', '2024-12-04 19:29:54'),
(5, 'Brownies Napoleon', 'brownies-napoleon', '1733365894.jpg', NULL, '2024-12-04 19:31:34', '2024-12-04 19:31:34'),
(6, 'Lapis Napoleon', 'lapis-napoleon', '1733365924.jpg', NULL, '2024-12-04 19:32:04', '2024-12-04 19:32:04'),
(7, 'Napoleon Cake', 'napoleon-cake', '1733365959.jpg', NULL, '2024-12-04 19:32:39', '2024-12-04 19:32:39'),
(8, 'Roll Cake', 'roll-cake', '1733365992.jpg', NULL, '2024-12-04 19:33:12', '2024-12-04 19:33:12');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
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
(22, '2024_11_24_120127_create_transactions_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
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
(1, 2, 350.00, 150.00, 73.50, 423.50, 'rizka', '1234567890', 'Pauh', '123', 'padang', 'indonesia', 'indonesia', 'kos', '123456', 'home', 'ordered', 0, NULL, NULL, '2024-11-25 01:54:11', '2024-11-25 01:54:11'),
(2, 2, 470.00, 0.00, 98.70, 568.70, 'rizka', '1234567890', 'Pauh', '123', 'padang', 'indonesia', 'indonesia', 'kos', '123456', 'home', 'ordered', 0, NULL, NULL, '2024-11-25 02:05:43', '2024-11-25 02:05:43'),
(3, 2, 540.00, 10.00, 113.40, 653.40, 'rizka', '1234567890', 'Pauh', '123', 'padang', 'indonesia', 'indonesia', 'kos', '123456', 'home', 'ordered', 0, NULL, NULL, '2024-11-25 02:10:43', '2024-11-25 02:10:43'),
(4, 2, 165.00, 0.00, 34.65, 199.65, 'rizka', '1234567890', 'Pauh', '123', 'padang', 'indonesia', 'indonesia', 'kos', '123456', 'home', 'ordered', 0, NULL, NULL, '2024-11-25 18:13:48', '2024-11-25 18:13:48'),
(5, 3, 255.00, 0.00, 53.55, 308.55, 'rizka', '1234567890', 'jl.221', '123', 'padang', 'sumbar', 'indonesia', 'kos', '123456', 'home', 'ordered', 0, NULL, NULL, '2024-11-25 19:34:45', '2024-11-25 19:34:45'),
(6, 2, 90.00, 0.00, 18.90, 108.90, 'rizka', '1234567890', 'Pauh', '123', 'padang', 'indonesia', 'indonesia', 'kos', '123456', 'home', 'ordered', 0, NULL, NULL, '2024-12-02 06:15:21', '2024-12-02 06:15:21');

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
(1, 6, 1, 100.00, 5, NULL, 0, '2024-11-25 01:54:11', '2024-11-25 01:54:11'),
(2, 7, 2, 180.00, 1, NULL, 0, '2024-11-25 02:05:43', '2024-11-25 02:05:43'),
(3, 6, 2, 100.00, 2, NULL, 0, '2024-11-25 02:05:43', '2024-11-25 02:05:43'),
(4, 5, 2, 90.00, 1, NULL, 0, '2024-11-25 02:05:43', '2024-11-25 02:05:43'),
(5, 3, 3, 90.00, 1, NULL, 0, '2024-11-25 02:10:43', '2024-11-25 02:10:43'),
(6, 7, 3, 180.00, 1, NULL, 0, '2024-11-25 02:10:43', '2024-11-25 02:10:43'),
(7, 5, 3, 90.00, 2, NULL, 0, '2024-11-25 02:10:43', '2024-11-25 02:10:43'),
(8, 6, 3, 100.00, 1, NULL, 0, '2024-11-25 02:10:43', '2024-11-25 02:10:43'),
(9, 10, 4, 75.00, 1, NULL, 0, '2024-11-25 18:13:48', '2024-11-25 18:13:48'),
(10, 8, 4, 90.00, 1, NULL, 0, '2024-11-25 18:13:48', '2024-11-25 18:13:48'),
(11, 11, 5, 90.00, 2, NULL, 0, '2024-11-25 19:34:45', '2024-11-25 19:34:45'),
(12, 10, 5, 75.00, 1, NULL, 0, '2024-11-25 19:34:45', '2024-11-25 19:34:45'),
(13, 11, 6, 90.00, 1, NULL, 0, '2024-12-02 06:15:21', '2024-12-02 06:15:21');

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
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(3, 'product three', 'product-three', '\"Short Description *\"\"\"', 'Description *', 100.00, 90.00, 'N001', 'instock', 1, 10, '1730390884.jpg', '1730676697-1.jpg,1730676697-2.jpg,1730676697-3.jpg,1730676697-4.jpg,1730676697-5.jpg,1730676697-6.jpg,1730676697-7.jpg,1730676697-8.jpg', 2, 4, '2024-10-31 09:08:05', '2024-11-19 03:00:21'),
(4, 'product four', 'product-four', 'Short Description *\"\"', 'Description *', 100.00, 90.00, 'LC001', 'instock', 1, 10, '1730676746.jpg', '1730676746-1.jpg,1730676746-2.jpg,1730676746-3.jpg,1730676746-4.jpg,1730676746-5.jpg', 1, 3, '2024-11-03 14:40:44', '2024-11-19 03:00:09'),
(5, 'product five', 'product-five', 's des\"\"', 'des', 100.00, 90.00, 'LC001', 'instock', 1, 10, '1730671772.jpg', '1730671772-1.jpg', 2, 2, '2024-11-03 15:09:33', '2024-11-19 02:59:22'),
(6, 'product six', 'product-six', 's des\" update\"\"', 'des update', 200.00, 100.00, 'LC005', 'instock', 1, 10, '1730675560.jpg', '1730675560-1.jpg,1730675560-2.jpg,1730675560-3.jpg', 2, 3, '2024-11-03 15:35:16', '2024-11-19 02:58:45'),
(7, 'product seven', 'product-seven', 's des\" update\"', 'des update', 200.00, 180.00, 'BGL002', 'instock', 1, 11, '1730675673.jpg', '1730675673-1.jpg,1730675673-2.jpg,1730675673-3.jpg', 1, 2, '2024-11-03 16:14:34', '2024-11-19 02:58:33'),
(8, 'product  eight', 'product-eight', 's product  eight\"\"\"', 'product  eight', 100.00, 90.00, 'N002', 'instock', 1, 11, '1730715389.jpg', '1730715389-1.jpg,1730715389-2.jpg,1730715389-3.jpg,1730715389-4.jpg', 1, 2, '2024-11-04 03:16:33', '2024-11-19 02:58:19'),
(10, 'product 10', 'product-10', '\"sdfhghbdg', 'zsdgzdhfghdxhbxfghx', 80.00, 75.00, 'BGL003', 'instock', 1, 10, '1732010640.jpg', '1732010640-1.jpg,1732010640-2.jpg', 2, 3, '2024-11-19 03:04:02', '2024-11-19 03:04:02'),
(11, 'Bolu Mini', 'bolu-mini', 'Ini Bolu Mini', 'Bolu Mini', 100.00, 90.00, 'BM-01', 'instock', 1, 10, '1732587329.jpg', '1732587329-1.jpg,1732587329-2.jpg', 1, 2, '2024-11-25 19:15:32', '2024-11-25 19:15:32'),
(12, 'Bolu Gulung Mini Black Florest', 'bolu-gulung-mini-black-florest', 'Ini adalah Bolu Gulung Mini Black Florest', 'Ini adalah Bolu Gulung Mini Black Florest', 100000.00, 90000.00, 'BGM-BF', 'instock', 1, 10, '1733366317.jpg', '', 4, 8, '2024-12-04 19:38:38', '2024-12-04 19:38:38'),
(13, 'Bolu Gulung Mini Keju', 'bolu-gulung-mini-keju', 'Ini adalah Bolu Gulung Mini Keju', 'Ini adalah Bolu Gulung Mini Keju', 100000.00, 90000.00, 'BGM-Keju', 'instock', 1, 10, '1733366418.jpg', '', 4, 8, '2024-12-04 19:40:18', '2024-12-04 19:40:18'),
(14, 'Bolu Gulung Mini Pandan Srikaya', 'bolu-gulung-mini-pandan-srikaya', 'Ini adalah Bolu Gulung Mini Pandan Srikaya', 'Ini adalah Bolu Gulung Mini Pandan Srikaya', 100000.00, 90000.00, 'BGM-PS', 'instock', 1, 10, '1733366478.jpg', '', 4, 8, '2024-12-04 19:41:18', '2024-12-04 19:41:18'),
(15, 'Brownies Besekat Napoleon', 'brownies-besekat-napoleon', 'Ini adalah Brownies Besekat Napoleon', 'Ini adalah Brownies Besekat Napoleon', 100000.00, 90000.00, 'BN-Besekat', 'instock', 1, 10, '1733366952.jpg', '', 5, 8, '2024-12-04 19:49:13', '2024-12-04 19:49:13'),
(16, 'Lapis Cokelat', 'lapis-cokelat', 'Ini adalah Lapis Cokelat', 'Ini adalah Lapis Cokelat', 100000.00, 90000.00, 'LN-Cokelat', 'instock', 1, 10, '1733367042.jpg', '', 6, 8, '2024-12-04 19:50:42', '2024-12-04 19:50:42'),
(17, 'Lapis Durian', 'lapis-durian', 'Ini adalah Lapis Durian', 'Ini adalah Lapis Durian', 100000.00, 90000.00, 'LN-Durian', 'instock', 1, 10, '1733367120.jpg', '', 6, 8, '2024-12-04 19:52:00', '2024-12-04 19:52:00'),
(18, 'Lapis Original', 'lapis-original', 'Ini adalah Lapis Original', 'Ini adalah Lapis Original', 100000.00, 90000.00, 'LN-Original', 'instock', 1, 10, '1733367202.jpg', '', 6, 8, '2024-12-04 19:53:22', '2024-12-04 19:53:22'),
(19, 'Lapis Pandan', 'lapis-pandan', 'Ini adalah Lapis Pandan', 'Ini adalah Lapis Pandan', 100000.00, 90000.00, 'LN-Pandan', 'instock', 1, 10, '1733367405.jpg', '', 6, 8, '2024-12-04 19:56:45', '2024-12-04 19:56:45'),
(20, 'Lapis Ubi Ungu', 'lapis-ubi-ungu', 'Ini adalah Lapis Ubi Ungu', 'Ini adalah Lapis Ubi Ungu', 100000.00, 90000.00, 'LN-UbiU', 'instock', 1, 10, '1733367480.jpg', '', 6, 8, '2024-12-04 19:58:00', '2024-12-04 19:58:00'),
(21, 'Napoleon Caramel', 'napoleon-caramel', 'ini adalah Napoleon Caramel', 'ini adalah Napoleon Caramel', 100000.00, 90000.00, 'NC-Caramel', 'instock', 1, 10, '1733367920.jpg', '', 7, 8, '2024-12-04 20:05:20', '2024-12-04 20:05:20'),
(22, 'Napoleon Durian', 'napoleon-durian', 'ini adalah Napoleon Durian', 'ini adalah Napoleon Durian', 100000.00, 90000.00, 'NC-Durian', 'instock', 1, 10, '1733367997.jpg', '', 7, 8, '2024-12-04 20:06:37', '2024-12-04 20:06:37'),
(23, 'Napoleon Extra Cheese', 'napoleon-extra-cheese', 'ini adalah Napoleon Extra Cheese', 'ini adalah Napoleon Extra Cheese', 100000.00, 90000.00, 'NC-EC', 'instock', 1, 10, '1733368105.jpg', '', 7, 8, '2024-12-04 20:08:25', '2024-12-04 20:08:25'),
(24, 'Napoleon Great Chocolate', 'napoleon-great-chocolate', 'ini adalah Napoleon Great Chocolate', 'ini adalah Napoleon Great Chocolate', 100000.00, 90000.00, 'NC-GreatC', 'instock', 1, 10, '1733368220.jpg', '', 7, 8, '2024-12-04 20:10:20', '2024-12-04 20:10:20'),
(25, 'Napoleon Green Tea', 'napoleon-green-tea', 'ini adalah Napoleon Green Tea', 'ini adalah Napoleon Green Tea', 100000.00, 90000.00, 'NC-GT', 'instock', 1, 10, '1733368315.jpg', '', 7, 8, '2024-12-04 20:11:56', '2024-12-04 20:11:56'),
(26, 'Napoleon Kopi', 'napoleon-kopi', 'ini adalah Napoleon Kopi', 'ini adalah Napoleon Kopi', 100000.00, 90000.00, 'NC-Kopi', 'instock', 1, 10, '1733368367.jpg', '', 7, 8, '2024-12-04 20:12:47', '2024-12-04 20:12:47'),
(27, 'Napoleon Red Velvet', 'napoleon-red-velvet', 'ini adalah Napoleon Red Velvet', 'ini adalah Napoleon Red Velvet', 100000.00, 90000.00, 'NC-RV', 'instock', 1, 10, '1733368418.jpg', '', 7, 8, '2024-12-04 20:13:38', '2024-12-04 20:13:38'),
(28, 'Napoleon Tiramisu', 'napoleon-tiramisu', 'ini adalah Napoleon Tiramisu', 'ini adalah Napoleon Tiramisu', 100000.00, 90000.00, 'NC-Tiramisu', 'instock', 1, 10, '1733368487.jpg', '', 7, 8, '2024-12-04 20:14:47', '2024-12-04 20:14:47'),
(29, 'Roll cake Cokelat', 'roll-cake-cokelat', 'ini adalah Roll cake Cokelat', 'ini adalah Roll cake Cokelat', 100000.00, 90000.00, 'RC-Cokelat', 'instock', 1, 10, '1733368553.jpg', '', 8, 8, '2024-12-04 20:15:54', '2024-12-04 20:15:54'),
(30, 'Roll cake Keju', 'roll-cake-keju', 'ini adalah Roll cake Keju', 'ini adalah Roll cake Keju', 100000.00, 90000.00, 'RC-Keju', 'instock', 1, 10, '1733368602.jpg', '', 8, 8, '2024-12-04 20:16:42', '2024-12-04 20:16:42');

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
('2oR7O9O93TmHPPYRTQjdTli9D3nKmeYVk4B8m2CD', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV05aNkdpQ0FIdEs1a0VSSHlLaGlhYkd3eExWZVRHT1hXWFR3b21IVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzMzMzcwNDg3O319', 1733370487);

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
(1, 2, 1, 'cod', 'pending', '2024-11-25 01:54:11', '2024-11-25 01:54:11'),
(2, 2, 2, 'cod', 'pending', '2024-11-25 02:05:43', '2024-11-25 02:05:43'),
(3, 2, 3, 'cod', 'pending', '2024-11-25 02:10:43', '2024-11-25 02:10:43'),
(4, 2, 4, 'cod', 'pending', '2024-11-25 18:13:48', '2024-11-25 18:13:48'),
(5, 3, 5, 'cod', 'pending', '2024-11-25 19:34:45', '2024-11-25 19:34:45'),
(6, 2, 6, 'cod', 'pending', '2024-12-02 06:15:21', '2024-12-02 06:15:21');

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
(1, 'admin', 'admin@gmail.com', '083185279521', NULL, '$2y$12$wEpyHU5ra5/VWohZypAY2udZxKkh8PrWJ48oxRcEckwFmfl4td.UK', 'ADM', NULL, '2024-10-17 09:08:47', '2024-10-17 09:08:47'),
(2, 'user', 'user@gmail.com', '081234567890', NULL, '$2y$12$A4g.6qhgPw4q2G8m78217O9ks5KNkpd0/nXzWx6i9zIArTbJbsroG', 'USR', NULL, '2024-10-17 09:11:10', '2024-10-17 09:11:10'),
(3, 'ika', 'ika@gmail.com', '089876543219', NULL, '$2y$12$jur4Yyq1VWDlYO77sRw/EulZD7HFFHxNtld2kXPCvR55rvG5TZLMa', 'USR', NULL, '2024-10-17 19:38:13', '2024-10-17 19:38:13');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
