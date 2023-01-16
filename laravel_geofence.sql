-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jan 2023 pada 14.14
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_geofence`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `geofences`
--

CREATE TABLE `geofences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `geofences`
--

INSERT INTO `geofences` (`id`, `name`, `coordinates`, `created_at`, `updated_at`) VALUES
(1, 'jaksel', '[{\"lat\":-6.2189516974231696,\"lng\":106.77472241972657},{\"lat\":-6.218269092252912,\"lng\":106.89831861113282},{\"lat\":-6.319284966943476,\"lng\":106.89557202910157},{\"lat\":-6.313825150743381,\"lng\":106.7486298904297}]', '2023-01-15 07:22:36', '2023-01-16 06:12:04'),
(2, 'cibinong', '[{\"lat\":-6.564610231244184,\"lng\":106.71656544440937},{\"lat\":-6.5710905529150505,\"lng\":106.77458698981953},{\"lat\":-6.606389767797267,\"lng\":106.82213719123554},{\"lat\":-6.5993983354632375,\"lng\":106.77012379401874},{\"lat\":-6.590531011028787,\"lng\":106.72549183601093}]', '2023-01-15 07:31:42', '2023-01-15 18:39:46'),
(3, 'papua', '[{\"lat\":-3.898966248412689,\"lng\":137.77641959467095},{\"lat\":-3.9921286976932286,\"lng\":138.59490103998345},{\"lat\":-4.326328732188198,\"lng\":138.44109244623345},{\"lat\":-4.309896019051035,\"lng\":137.48528189935845},{\"lat\":-4.003088295636542,\"lng\":137.66655631342095}]', '2023-01-15 07:35:17', '2023-01-15 18:40:14'),
(4, 'whypok', '[{\"lat\":-6.354089938739949,\"lng\":106.76478451368696},{\"lat\":-6.366373485005984,\"lng\":106.90074032423384},{\"lat\":-6.423010471969647,\"lng\":106.88975399610884},{\"lat\":-6.476912112763202,\"lng\":106.87876766798384},{\"lat\":-6.449620859195874,\"lng\":106.74830502149946},{\"lat\":-6.406634157130807,\"lng\":106.74899166700727}]', '2023-01-16 05:49:30', '2023-01-16 05:50:05'),
(5, 'Bogor', '[{\"lat\":-6.547779908688464,\"lng\":106.718314359701},{\"lat\":-6.554601527995065,\"lng\":106.7787391643885},{\"lat\":-6.6405459040748305,\"lng\":106.78697891048225},{\"lat\":-6.630997266509395,\"lng\":106.70458144954475}]', '2023-01-16 06:13:27', '2023-01-16 06:13:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_15_080058_create_geofences_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlets`
--

CREATE TABLE `outlets` (
  `id` int(10) UNSIGNED NOT NULL,
  `province_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `district_id` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `village_id` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `category_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double(15,8) NOT NULL DEFAULT 0.00000000,
  `long` double(15,8) NOT NULL DEFAULT 0.00000000,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distributor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distributor_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submited_by` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `date_verified` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cluster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_pareto` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `outlets`
--

INSERT INTO `outlets` (`id`, `province_id`, `city_id`, `district_id`, `village_id`, `category_id`, `account_id`, `code`, `name`, `address`, `image`, `lat`, `long`, `owner`, `phone_number`, `rt`, `rw`, `size`, `note`, `distributor`, `distributor_code`, `submited_by`, `client_id`, `status`, `is_verified`, `date_verified`, `created_at`, `updated_at`, `cluster`, `deleted_at`, `is_pareto`) VALUES
(1, 31, 3171, '3171100', '3171100005', 5, 23, 'WS002', 'Workshop T-Rec Menteng Atas', 'Jln Menteng Atas Selatan III, gg 4 no 18. Setiabudi, Jakarta Selatan, Jakarta', 'outlet/5cd854416a151.', -6.21851430, 106.83907500, 'Luthfi', '085611223344', '13', '05', NULL, NULL, 'PT. Logistik Nasional', 'CD00876', 2, 1, 1, 1, NULL, '2019-01-13 16:16:51', '2022-09-23 15:47:15', NULL, NULL, 1),
(2, 31, 3171, '3171020', '3171020003', 5, 23, 'HO001', 'Workshop T-Rec Indonesia Kebagusan', 'Gg. Puskemas Jalan Kebagusan Raya No. 50A Kebagusan Jakarta Selatan', 'outlet/5c3bf8cd72bd5.jpg', -6.29850060, 106.82768080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 1, NULL, '2019-01-14 02:49:49', '2019-10-12 16:31:38', NULL, NULL, 0),
(3, 31, 3171, '3171100', '3171100005', 5, 73, 'Ep001', 'Work From Home', 'kunigan setiabudi', 'outlet/5c3cb14580941.', -6.21885380, 106.83674200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 1, 0, NULL, '2019-01-14 14:00:00', '2022-09-23 09:44:48', NULL, NULL, 0),
(4, 32, 3201, '0', '0', 1, 2, '001', 'Outlet Rumah', 'Dramaga Ciherang', 'outlet/5c3cb11d94b5d.', -6.58835950, 106.74688730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, '2019-01-14 14:17:21', '2019-01-14 15:56:13', NULL, NULL, 0),
(5, 31, 3171, '0', '0', 5, 23, 'K001', 'Kantor Cabang', 'jl. menteng atas selatan gang 4 ', 'outlet/5c3c9fcf45b78.jpg', -6.21851870, 106.83902260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 0, 0, NULL, '2019-01-14 14:42:23', '2019-01-14 02:19:29', NULL, NULL, 0),
(6, 31, 3172, '0', '0', 5, 20, 'GT001', 'Warung Pak Haji', 'Jl Tebet Dalam IIC No. 16', 'outlet/5c3dbbd37e427.jpg', -6.22737320, 106.84846670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, NULL, '2019-01-15 10:54:11', '2019-01-15 03:59:01', NULL, NULL, 0),
(7, 31, 3175, '0', '0', 5, 23, 'HO001', 'HO CV JAYA ABADI', 'Penjaringan pluit', 'outlet/5c3ea9d861685.jpg', -6.12994210, 106.78814280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 0, 0, NULL, '2019-01-16 03:49:44', '2020-12-03 15:40:15', NULL, NULL, 0),
(8, 31, 3175, '0', '0', 5, 23, 'HO001', 'HO JAYA ABADI', 'Pluit jakarta utara', 'outlet/5c3eadf1784ea.jpg', -6.12994100, 106.78814120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 0, 0, NULL, '2019-01-16 04:07:13', '2019-01-16 04:07:13', NULL, NULL, 0),
(9, 31, 3171, '0', '0', 5, 50, NULL, 'Melbourne Kitchen Cafe - Cilandak Town Square', 'Cilandak Town Square 2nd Floor, Jl TB Simatupang Ka .17 RT 6 RW 9 Cilandak Barat Jakarta Selatan 12430', 'outlet/5c3ef89897b09.jpg', -6.29140720, 106.79995520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, 1, 1, NULL, '2019-01-16 09:25:44', '2019-01-22 17:54:33', NULL, NULL, 0),
(10, 31, 3175, '0', '0', 5, 23, '', 'Kantor MARIE REGAL', 'jln pluit karang karya timur', 'outlet/5c3fe9fb08310.jpg', -6.13006160, 106.78831640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, 2, 0, 0, NULL, '2019-01-17 02:35:39', '2019-01-17 02:35:39', NULL, NULL, 0),
(11, 31, 3175, '0', '0', 3, 8, '', 'C  Jaya Abadi', 'Jl pluit karang timur', 'outlet/5c3fea12641b3.jpg', -6.13085140, 106.78852590, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 0, 0, NULL, '2019-01-17 02:36:02', '2019-01-17 02:36:02', NULL, NULL, 0),
(12, 31, 3175, '0', '0', 5, 23, '', 'CV. JAYA ABADI (KANTOR REGAL)', 'Jl. Pluit Karang Timur', 'outlet/5c3fea1f4d52e.jpg', -6.12990720, 106.78858680, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 2, 0, 0, NULL, '2019-01-17 02:36:15', '2019-01-17 02:36:15', NULL, NULL, 0),
(13, 31, 3175, '0', '0', 2, 3, '', 'Farmers Pluit', 'jl.pluit muara karang.penjaringan pluit jakarta utara', 'outlet/5c3fea202acd3.jpg', -6.13018540, 106.78856730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 2, 0, 0, NULL, '2019-01-17 02:36:16', '2019-01-17 02:36:16', NULL, NULL, 0),
(14, 31, 3174, '0', '0', 3, 8, '', 'CV JAYA ABADI', 'jl pluit karang karya tim', 'outlet/5c3fea20c544f.jpg', -6.12994500, 106.78873500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, 2, 0, 0, NULL, '2019-01-17 02:36:16', '2019-01-17 02:36:16', NULL, NULL, 0),
(15, 31, 3172, '0', '0', 2, 35, '', 'Aeon Cakung', 'Jl Seruni', 'outlet/5c3fea2207410.jpg', -6.12958370, 106.78851780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 2, 0, 0, NULL, '2019-01-17 02:36:18', '2019-01-17 02:36:18', NULL, NULL, 0),
(16, 31, 3175, '0', '0', 2, 3, '', 'Toko Kantor Jaya Abadi', 'jl. muara karang pluit', 'outlet/5c3fea221a74b.jpg', -6.13006630, 106.78854080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, 2, 0, 0, NULL, '2019-01-17 02:36:18', '2019-01-17 02:36:18', NULL, NULL, 0),
(17, 31, 3172, '0', '0', 2, 17, '', 'Indogrosir Cipianag', 'jln pisangan Baru pasar induk ', 'outlet/5c3fea229de7e.jpg', -6.13006120, 106.78858570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 2, 0, 0, NULL, '2019-01-17 02:36:18', '2019-01-17 02:36:18', NULL, NULL, 0),
(18, 31, 3175, '0', '0', 2, 17, '', 'Lsi Basura', 'jln pluit mas utara', 'outlet/5c3fea22d3c1b.jpg', -6.13207960, 106.79000060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, 2, 0, 0, NULL, '2019-01-17 02:36:18', '2019-01-17 02:36:18', NULL, NULL, 0),
(19, 32, 3271, '0', '0', 3, 8, '', 'Lotte Ws Yasmin', 'jalan johar', 'outlet/5c3fea23700fe.jpg', -6.13006630, 106.78851870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 2, 0, 0, NULL, '2019-01-17 02:36:19', '2019-01-17 02:36:19', NULL, NULL, 0),
(20, 36, 3674, '0', '0', 2, 55, '', 'Lulu Bsd', 'pagedangan ', 'outlet/5c3fea24a84c6.jpg', -6.12996550, 106.78861430, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 2, 0, 0, NULL, '2019-01-17 02:36:20', '2019-01-17 02:36:20', NULL, NULL, 0),
(21, 32, 3275, '0', '0', 2, 53, '', 'Tip Top Pondok Gede', 'Jalan Jatimakmur Raya', 'outlet/5c3fea27810b9.jpg', -6.12986950, 106.78850400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 0, 0, NULL, '2019-01-17 02:36:23', '2019-01-17 02:36:23', NULL, NULL, 0),
(22, 31, 3174, '0', '0', 2, 21, '', 'Lotte Grosir Meruya', 'Jl topaz meruya utara', 'outlet/5c3fea2a6556c.jpg', -6.13006890, 106.78855170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 2, 0, 0, NULL, '2019-01-17 02:36:26', '2019-01-17 02:36:26', NULL, NULL, 0),
(23, 31, 3175, '0', '0', 2, 17, '', 'Lsi Bsd', 'jl. pluit mas utara', 'outlet/5c3fea2ba9a1d.jpg', -6.13005980, 106.78850610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, 2, 0, 0, NULL, '2019-01-17 02:36:27', '2019-01-17 02:36:27', NULL, NULL, 0),
(24, 31, 3175, '0', '0', 1, 1, '', 'Alfa Mart', 'jl pluit raya', 'outlet/5c3fea2c4b87c.jpg', -6.13006130, 106.78855570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 2, 0, 0, NULL, '2019-01-17 02:36:28', '2019-01-17 02:36:28', NULL, NULL, 0),
(25, 31, 3175, '0', '0', 3, 29, '', 'indogrosir ', 'jl pluit karang', 'outlet/5c3fea39b4633.jpg', -6.13006570, 106.78853340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, 0, 0, NULL, '2019-01-17 02:36:41', '2019-01-17 02:36:41', NULL, NULL, 0),
(26, 31, 3172, '0', '0', 3, 8, '', 'Lotte Pasar Rebo', 'jln.pluit muara karang', 'outlet/5c3fea3c3f4cb.jpg', -6.13006250, 106.78859680, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 2, 0, 0, NULL, '2019-01-17 02:36:44', '2019-01-17 02:36:44', NULL, NULL, 0),
(27, 31, 3172, '0', '0', 3, 8, '', 'Lotte Mart Bintaro', 'jl.pluit muara karang', 'outlet/5c3fea40eb2f8.jpg', -6.13006450, 106.78852950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 2, 0, 0, NULL, '2019-01-17 02:36:48', '2019-01-17 02:36:48', NULL, NULL, 0),
(28, 31, 3175, '0', '0', 1, 1, '', 'C  Jaya Abadi', 'jln pluit karang timur', 'outlet/5c3fea4102a0b.jpg', -6.13006860, 106.78855900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 2, 0, 0, NULL, '2019-01-17 02:36:49', '2019-01-17 02:36:49', NULL, NULL, 0),
(29, 31, 3172, '0', '0', 2, 53, '', 'CV.Jaya Abadi', 'pluit', 'outlet/5c3fea529e03f.jpg', -6.13006480, 106.78852920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 2, 0, 0, NULL, '2019-01-17 02:37:06', '2019-01-17 02:37:06', NULL, NULL, 0),
(30, 31, 3175, '0', '0', 5, 23, '', 'Kantor C  Jaya Abadi ', 'jl muara karang karya pluit penjaringan jakarta utara', 'outlet/5c3fea55c5172.jpg', -6.13006420, 106.78852700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 2, 0, 0, NULL, '2019-01-17 02:37:09', '2019-01-17 02:37:09', NULL, NULL, 0),
(31, 31, 3175, '0', '0', 2, 3, '', 'CV.Jaya Abadi', 'jln Pluit muara karang baru,blok c', 'outlet/5c3fea5da37a5.jpg', -6.13006480, 106.78852920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 2, 0, 0, NULL, '2019-01-17 02:37:17', '2019-01-17 02:37:17', NULL, NULL, 0),
(32, 31, 3171, '0', '0', 2, 53, '', 'C .Jaya Abadi', 'Pluit ', 'outlet/5c3fea5e8b5f1.jpg', -6.13006160, 106.78831640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 0, 0, NULL, '2019-01-17 02:37:18', '2019-01-17 02:37:18', NULL, NULL, 0),
(33, 31, 3174, '0', '0', 2, 53, '', 'Toko Jaya Abadi', 'pluit ', 'outlet/5c3fea64d3cfa.jpg', -6.13006640, 106.78853660, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 2, 0, 0, NULL, '2019-01-17 02:37:24', '2019-01-17 02:37:24', NULL, NULL, 0),
(34, 31, 3175, '0', '0', 5, 23, '', 'Kantor CV.Jaya Abadi @Regal', 'jl.pluit muara karang ', 'outlet/5c3fea68ed062.jpg', -6.13006330, 106.78851460, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 2, 0, 0, NULL, '2019-01-17 02:37:28', '2019-01-17 02:37:28', NULL, NULL, 0),
(35, 31, 3175, '0', '0', 5, 23, '', 'CV.JAYA ABADI', 'Jl. Pluit Karang Karya Tim.', 'outlet/5c3fea6bc513e.jpg', -6.13005470, 106.78852280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 2, 0, 0, NULL, '2019-01-17 02:37:31', '2019-01-17 02:37:31', NULL, NULL, 0),
(36, 31, 3171, '0', '0', 2, 53, '', 'C .Jaya Abadi', 'Pluit ', 'outlet/5c3fea6be349e.jpg', -6.13005700, 106.78849990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 0, 0, NULL, '2019-01-17 02:37:31', '2019-01-17 02:37:31', NULL, NULL, 0),
(37, 31, 3174, '0', '0', 5, 23, '', 'C  Jaya Abadi', 'jalan pluit karang karya Tim', 'outlet/5c3fea6fef554.jpg', -6.13006170, 106.78855120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 2, 0, 0, NULL, '2019-01-17 02:37:35', '2019-01-17 02:37:35', NULL, NULL, 0),
(38, 36, 3671, '0', '0', 3, 7, '', 'TOKO JA', 'tip top cimone jl.gatot subroto', 'outlet/5c3fea76329f3.jpg', -6.12997410, 106.78864900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 0, 0, NULL, '2019-01-17 02:37:42', '2019-01-17 02:37:42', NULL, NULL, 0),
(39, 31, 3175, '0', '0', 5, 23, '', 'C  Jaya Abadi', 'jln pluit karang karya ', 'outlet/5c3feaab4c254.jpg', -6.13006370, 106.78856310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 0, 0, NULL, '2019-01-17 02:38:35', '2019-01-17 02:38:35', NULL, NULL, 0),
(40, 31, 3175, '0', '0', 5, 23, '', 'CV.JAYA ABADI', 'jl pluit karang karya Tim', 'outlet/5c3feab2ecba0.jpg', -6.13006260, 106.78855850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 2, 0, 0, NULL, '2019-01-17 02:38:42', '2019-01-17 02:38:42', NULL, NULL, 0),
(41, 31, 3175, '0', '0', 5, 23, '', 'C  Jaya Abadi', 'jln pluit karang karya ', 'outlet/5c3feabdbd489.jpg', -6.13006780, 106.78855930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 0, 0, NULL, '2019-01-17 02:38:53', '2019-01-17 02:38:53', NULL, NULL, 0),
(42, 36, 3671, '0', '0', 3, 7, 'Tk', 'TOKO JA', 'tip top cimone jl.gatot subroto', 'outlet/5c3feabe167fb.jpg', -6.12997410, 106.78864900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 0, 0, NULL, '2019-01-17 02:38:54', '2019-01-17 02:38:54', NULL, NULL, 0),
(43, 31, 3175, '0', '0', 5, 23, '', 'CV.JAYA ABADI', 'jl pluit karang karya Tim', 'outlet/5c3fead311237.jpg', -6.13006260, 106.78855850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 2, 0, 0, NULL, '2019-01-17 02:39:15', '2019-01-17 02:39:15', NULL, NULL, 0),
(44, 31, 3175, '0', '0', 5, 23, '', 'C  Jaya Abadi', 'jln pluit karang karya ', 'outlet/5c3feaf78f4fc.jpg', -6.13006780, 106.78855930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 0, 0, NULL, '2019-01-17 02:39:51', '2019-01-17 02:39:51', NULL, NULL, 0),
(45, 31, 3175, '0', '0', 2, 3, '', 'C . Jaya', 'jl muara karang', 'outlet/5c3feb30517e0.jpg', -6.13005970, 106.78850860, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 2, 0, 0, NULL, '2019-01-17 02:40:48', '2019-01-17 02:40:48', NULL, NULL, 0),
(46, 31, 3175, '0', '0', 2, 17, '', 'Lsi', 'jln pluit karang karya tim', 'outlet/5c3feb57e4422.jpg', -6.13006670, 106.78853740, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, 2, 0, 0, NULL, '2019-01-17 02:41:27', '2019-01-17 02:41:27', NULL, NULL, 0),
(47, 36, 3671, '0', '0', 3, 7, 'Tk', 'TOKO JA', 'tip top cimone jl.gatot subroto', 'outlet/5c3feb5c7a47e.jpg', -6.13006430, 106.78852840, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 0, 0, NULL, '2019-01-17 02:41:32', '2019-01-17 02:41:32', NULL, NULL, 0),
(48, 31, 3175, '0', '0', 1, 2, 'F2AC', 'Indomaret', 'jln tanah merah ', 'outlet/5c4012ed2e5eb.jpg', -6.13103330, 106.79185790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 2, 0, 0, NULL, '2019-01-17 05:30:21', '2019-01-17 05:30:21', NULL, NULL, 0),
(49, 31, 3175, '0', '0', 1, 2, '', 'Indomaret Pluit Raya Selatan 84', 'indomaret pluit raya selatan 84', 'outlet/5c4012f4118b7.jpg', -6.12597760, 106.78724800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 2, 0, 0, NULL, '2019-01-17 05:30:28', '2019-01-17 05:30:28', NULL, NULL, 0),
(50, 31, 3175, '0', '0', 1, 2, 'F2ac', 'Indomaeet', 'jl  tanah merah', 'outlet/5c40130a842fd.jpg', -6.13112600, 106.79192340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 2, 0, 0, NULL, '2019-01-17 05:30:50', '2019-01-17 05:30:50', NULL, NULL, 0),
(51, 31, 3175, '0', '0', 1, 2, '', 'Indomaret', 'pluit raya selatan 84', 'outlet/5c40130da8821.jpg', -6.12575910, 106.78681240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 2, 0, 0, NULL, '2019-01-17 05:30:53', '2019-01-17 05:30:53', NULL, NULL, 0),
(52, 31, 3175, '0', '0', 1, 2, '', 'IndomaretPuit Raya Selatan 84', 'indomaret Puit Raya Selatan 84', 'outlet/5c401330c9e65.jpg', -6.12575580, 106.78676270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, 2, 0, 0, NULL, '2019-01-17 05:31:28', '2019-01-17 05:31:28', NULL, NULL, 0),
(53, 31, 3175, '0', '0', 1, 2, 'F2AC', 'Indomaret ', 'jln tanah merah', 'outlet/5c40134fcb8a7.jpg', -6.13108460, 106.79180860, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, 2, 0, 0, NULL, '2019-01-17 05:31:59', '2019-01-17 05:31:59', NULL, NULL, 0),
(54, 31, 3175, '0', '0', 1, 1, '', 'Alfamart TBU Bidara', 'Jalan terusan bandengan utara', 'outlet/5c40136207369.jpg', -6.13779630, 106.78840870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 2, 0, 0, NULL, '2019-01-17 05:32:18', '2019-01-17 05:32:18', NULL, NULL, 0),
(55, 31, 3175, '0', '0', 1, 1, '', 'Alfamart Bidara', 'jalan terusan bandengan utara', 'outlet/5c4013645f70b.jpg', -6.13753390, 106.78812870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 2, 0, 0, NULL, '2019-01-17 05:32:20', '2019-01-17 05:32:20', NULL, NULL, 0),
(56, 31, 3175, '0', '0', 1, 2, 'Tc32', 'Idm Teluk Gong 2', 'jln teluk gong raya no 1-2', 'outlet/5c40138add56d.jpg', -6.13741480, 106.78894840, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, 2, 0, 0, NULL, '2019-01-17 05:32:58', '2019-01-17 05:32:58', NULL, NULL, 0),
(57, 31, 3175, '0', '0', 1, 1, '', 'Alfamart', 'jln.terusan Bandengan utara', 'outlet/5c40138e81410.jpg', -6.13750940, 106.78822500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 2, 0, 0, NULL, '2019-01-17 05:33:02', '2019-01-17 05:33:02', NULL, NULL, 0),
(58, 31, 3175, '0', '0', 1, 2, '', 'Pluit Raya Selatan 84', 'pluit raya selatan 84', 'outlet/5c401390ce9a5.jpg', -6.12579280, 106.78679030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, 2, 0, 0, NULL, '2019-01-17 05:33:04', '2019-01-17 05:33:04', NULL, NULL, 0),
(59, 31, 3175, '0', '0', 1, 2, 'F2ac', 'Indomaret', 'jalan tanah merah ', 'outlet/5c4013aa05732.jpg', -6.13115810, 106.79166100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 0, 0, NULL, '2019-01-17 05:33:30', '2019-01-17 05:33:30', NULL, NULL, 0),
(60, 31, 3175, '0', '0', 2, 3, '', 'Farmers Pluit Junction', 'pluit', 'outlet/5c4013d47bcf5.jpg', -6.12625090, 106.79122110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 2, 0, 0, NULL, '2019-01-17 05:34:12', '2019-01-17 05:34:12', NULL, NULL, 0),
(61, 31, 3175, '0', '0', 2, 3, '', 'Farmers market pluit junction', 'pluit ', 'outlet/5c4013d794d0f.jpg', -6.12626360, 106.79118320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 0, 0, NULL, '2019-01-17 05:34:15', '2019-01-17 05:34:15', NULL, NULL, 0),
(62, 31, 3175, '0', '0', 2, 3, '', 'Farmers Pluit Junction', 'jalan pluit', 'outlet/5c4013df9d2ef.jpg', -6.12756820, 106.79147530, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 0, 0, NULL, '2019-01-17 05:34:23', '2019-01-17 05:34:23', NULL, NULL, 0),
(63, 31, 3175, '0', '0', 2, 3, '', 'Farmers Pluit Junction', 'pluit', 'outlet/5c40140fa3fbc.jpg', -6.12633880, 106.79129470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 2, 0, 0, NULL, '2019-01-17 05:35:11', '2019-01-17 05:35:11', NULL, NULL, 0),
(64, 31, 3175, '0', '0', 1, 2, 'Tc32', 'Idm Teluk Gong 2', 'Indomaret teluk gong 2', 'outlet/5c4014abc454e.jpg', -6.13742330, 106.78894520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 0, 0, NULL, '2019-01-17 05:37:47', '2019-01-17 05:37:47', NULL, NULL, 0),
(65, 31, 3172, '0', '0', 2, 84, '', 'Transmart Emporium', 'pluit karang ', 'outlet/5c4014efb6880.jpg', -6.12743470, 106.79079920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 2, 0, 0, NULL, '2019-01-17 05:38:55', '2019-01-17 05:38:55', NULL, NULL, 0),
(66, 31, 3175, '0', '0', 1, 2, 'Tc32', 'Idm Teluk Gong 2', 'Indomaret teluk gong 2', 'outlet/5c4014f30a606.jpg', -6.13734580, 106.78895400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 0, 0, NULL, '2019-01-17 05:38:59', '2019-01-17 05:38:59', NULL, NULL, 0),
(67, 31, 3175, '0', '0', 3, 5, 'HCF001', 'Carrefour Pluit Emporium', 'Jl. Pluit Selatan Raya No. 8 RT. 23 RW 8', 'outlet/5c4014fe4baa1.jpg', -6.12733760, 106.79074220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, '2019-01-17 05:39:10', '2019-05-15 15:04:49', NULL, NULL, 0),
(68, 31, 3175, '0', '0', 3, 5, 'Carrefour', 'Carrefour Pluit', 'jl.pluit putra rt 15/04', 'outlet/5c4015079f102.jpg', -6.11677370, 106.79158700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 2, 0, 0, NULL, '2019-01-17 05:39:19', '2019-01-17 05:39:19', NULL, NULL, 0),
(69, 31, 3175, '0', '0', 2, 13, '', 'Transmart Emporium', 'Jembatan tiga muara karang', 'outlet/5c4015098cb68.jpg', -6.12741780, 106.79080970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 2, 0, 0, NULL, '2019-01-17 05:39:21', '2019-01-17 05:39:21', NULL, NULL, 0),
(70, 31, 3175, '0', '0', 2, 13, '', 'Transmart Emporium', 'pluit jembatan 3', 'outlet/5c40150e269f4.jpg', -6.12742570, 106.79083410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 2, 0, 0, NULL, '2019-01-17 05:39:26', '2019-01-17 05:39:26', NULL, NULL, 0),
(71, 31, 3175, '0', '0', 2, 13, '', 'Transmart Imporium', 'Jl jembatan 3 pluit', 'outlet/5c4015157d5a3.jpg', -6.12738170, 106.79077000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 2, 0, 0, NULL, '2019-01-17 05:39:33', '2019-01-17 05:39:33', NULL, NULL, 0),
(72, 31, 3175, '0', '0', 2, 13, '', 'transmart emporium', 'jl pluit selatan', 'outlet/5c401517b75de.jpg', -6.12741240, 106.79078750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, 0, 0, NULL, '2019-01-17 05:39:35', '2019-01-17 05:39:35', NULL, NULL, 0),
(73, 31, 3175, '0', '0', 2, 13, '', 'C4 Pluit', 'jl pluit putra rt 15 rw 4', 'outlet/5c40151dbb4f4.jpg', -6.11705840, 106.79121490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 2, 0, 0, NULL, '2019-01-17 05:39:41', '2019-01-17 05:39:41', NULL, NULL, 0),
(74, 31, 3175, '0', '0', 2, 13, '', 'Trasnsmart Emporium', 'Pluit karang', 'outlet/5c40152142fab.jpg', -6.12733570, 106.79074180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 2, 0, 0, NULL, '2019-01-17 05:39:45', '2019-01-17 05:39:45', NULL, NULL, 0),
(75, 31, 3175, '0', '0', 2, 13, '', 'C4 Pluit', 'jl pluit putra rt 15 rw 4', 'outlet/5c40152addefc.jpg', -6.11705840, 106.79121490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 2, 0, 0, NULL, '2019-01-17 05:39:54', '2019-01-17 05:39:54', NULL, NULL, 0),
(76, 31, 3174, '0', '0', 2, 13, '', 'Carrefour Pluit', 'jl pluit putra rt15/04 ', 'outlet/5c40155832fde.jpg', -6.11672670, 106.79140500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, 2, 0, 0, NULL, '2019-01-17 05:40:40', '2019-01-17 05:40:40', NULL, NULL, 0),
(77, 31, 3175, '0', '0', 2, 13, '', 'Carrefour', 'jln. pluit putra', 'outlet/5c4015716df24.jpg', -6.11675300, 106.79151490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 2, 0, 0, NULL, '2019-01-17 05:41:05', '2019-01-17 05:41:05', NULL, NULL, 0),
(78, 31, 3175, '0', '0', 3, 5, '', 'c4 season city', 'jl. latumenten', 'outlet/5c401615cc920.jpg', -6.15397670, 106.79639260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 2, 0, 0, NULL, '2019-01-17 05:43:49', '2019-01-17 05:43:49', NULL, NULL, 0),
(79, 31, 3175, '0', '0', 3, 5, '', 'Carefour Season City', 'jl latumenten', 'outlet/5c40161909907.jpg', -6.15399590, 106.79641220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 2, 0, 0, NULL, '2019-01-17 05:43:53', '2019-01-17 05:43:53', NULL, NULL, 0),
(80, 31, 3175, '0', '0', 3, 5, 'C4 Season City ', 'C4  Ss City', 'jln latu menten ', 'outlet/5c40161dddfaa.jpg', -6.15396560, 106.79637440, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 2, 0, 0, NULL, '2019-01-17 05:43:57', '2019-01-17 05:43:57', NULL, NULL, 0),
(81, 31, 3175, '0', '0', 3, 5, '', 'Carrefour Season City', 'jl.latumenten', 'outlet/5c4016224bbb3.jpg', -6.15397560, 106.79642480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 2, 0, 0, NULL, '2019-01-17 05:44:02', '2019-01-17 05:44:02', NULL, NULL, 0),
(82, 36, 3674, '0', '0', 3, 8, NULL, 'Lotte Wholesale Alam Sutra', 'Ruko Alam Sutera Blok Sutera Niaga Ka . 2, Jalan Alam Sutera Boule ard, Serpong, Pakulonan, Serpong Utara, Kota Tangerang Selatan, Banten 15325', 'outlet/5c454ee18cba7.', -6.24669420, 106.65100530, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 2, 1, 1, NULL, '2019-01-17 23:01:52', '2019-05-15 15:04:49', NULL, NULL, 0),
(83, 31, 3174, '0', '0', 2, 90, '0003', 'Lotte Grosir Meruya', 'Lotte grosir meruya', 'outlet/5c4110f20d16c.jpg', -6.19355590, 106.73426490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 2, 1, 0, NULL, '2019-01-17 23:34:10', '2019-01-18 02:54:27', NULL, NULL, 0),
(84, 31, 3175, '0', '0', 3, 8, 'DKI-000002', 'Lottemart Kelapa Gading', 'Jl. Boule ard Bar. Raya, RT.18/RW.8, Klp. Gading Bar., Klp. Gading, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14240', 'outlet/5c41125ad6356.jpg', -6.15299990, 106.89547330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2, 1, 1, '2019-03-14 20:01:03', '2019-01-17 23:40:10', '2021-04-30 09:15:25', NULL, NULL, 0),
(85, 31, 3175, '0', '0', 5, 23, 'HORGL', 'Kantor Regal', 'jl pluit karang karya timur blok c', 'outlet/5c411281cb002.jpg', -6.12995490, 106.78815940, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 2, 1, 0, NULL, '2019-01-17 23:40:49', '2019-01-22 09:39:02', NULL, NULL, 0),
(86, 31, 3175, '0', '0', 5, 23, '', 'Kantor C  Jaya Abadi', 'jl. pluit karang karya blok C ', 'outlet/5c4116cc0a538.jpg', -6.13002700, 106.78826690, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, 2, 1, 0, NULL, '2019-01-17 23:59:08', '2019-01-17 23:59:08', NULL, NULL, 0),
(87, 36, 3603, '0', '0', 3, 29, '05', 'Indogrosir Jatiuwung', 'Jl.gatot subroto km 5 ', 'outlet/5c411890a73eb.jpg', -6.18982700, 106.59126480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 2, 1, 0, NULL, '2019-01-18 00:06:40', '2019-01-18 00:06:40', NULL, NULL, 0),
(88, 32, 3276, '3276030', '3276030008', 2, 53, 'DKI-000013', 'TIPTOP DEPOK', 'Jl. Tole Iskandar No.3, Mekar Jaya, Sukmajaya, Kota Depok, Jawa Barat 16412', 'outlet/5c4119068607d.jpg', -6.40341390, 106.83534040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 1, 1, '2019-01-27 22:09:38', '2019-01-18 00:08:38', '2021-04-30 08:42:43', NULL, NULL, 0),
(89, 32, 3275, '0', '0', 2, 53, 'STT001', 'Tip Top Pondok Gede', 'Jl. Jati Makmur No.30, Jatirahayu, Pondokmelati, Kota Bks, Jawa Barat 17413', 'outlet/5c455154d741c.', -6.28557950, 106.91835460, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 1, 0, NULL, '2019-01-18 00:11:35', '2019-01-21 04:57:56', NULL, NULL, 0),
(90, 31, 3175, '0', '0', 5, 23, NULL, 'Kantor Regal (CV Jaya Abadi)', 'Blok, Jl. Pluit Karang Karya Tim. Blok C No.9-12, RT.23/RW.8, Penjaringan, North Jakarta City, Jakarta 14440', 'outlet/5c411ada5b8dc.jpg', -6.12991030, 106.78811690, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, 2, 0, 1, '2019-01-27 22:33:31', '2019-01-18 00:16:26', '2019-02-02 17:04:22', NULL, NULL, 0),
(91, 31, 3175, '0', '0', 5, 23, '', 'KANTOR REGAL JAYA ABADI', 'Jl. Pluit Karang Karya Tim.', 'outlet/5c411bd03d542.jpg', -6.12995190, 106.78816870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, 2, 1, 0, NULL, '2019-01-18 00:20:32', '2019-01-18 00:20:32', NULL, NULL, 0),
(92, 31, 3175, '0', '0', 5, 23, '', 'C  Jaya Abadi', 'jln pluit karang karya', 'outlet/5c411bdb01e46.jpg', -6.12995230, 106.78815590, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, 2, 1, 0, NULL, '2019-01-18 00:20:43', '2019-01-18 00:20:43', NULL, NULL, 0),
(93, 31, 3172, '0', '0', 3, 29, NULL, 'Indogrosir Cipinang', 'Pasar Induk Beras Cipinang, RT.9/RW.9, Pisangan Timur, Jatinegara, RT.9/RW.9, Pisangan Tim., Pulo Gadung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13230', 'outlet/5c411c98497b9.jpg', -6.21273340, 106.88307430, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 2, 1, 1, '2019-01-27 22:21:50', '2019-01-18 00:23:52', '2019-05-15 15:04:49', NULL, NULL, 0),
(94, 31, 3175, '0', '0', 5, 23, '', 'CV Jaya Abadi', 'Jalan pluit karang karya blok c', 'outlet/5c411d8963bf4.jpg', -6.12995430, 106.78818030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 2, 1, 0, NULL, '2019-01-18 00:27:53', '2019-01-18 00:27:53', NULL, NULL, 0),
(95, 31, 3175, '0', '0', 5, 23, '', 'Kantor Jaya Abadi', 'jl pluit karang karya blok c', 'outlet/5c411fd3f0989.jpg', -6.12994390, 106.78814520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, 2, 1, 0, NULL, '2019-01-18 00:37:39', '2019-01-18 00:37:39', NULL, NULL, 0),
(96, 31, 3173, '0', '0', 3, 29, NULL, 'INDOGROSIR KEMAYORAN', 'Jl. Terusan Angkasa B-2 No.Ka  1, RW.10, Gn. Sahari Sel., Kemayoran, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10610', 'outlet/5c455852f04b0.', -6.15666060, 106.85027980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 2, 1, 1, '2019-03-14 20:23:09', '2019-01-18 00:38:20', '2019-03-14 20:23:09', NULL, NULL, 0),
(97, 32, 3201, '0', '0', 5, 23, '0001', 'Kantor Mjp', 'kayu manis jl parung bogor', 'outlet/5c41221cb1a7f.jpg', -6.53619100, 106.76877400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 2, 1, 0, NULL, '2019-01-18 00:47:24', '2019-01-17 18:03:32', NULL, NULL, 0),
(98, 32, 3271, '0', '0', 2, 53, 'Tip Top Depok', 'Tip Top Depok', 'tip top jln tole iskandar', 'outlet/5c41247f77a8b.jpg', -6.40303150, 106.83522780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 2, 0, 0, NULL, '2019-01-18 00:57:35', '2020-12-03 15:40:15', NULL, NULL, 0),
(99, 31, 3174, '0', '0', 3, 8, NULL, 'Lotte Wholesale Meruya', 'Jl. Topaz BT No.77, RT.6/RW.11, Meruya Utara, Kembangan, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11620', 'outlet/5c41265d20865.jpg', -6.19375700, 106.73427620, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, 2, 1, 1, NULL, '2019-01-18 01:05:33', '2019-05-15 15:04:49', NULL, NULL, 0),
(100, 31, 3172, '0', '0', 3, 29, NULL, 'INDOGROSIR CIPINANG', 'Pasar Induk Beras Cipinang, RT.9/RW.9, Pisangan Timur, Jatinegara, RT.9/RW.9, Pisangan Tim., Pulo Gadung, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta 13230', 'outlet/5c41277c05bcd.jpg', -6.21335170, 106.88274500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 2, 1, 1, '2019-01-27 22:20:41', '2019-01-18 01:10:20', '2019-01-27 22:20:41', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `geofences`
--
ALTER TABLE `geofences`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `outlets`
--
ALTER TABLE `outlets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`),
  ADD KEY `id` (`id`),
  ADD KEY `is_verified` (`is_verified`);
ALTER TABLE `outlets` ADD FULLTEXT KEY `name_2` (`name`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `geofences`
--
ALTER TABLE `geofences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `outlets`
--
ALTER TABLE `outlets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2289034;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
