-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2022 at 09:25 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `setStatusLaundry` (IN `xuuid_laundry` VARCHAR(100))  BEGIN
DECLARE total_task,task_completed,new_status INT;



    select (select count(uuid_task) from task where uuid_laundry=xuuid_laundry) as total_task , 

    (select count(uuid_task) from task where uuid_laundry=xuuid_laundry and status_task=1) as total_completed

    into total_task, task_completed;

   	

   	# to debug variable SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = task_completed;

   	# Cek Apakah task selesai = total task, jika sama berarti status laundry jadi 1

   	IF (total_task = task_completed) THEN

    	set new_status = 7;

   	else

    	set new_status = 0;

  	END IF;

    

 	#update

   	update laundry set status_laundry=new_status where uuid_laundry = xuuid_laundry;
	end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `uuid_customer` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `map_longtitude` varchar(100) DEFAULT NULL,
  `map_latitude` varchar(100) DEFAULT NULL,
  `inden` float(12,2) DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`uuid_customer`, `no_telp`, `nama`, `alamat`, `map_longtitude`, `map_latitude`, `inden`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('22442250-3a09-11ec-8d43-4b6e16b5a29d', '12312332', 'asdasdasd', 'asdsad', NULL, NULL, 0.00, 0, 1, '2021-10-31 12:12:30', 1, '2021-11-02 06:42:17'),
('60c0e0d0-3b6d-11ec-aac9-e7503e36ae22', '085834246342', 'Dimas Syaiful', 'Buana Impian Blok K no 20', NULL, NULL, 20000.00, 1, 1, '2021-11-02 06:42:43', 1, '2021-11-02 07:31:29'),
('6214b1f0-4d3d-11ec-9bc4-4bd238ad561b', '8000', 'asd', 'sss', NULL, NULL, 0.00, 1, 1, '2021-11-24 22:44:27', 1, '2021-11-24 22:44:27'),
('65bb2c88-15c2-11ec-82a8-0242ac130003', '5', 'Dimas', 'asdasd', NULL, NULL, 0.00, 0, 0, NULL, 1, '2021-11-02 06:42:23'),
('Dimpul', '5555555', 'Contoh Customer', 'Batams', NULL, NULL, 200.00, 1, 2, '2021-10-31 08:45:37', 1, '2021-11-02 07:36:21'),
('e15de820-3a08-11ec-80fc-87e9de7a02eb', '085834246342', 'dimpulssss', 'Batam', NULL, NULL, 0.00, 0, 1, '2021-10-31 12:12:03', 1, '2021-11-02 06:42:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_inden_history`
--

CREATE TABLE `customer_inden_history` (
  `uuid_inden_history` varchar(50) NOT NULL,
  `uuid_customer` varchar(50) NOT NULL,
  `total` float(12,2) DEFAULT 0.00,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_inden_history`
--

INSERT INTO `customer_inden_history` (`uuid_inden_history`, `uuid_customer`, `total`, `keterangan`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('0b4e286c-30ed-4ebe-8e97-292a4f5b6860', 'Dimpul', 4000.00, 'test Mengubah data inden menjadi 4,000', 2, '2021-10-31 08:53:44', 2, '2021-10-31 08:53:44'),
('123', 'Dimpul', 10000.00, 'test Mengubah data inden menjadi 10,000', 2, '2021-10-31 08:53:19', 2, '2021-10-31 08:53:19'),
('12323', 'Dimpul', 10000.00, 'test Mengubah data inden menjadi 10,000', 2, '2021-10-31 08:53:19', 2, '2021-10-31 08:53:19'),
('4456e86a-c356-438c-8c1e-2d60ce985f40', 'Dimpul', 4000.00, 'test Mengubah data inden menjadi 4,000', 2, '2021-11-02 07:26:03', 2, '2021-11-02 07:26:03'),
('898eb225-753b-4d50-b608-04cb91439d05', 'Dimpul', 700000.00, 'dimpul Mengubah data inden menjadi 700,000', 1, '2021-11-02 07:35:59', 1, '2021-11-02 07:35:59'),
('9247a408-ae1c-4452-9a21-ced4728b6991', 'Dimpul', 700000.00, 'dimpul Mengubah data inden menjadi 700,000', 1, '2021-11-02 07:35:19', 1, '2021-11-02 07:35:19'),
('99ea4e6c-63d3-4cd7-8250-440bf4ff3d5e', 'Dimpul', 99999.00, 'test Mengubah data inden menjadi 99,999', 2, '2021-11-02 07:26:26', 2, '2021-11-02 07:26:26'),
('b1d1840f-929e-4718-890c-43e9f4fae7b4', 'Dimpul', 5000.00, 'test Mengubah data inden menjadi 5,000', 2, '2021-10-31 08:53:38', 2, '2021-10-31 08:53:38'),
('bc64f369-e91c-4aa2-b010-9079093fdbec', 'Dimpul', 10000.00, 'test Mengubah data inden menjadi 10,000', 2, '2021-10-31 08:53:19', 2, '2021-10-31 08:53:19'),
('c952f5fb-261b-4426-b906-b32bc581e8d4', '60c0e0d0-3b6d-11ec-aac9-e7503e36ae22', 20000.00, 'dimpul Mengubah data inden menjadi 20,000', 1, '2021-11-02 07:31:29', 1, '2021-11-02 07:31:29'),
('fb31835e-0cc5-4473-8b94-9c29aae06c0d', 'Dimpul', 200.00, 'dimpul Mengubah data inden menjadi 200', 1, '2021-11-02 07:36:21', 1, '2021-11-02 07:36:21'),
('fde13ac4-653f-4854-910f-d591fc5d02ed', 'Dimpul', 200.00, 'dimpul Mengubah data inden menjadi 200', 1, '2021-11-02 07:36:11', 1, '2021-11-02 07:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id_hak_akses` int(11) NOT NULL,
  `id_jenis_user` int(11) NOT NULL,
  `id_modul` varchar(50) NOT NULL,
  `activity` varchar(200) DEFAULT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hak_akses`
--

INSERT INTO `hak_akses` (`id_hak_akses`, `id_jenis_user`, `id_modul`, `activity`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(1, 1, 'mod_laundry', NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_laundry`
--

CREATE TABLE `jenis_laundry` (
  `id_jenis_laundry` int(11) NOT NULL,
  `jenis_laundry` varchar(50) NOT NULL,
  `uom` varchar(10) NOT NULL,
  `harga_per_uom` int(11) NOT NULL,
  `additional_group` varchar(50) DEFAULT NULL,
  `status_order_array` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_laundry`
--

INSERT INTO `jenis_laundry` (`id_jenis_laundry`, `jenis_laundry`, `uom`, `harga_per_uom`, `additional_group`, `status_order_array`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(23, 'Cuci Kering', 'ks', 4500, NULL, '[2,3,5]', 0, 1, '2021-10-29 03:13:03', 1, '2021-11-02 06:35:08'),
(24, 'Cuci Kering Setrika', 'kg', 6500, NULL, '[2,3,4,5]', 1, 1, '2021-10-29 03:13:46', 1, '2021-10-29 03:13:46'),
(27, 'Cuci Keringssssssss', 'ksssss', 45000000, NULL, '[2,3,4,5]', 0, 1, '2021-10-29 05:49:28', 1, '2021-10-29 06:01:26'),
(28, 'Dimpul', 'kg', 90000, NULL, '[2,5]', 0, 1, '2021-10-29 06:01:38', 1, '2021-10-29 06:02:16'),
(29, 'Setrika', 'kg', 4500, NULL, '[4,5]', 1, 1, '2021-12-03 23:40:44', 1, '2021-12-03 23:40:54'),
(30, 'Cuci Kering', 'kg', 3500, NULL, '[2,3]', 1, 1, '2021-12-03 23:41:24', 1, '2021-12-03 23:41:24'),
(31, 'test', 'kg', 20000, NULL, '[2]', 1, 2, '2022-01-08 20:32:58', 2, '2022-01-08 20:32:58'),
(32, 'testing', 'kg', 5000, NULL, '[2,3,5]', 1, 1, '2022-01-22 15:44:55', 1, '2022-01-22 15:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_user`
--

CREATE TABLE `jenis_user` (
  `id_jenis_user` int(11) NOT NULL,
  `jenis_user` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_user`
--

INSERT INTO `jenis_user` (`id_jenis_user`, `jenis_user`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(1, 'Root', 1, 0, NULL, 0, NULL),
(2, 'Admin', 1, 0, NULL, 0, NULL),
(3, 'Karyawan', 1, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

CREATE TABLE `laundry` (
  `uuid_laundry` varchar(50) NOT NULL,
  `uuid_customer` varchar(50) NOT NULL,
  `id` int(11) DEFAULT NULL,
  `tanggal_masuk` datetime DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
  `status_bayar` tinyint(1) DEFAULT 9,
  `status_laundry` tinyint(1) DEFAULT 6,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laundry`
--

INSERT INTO `laundry` (`uuid_laundry`, `uuid_customer`, `id`, `tanggal_masuk`, `tanggal_keluar`, `status_bayar`, `status_laundry`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('00a6db70-7081-11ec-ab1b-f57fdc2d563f', 'Dimpul', NULL, '2022-01-08 19:46:00', NULL, 10, 7, 1, 1, '2022-01-08 19:46:47', 1, '2022-02-05 15:19:14'),
('159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Dimpul', NULL, '2022-01-01 16:51:00', NULL, 10, 0, 1, 1, '2022-01-08 19:47:43', 1, '2022-01-22 16:54:38'),
('18d549a0-5454-11ec-a282-13bc9d3832bb', '60c0e0d0-3b6d-11ec-aac9-e7503e36ae22', NULL, '2021-12-03 23:14:00', NULL, 9, 0, 1, 1, '2021-12-03 23:14:57', 1, '2021-12-03 23:14:57'),
('245d9970-7b65-11ec-bdf8-a9bf0157cc09', '60c0e0d0-3b6d-11ec-aac9-e7503e36ae22', NULL, '2022-01-22 16:24:00', NULL, 10, 0, 1, 1, '2022-01-22 16:25:00', 1, '2022-02-05 14:50:38'),
('6cbbb6b0-7062-11ec-b84d-7f7e13d7ca40', '6214b1f0-4d3d-11ec-9bc4-4bd238ad561b', NULL, '2022-01-20 16:07:00', NULL, 9, 0, 1, 1, '2022-01-08 16:14:59', 1, '2022-01-08 16:14:59'),
('c686e230-5453-11ec-a282-13bc9d3832bb', '60c0e0d0-3b6d-11ec-aac9-e7503e36ae22', NULL, '2021-12-03 23:12:00', NULL, 9, 0, 1, 1, '2021-12-03 23:13:09', 1, '2021-12-03 23:13:09'),
('f71df5b0-5452-11ec-a282-13bc9d3832bb', '60c0e0d0-3b6d-11ec-aac9-e7503e36ae22', NULL, '2021-12-03 23:06:00', NULL, 9, 0, 1, 1, '2021-12-03 23:06:43', 1, '2021-12-03 23:06:43'),
('qwersstwasd2ys', '65bb2c88-15c2-11ec-82a8-0242ac130003', NULL, '2020-02-02 00:00:00', NULL, 9, 0, 1, 2, '2022-01-22 16:22:59', 2, '2022-01-22 16:22:59'),
('qwersstwys', '65bb2c88-15c2-11ec-82a8-0242ac130003', NULL, '2020-09-09 00:00:00', NULL, 1, 0, 1, 2, '2021-12-03 23:21:38', 2, '2022-01-22 16:34:50'),
('qwertys', '65bb2c88-15c2-11ec-82a8-0242ac130003', NULL, '2020-02-02 00:00:00', NULL, 0, 0, 1, 2, '2021-12-03 23:20:14', 2, '2021-12-03 23:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `laundry_history`
--

CREATE TABLE `laundry_history` (
  `uuid_laundry_history` varchar(50) NOT NULL,
  `uuid_laundry` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT NULL,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laundry_history`
--

INSERT INTO `laundry_history` (`uuid_laundry_history`, `uuid_laundry`, `keterangan`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('0042d8e3-925c-4204-a69e-e28c28b5c7fd', 'f71df5b0-5452-11ec-a282-13bc9d3832bb', 'Laundry Baru Telah Ditambahkan', 1, '2021-12-03 23:06:43', 1, '2021-12-03 23:06:43'),
('0fad9a4d-308f-4ba7-97e9-4d6833372c13', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:52:03', 1, '2022-01-22 16:52:03'),
('22193184-0b42-4370-b66e-a86af8b4863e', 'qwersstwys', 'Laundry Baru Telah Ditambahkan', 2, '2021-12-03 23:21:38', 2, '2021-12-03 23:21:38'),
('23eb687b-38dd-474e-b046-ac7000249e3a', '245d9970-7b65-11ec-bdf8-a9bf0157cc09', 'Detail Laundry Berhasil Diubah', 1, '2022-02-05 14:50:38', 1, '2022-02-05 14:50:38'),
('2a911ad1-93ac-480c-90c2-36a237ea7130', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:50:48', 1, '2022-01-22 16:50:48'),
('34b26023-c52e-42dd-9b94-3604db0add68', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:50:55', 1, '2022-01-22 16:50:55'),
('410a0ed8-5676-4532-a691-aba189459456', '6cbbb6b0-7062-11ec-b84d-7f7e13d7ca40', 'Laundry Baru Telah Ditambahkan', 1, '2022-01-08 16:14:59', 1, '2022-01-08 16:14:59'),
('433c1a71-6276-4f73-8c9f-113be00f8827', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:51:24', 1, '2022-01-22 16:51:24'),
('4cd5cb62-ef23-4198-bcd4-c8992c24cf7d', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:50:52', 1, '2022-01-22 16:50:52'),
('4ed4ce85-0109-44fd-9dc0-fc1ad6b85f15', 'c686e230-5453-11ec-a282-13bc9d3832bb', 'Laundry Baru Telah Ditambahkan', 1, '2021-12-03 23:13:09', 1, '2021-12-03 23:13:09'),
('5a2f3893-9b47-4c0e-82fd-4429b56bb773', '18d549a0-5454-11ec-a282-13bc9d3832bb', 'Laundry Baru Telah Ditambahkan', 1, '2021-12-03 23:14:57', 1, '2021-12-03 23:14:57'),
('5eef4137-98bc-48eb-89b4-d58f654e64e1', '00a6db70-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-02-05 14:57:32', 1, '2022-02-05 14:57:32'),
('6f25fac7-c6c7-423f-9bd4-9970c0c04cf1', '00a6db70-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-02-03 18:19:19', 1, '2022-02-03 18:19:19'),
('84d64a64-95c4-463e-8bec-b3f5a24e808c', '00a6db70-7081-11ec-ab1b-f57fdc2d563f', 'Laundry Baru Telah Ditambahkan', 1, '2022-01-08 19:46:47', 1, '2022-01-08 19:46:47'),
('8dd8a39e-9e03-45b3-b6f2-71495cda6a73', '00a6db70-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 18:13:07', 1, '2022-01-22 18:13:07'),
('a5b22152-3378-4219-9d42-4b83c9f6e755', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:54:38', 1, '2022-01-22 16:54:38'),
('b186962c-0cfb-4c7a-b38d-e0b5cb8cf500', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:51:09', 1, '2022-01-22 16:51:09'),
('ba03ab77-011b-4433-937f-4118bd9de976', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:51:35', 1, '2022-01-22 16:51:35'),
('be892dea-4cb3-4755-a24e-8ca6f1ac876b', '00a6db70-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-02-05 15:19:14', 1, '2022-02-05 15:19:14'),
('c077a23e-79ba-49f7-8eca-f00d8200b92b', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Laundry Baru Telah Ditambahkan', 1, '2022-01-08 19:47:43', 1, '2022-01-08 19:47:43'),
('c67d7675-467d-41c1-98a8-93b9bb4c343e', 'qwersstwys', 'Detail Laundry Berhasil Diubah', 2, '2022-01-22 16:34:50', 2, '2022-01-22 16:34:50'),
('c811d630-c47b-4406-8e3c-615e287b2dd8', '245d9970-7b65-11ec-bdf8-a9bf0157cc09', 'Laundry Baru Telah Ditambahkan', 1, '2022-01-22 16:25:00', 1, '2022-01-22 16:25:00'),
('caeabb10-701b-4526-92d4-b6ea20dc3792', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 'Detail Laundry Berhasil Diubah', 1, '2022-01-22 16:50:10', 1, '2022-01-22 16:50:10'),
('cb11061e-0eb2-4869-929f-4199122242fe', 'qwertys', 'Laundry Baru Telah Ditambahkan', 2, '2021-12-03 23:20:14', 2, '2021-12-03 23:20:14'),
('ddb679e0-d2d5-4518-8459-29eb5b60f0ec', 'qwersstwasd2ys', 'Laundry Baru Telah Ditambahkan', 2, '2022-01-22 16:22:59', 2, '2022-01-22 16:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(17, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(18, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(19, '2016_06_01_000004_create_oauth_clients_table', 1),
(20, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` varchar(50) NOT NULL,
  `nama_modul` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('mod_laundry', 'Modul Laundry', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `passport`
--

CREATE TABLE `passport` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passport` varchar(100) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passport`
--

INSERT INTO `passport` (`id_user`, `username`, `passport`, `last_login`, `expiry_date`) VALUES
(1, 'dimpul', '$2y$10$8RspyDKO8JMYRCDigecRl.BvZfXLMxNOdI8a6jnv2bd5tRa4RfAXK', '2022-02-04 19:11:29', '2022-02-05 19:11:29'),
(2, 'test', '$2y$10$5RPHmKad1W34Rxkzg90mLOLGuJFSaryIEPAwl7t4HVBkBBx7sT.m2', '2022-02-04 18:46:25', '2022-02-05 18:46:25'),
(32, 'dicky', '$2y$10$ZESmBrItSxT2BcWkOewJI.7xKXBbRbLG2hdM3aZbauwt/WEvAUFL6', '2021-10-24 19:47:26', '2021-10-28 09:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `icon_material` varchar(50) DEFAULT NULL,
  `icon_image` varchar(50) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `keterangan`, `icon_material`, `icon_image`, `type`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(0, 'Tersedia', NULL, NULL, 'global', 1, 0, NULL, 0, NULL),
(1, 'Selesai', NULL, NULL, 'task_status', 1, 0, NULL, 0, NULL),
(2, 'Cuci', NULL, NULL, 'task_status', 1, 0, NULL, 0, NULL),
(3, 'Jemur', NULL, NULL, 'task_status', 1, 0, NULL, 0, NULL),
(4, 'Setrika', NULL, NULL, 'task_status', 1, 0, NULL, 0, NULL),
(5, 'Packing', NULL, NULL, 'task_status', 1, 0, NULL, 0, NULL),
(6, 'Dalam Proses', NULL, NULL, 'laundry_status', 1, 0, NULL, 0, NULL),
(7, 'Selesai', NULL, NULL, 'laundry_status', 1, 0, NULL, 0, NULL),
(8, 'Telah Diterima Customer', NULL, NULL, 'laundry_status', 1, 0, NULL, 0, NULL),
(9, 'Belum Lunas', NULL, NULL, 'transasksi_status', 1, 0, NULL, 0, NULL),
(10, 'Lunas', NULL, NULL, 'transasksi_status', 1, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `uuid_task` varchar(50) NOT NULL,
  `uuid_laundry` varchar(50) NOT NULL,
  `id_jenis_laundry` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT 0,
  `jumlah` decimal(12,2) NOT NULL DEFAULT 0.00,
  `uom` varchar(10) NOT NULL,
  `harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status_task` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`uuid_task`, `uuid_laundry`, `id_jenis_laundry`, `id_user`, `jumlah`, `uom`, `harga`, `total_harga`, `status_task`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('07502df0-7081-11ec-ab1b-f57fdc2d563f', '00a6db70-7081-11ec-ab1b-f57fdc2d563f', 30, 1, '20000.00', 'kg', '3500.00', '70000000.00', 1, 1, 1, '2022-01-08 19:46:47', 1, '2022-02-05 15:18:55'),
('20443610-5454-11ec-a282-13bc9d3832bb', '18d549a0-5454-11ec-a282-13bc9d3832bb', 24, 0, '2.00', 'kg', '6500.00', '13000.00', 0, 1, 1, '2021-12-03 23:14:57', 1, '2021-12-03 23:14:57'),
('2294ec40-7081-11ec-ab1b-f57fdc2d563f', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 30, 0, '2.00', 'kg', '3500.00', '7000.00', 0, 1, 1, '2022-01-08 19:47:43', 1, '2022-01-08 19:47:43'),
('261ba200-7081-11ec-ab1b-f57fdc2d563f', '159fa980-7081-11ec-ab1b-f57fdc2d563f', 24, 0, '3.00', 'kg', '6500.00', '19500.00', 0, 1, 1, '2022-01-08 19:47:43', 1, '2022-01-08 19:47:43'),
('290a58a0-7b65-11ec-bdf8-a9bf0157cc09', '245d9970-7b65-11ec-bdf8-a9bf0157cc09', 30, 2, '2.00', 'kg', '3500.00', '7000.00', 3, 1, 1, '2022-01-22 16:25:00', 1, '2022-02-05 14:51:42'),
('6f5ecdc0-7063-11ec-b84d-7f7e13d7ca40', '6cbbb6b0-7062-11ec-b84d-7f7e13d7ca40', 30, 0, '2.00', 'kg', '3500.00', '7000.00', 0, 1, 1, '2022-01-08 16:14:59', 1, '2022-01-08 16:14:59'),
('cd074ff0-5453-11ec-a282-13bc9d3832bb', 'c686e230-5453-11ec-a282-13bc9d3832bb', 24, 0, '2.00', 'kg', '6500.00', '13000.00', 0, 1, 1, '2021-12-03 23:13:09', 1, '2021-12-03 23:13:09'),
('fdaf5360-5452-11ec-a282-13bc9d3832bb', 'f71df5b0-5452-11ec-a282-13bc9d3832bb', 24, 0, '2.00', 'kg', '6500.00', '13000.00', 0, 1, 1, '2021-12-03 23:06:43', 1, '2021-12-03 23:06:43'),
('qwersstwssys', 'qwersstwasd2ys', 24, 0, '2.00', 'kg', '20000.00', '40000.00', 0, 1, 2, '2022-01-22 16:22:59', 2, '2022-01-22 16:22:59'),
('qwersstwys', 'qwersstwys', 24, 0, '2.00', 'kg', '20000.00', '40000.00', 0, 1, 2, '2021-12-03 23:21:38', 2, '2021-12-03 23:21:38'),
('qwertys', 'qwertys', 24, 0, '2.00', 'kg', '20000.00', '40000.00', 0, 1, 2, '2021-12-03 23:20:14', 2, '2021-12-03 23:20:14');

--
-- Triggers `task`
--
DELIMITER $$
CREATE TRIGGER `updateStatusLaundry_onDelete` AFTER DELETE ON `task` FOR EACH ROW begin 
	 call setStatusLaundry(old.uuid_laundry);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStatusLaundry_onInsert` AFTER INSERT ON `task` FOR EACH ROW begin 
	 call setStatusLaundry(new.uuid_laundry);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStatusLaundry_onUpdate` AFTER UPDATE ON `task` FOR EACH ROW begin 
	 call setStatusLaundry(new.uuid_laundry);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

CREATE TABLE `task_history` (
  `uuid_task_history` varchar(50) NOT NULL,
  `uuid_task` varchar(50) NOT NULL,
  `status_from` int(11) DEFAULT 0,
  `status_to` int(11) DEFAULT 0,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_history`
--

INSERT INTO `task_history` (`uuid_task_history`, `uuid_task`, `status_from`, `status_to`, `keterangan`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
('0c3ff3de-febc-4117-9ab2-44227879869d', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 0, 0, 'Handover task ke dimpul', 1, '2022-02-04 20:08:15', 1, '2022-02-04 20:08:15'),
('45c3af94-17c5-4a1d-92dd-f103e0b0c1d1', '2294ec40-7081-11ec-ab1b-f57fdc2d563f', NULL, 0, 'List Cucian Telah Ditambahkan', 1, '2022-01-08 19:47:43', 1, '2022-01-08 19:47:43'),
('4aa8dded-28e7-4b81-a074-1115d8910928', '6f5ecdc0-7063-11ec-b84d-7f7e13d7ca40', NULL, 0, 'List Cucian Telah Ditambahkan', 1, '2022-01-08 16:14:59', 1, '2022-01-08 16:14:59'),
('4dad8692-17aa-4b97-9379-72d7761fe1ea', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 1, 3, 'Update status dari \'Selesai\' ke \'Jemur\'', 1, '2022-02-04 20:12:00', 1, '2022-02-04 20:12:00'),
('569c7705-a883-45aa-b488-1e1a835f6735', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 0, 0, 'Handover task ke dimpul', 1, '2022-02-04 19:29:46', 1, '2022-02-04 19:29:46'),
('5c96ecb4-0f9b-4464-a252-edc2613d9435', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 4, 1, 'Update status dari \'Setrika\' ke \'Selesai\'', 1, '2022-02-05 14:57:18', 1, '2022-02-05 14:57:18'),
('5f045bc2-11ed-42f2-9abb-fd8722bc5f69', '290a58a0-7b65-11ec-bdf8-a9bf0157cc09', NULL, 0, 'List Cucian Telah Ditambahkan', 1, '2022-01-22 16:25:00', 1, '2022-01-22 16:25:00'),
('63839260-1151-4054-bec2-3d71c01f6e26', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 3, 1, 'Update status dari \'Jemur\' ke \'Selesai\'', 1, '2022-02-05 15:07:01', 1, '2022-02-05 15:07:01'),
('6b3c2fad-83d6-4f5a-a785-dec698dd109d', 'fdaf5360-5452-11ec-a282-13bc9d3832bb', NULL, 6, 'List Cucian Telah Ditambahkan', 1, '2021-12-03 23:06:43', 1, '2021-12-03 23:06:43'),
('6eceddf6-f5be-4224-a9d4-dbe7bdfba7b6', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 0, 1, 'Update status dari \'Tersedia\' ke \'Selesai\'', 1, '2022-02-04 20:08:51', 1, '2022-02-04 20:08:51'),
('714a1672-9bae-4be8-a465-6d21fc4b1bd0', 'qwertys', NULL, 0, 'List Cucian Telah Ditambahkan', 2, '2021-12-03 23:20:14', 2, '2021-12-03 23:20:14'),
('71899e4b-8288-45a4-aeda-5d28833e8714', '290a58a0-7b65-11ec-bdf8-a9bf0157cc09', 0, 3, 'Update status dari \'Tersedia\' ke \'Jemur\'', 1, '2022-02-05 14:51:42', 1, '2022-02-05 14:51:42'),
('7bae90e5-1069-4a8b-892c-d3577cb0eda9', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 0, 0, 'Handover task ke dimpul', 1, '2022-02-04 20:08:30', 1, '2022-02-04 20:08:30'),
('7e3dbdf8-eafc-4749-a1ed-bf8b2d996ef7', '07502df0-7081-11ec-ab1b-f57fdc2d563f', NULL, 0, 'List Cucian Telah Ditambahkan', 1, '2022-01-08 19:46:47', 1, '2022-01-08 19:46:47'),
('8596fd19-f7c4-48a6-aeba-888c4dc020ba', 'cd074ff0-5453-11ec-a282-13bc9d3832bb', NULL, 6, 'List Cucian Telah Ditambahkan', 1, '2021-12-03 23:13:09', 1, '2021-12-03 23:13:09'),
('880b91fa-6ece-47af-b898-66662fc2d4ba', '290a58a0-7b65-11ec-bdf8-a9bf0157cc09', 0, 0, 'Handover task ke test', 1, '2022-02-05 14:51:32', 1, '2022-02-05 14:51:32'),
('8ca1b155-8b5f-4076-8cf5-2b118de6983e', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 1, 2, 'Update status dari \'Selesai\' ke \'Cuci\'', 1, '2022-02-05 15:15:53', 1, '2022-02-05 15:15:53'),
('a75b22c5-0fb2-4dc4-86be-c35815ad85e7', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 0, 0, 'Handover task ke test', 1, '2022-02-04 19:29:33', 1, '2022-02-04 19:29:33'),
('b8be1ae1-7544-4c24-8e4f-876cc8aab932', 'qwersstwssys', NULL, 0, 'List Cucian Telah Ditambahkan', 2, '2022-01-22 16:22:59', 2, '2022-01-22 16:22:59'),
('bc070b13-b243-4a2d-93b7-f274bf1746a3', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 2, 1, 'Update status dari \'Cuci\' ke \'Selesai\'', 1, '2022-02-05 15:18:55', 1, '2022-02-05 15:18:55'),
('bf642b43-1850-4da4-92b6-c09ba457f23d', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 3, 1, 'Update status dari \'Jemur\' ke \'Selesai\'', 1, '2022-02-05 14:52:22', 1, '2022-02-05 14:52:22'),
('c57c4288-b9b7-4255-afd0-d0d181708372', '20443610-5454-11ec-a282-13bc9d3832bb', NULL, 6, 'List Cucian Telah Ditambahkan', 1, '2021-12-03 23:14:57', 1, '2021-12-03 23:14:57'),
('ca8dc5ff-5911-4d22-b3ad-43f3b17089ef', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 1, 4, 'Update status dari \'Selesai\' ke \'Setrika\'', 1, '2022-02-05 14:53:01', 1, '2022-02-05 14:53:01'),
('de0bbce3-5d28-480f-b4ce-21ded800be72', '261ba200-7081-11ec-ab1b-f57fdc2d563f', NULL, 0, 'List Cucian Telah Ditambahkan', 1, '2022-01-08 19:47:43', 1, '2022-01-08 19:47:43'),
('e68cff6a-53ce-4f01-846f-43f7d72f36fa', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 0, 0, 'Handover task ke dimpul', 1, '2022-02-04 19:27:30', 1, '2022-02-04 19:27:30'),
('f2109573-8c4b-4c1f-83cf-5c975998f2a8', '07502df0-7081-11ec-ab1b-f57fdc2d563f', 1, 3, 'Update status dari \'Selesai\' ke \'Jemur\'', 1, '2022-02-05 15:05:45', 1, '2022-02-05 15:05:45'),
('f92028d8-4524-4da9-89a4-a249cf08dc1e', 'qwersstwys', NULL, 0, 'List Cucian Telah Ditambahkan', 2, '2021-12-03 23:21:38', 2, '2021-12-03 23:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_jenis_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_jenis_user`, `username`, `password`, `is_active`, `insert_by`, `insert_at`, `update_by`, `update_at`) VALUES
(0, 1, 'SYSTEM', 'SYSTEM', 1, 0, NULL, 0, NULL),
(1, 2, 'dimpul', '$2y$10$9dOXGOEjojrR/929QhB48.qA1Eawlp/xQWbb8n637yPtrm6RBaKTW', 1, 0, NULL, 2, '2022-01-08 20:31:05'),
(2, 2, 'test', '$2y$10$xb6wBASRkcNuRICEP.3hk.8qAekVVfexpfqDgzm0vplYqK5bJd8vO', 1, 0, NULL, 1, '2021-09-17 06:06:05'),
(45, 1, 'dimpulssss2ss', '$2y$10$XXRMTbn5ix9qTw7K.efc4.SwOPm0N3rVvQtU4bhiQ0DXhoi3XUrLW', 1, 2, '2022-01-08 20:30:39', 2, '2022-01-08 20:30:39');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_laundry`
-- (See below for the actual view)
--
CREATE TABLE `view_laundry` (
`uuid_laundry` varchar(50)
,`uuid_customer` varchar(50)
,`nama_customer` varchar(100)
,`alamat` varchar(100)
,`no_telp` varchar(15)
,`tanggal_masuk` datetime
,`tanggal_keluar` datetime
,`status_bayar` tinyint(1)
,`status_laundry` tinyint(1)
,`total` decimal(34,2)
,`is_active` tinyint(1)
,`update_at` datetime
,`update_by` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_task`
-- (See below for the actual view)
--
CREATE TABLE `view_task` (
`uuid_task` varchar(50)
,`uuid_laundry` varchar(50)
,`nama` varchar(100)
,`jenis_laundry` varchar(50)
,`id_jenis_laundry` int(11)
,`jumlah` decimal(12,2)
,`uom` varchar(10)
,`harga` decimal(12,2)
,`total_harga` decimal(12,2)
,`tanggal_masuk` datetime
,`tanggal_keluar` datetime
,`status` varchar(50)
,`status_id` int(11)
,`handle_by` varchar(50)
,`is_active` tinyint(1)
,`update_at` datetime
,`update_by` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_laundry`
--
DROP TABLE IF EXISTS `view_laundry`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_laundry`  AS SELECT `l`.`uuid_laundry` AS `uuid_laundry`, `c`.`uuid_customer` AS `uuid_customer`, `c`.`nama` AS `nama_customer`, `c`.`alamat` AS `alamat`, `c`.`no_telp` AS `no_telp`, `l`.`tanggal_masuk` AS `tanggal_masuk`, `l`.`tanggal_keluar` AS `tanggal_keluar`, `l`.`status_bayar` AS `status_bayar`, `l`.`status_laundry` AS `status_laundry`, sum(`t`.`total_harga`) AS `total`, `l`.`is_active` AS `is_active`, `l`.`update_at` AS `update_at`, `l`.`update_by` AS `update_by` FROM ((`laundry` `l` join `customer` `c`) join `task` `t`) WHERE `l`.`uuid_laundry` = `t`.`uuid_laundry` AND `c`.`uuid_customer` = `l`.`uuid_customer` GROUP BY `l`.`uuid_laundry`, `c`.`uuid_customer`, `c`.`nama`, `c`.`alamat`, `c`.`no_telp`, `l`.`tanggal_masuk`, `l`.`tanggal_keluar`, `l`.`status_bayar`, `l`.`status_laundry`, `l`.`is_active`, `l`.`update_at`, `l`.`update_by` ;

-- --------------------------------------------------------

--
-- Structure for view `view_task`
--
DROP TABLE IF EXISTS `view_task`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_task`  AS SELECT `t`.`uuid_task` AS `uuid_task`, `t`.`uuid_laundry` AS `uuid_laundry`, `c`.`nama` AS `nama`, `j`.`jenis_laundry` AS `jenis_laundry`, `j`.`id_jenis_laundry` AS `id_jenis_laundry`, `t`.`jumlah` AS `jumlah`, `t`.`uom` AS `uom`, `t`.`harga` AS `harga`, `t`.`total_harga` AS `total_harga`, `l`.`tanggal_masuk` AS `tanggal_masuk`, `l`.`tanggal_keluar` AS `tanggal_keluar`, `s`.`keterangan` AS `status`, `t`.`status_task` AS `status_id`, if(`t`.`id_user` = 0,' - ',`u`.`username`) AS `handle_by`, `t`.`is_active` AS `is_active`, `t`.`update_at` AS `update_at`, `t`.`update_by` AS `update_by` FROM (((((`task` `t` join `customer` `c`) join `laundry` `l`) join `jenis_laundry` `j`) join `status` `s`) join `user` `u`) WHERE `t`.`uuid_laundry` = `l`.`uuid_laundry` AND `l`.`uuid_customer` = `c`.`uuid_customer` AND `t`.`id_jenis_laundry` = `j`.`id_jenis_laundry` AND `t`.`status_task` = `s`.`id_status` AND `t`.`id_user` = `u`.`id_user` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`uuid_customer`);

--
-- Indexes for table `customer_inden_history`
--
ALTER TABLE `customer_inden_history`
  ADD PRIMARY KEY (`uuid_inden_history`),
  ADD KEY `customer_inden_history_FK` (`uuid_customer`);

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id_hak_akses`),
  ADD KEY `id_jenis_user` (`id_jenis_user`),
  ADD KEY `id_modul` (`id_modul`);

--
-- Indexes for table `jenis_laundry`
--
ALTER TABLE `jenis_laundry`
  ADD PRIMARY KEY (`id_jenis_laundry`);

--
-- Indexes for table `jenis_user`
--
ALTER TABLE `jenis_user`
  ADD PRIMARY KEY (`id_jenis_user`);

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`uuid_laundry`),
  ADD KEY `laundry_FK` (`uuid_customer`);

--
-- Indexes for table `laundry_history`
--
ALTER TABLE `laundry_history`
  ADD PRIMARY KEY (`uuid_laundry_history`),
  ADD KEY `laundry_history_FK` (`uuid_laundry`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`uuid_task`),
  ADD KEY `task_FK` (`id_jenis_laundry`),
  ADD KEY `task_FK_1` (`uuid_laundry`);

--
-- Indexes for table `task_history`
--
ALTER TABLE `task_history`
  ADD PRIMARY KEY (`uuid_task_history`),
  ADD KEY `task_history_FK` (`uuid_task`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_un` (`username`),
  ADD KEY `id_jenis_user` (`id_jenis_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jenis_laundry`
--
ALTER TABLE `jenis_laundry`
  MODIFY `id_jenis_laundry` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `jenis_user`
--
ALTER TABLE `jenis_user`
  MODIFY `id_jenis_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_inden_history`
--
ALTER TABLE `customer_inden_history`
  ADD CONSTRAINT `customer_inden_history_FK` FOREIGN KEY (`uuid_customer`) REFERENCES `customer` (`uuid_customer`);

--
-- Constraints for table `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD CONSTRAINT `hak_akses_ibfk_1` FOREIGN KEY (`id_jenis_user`) REFERENCES `jenis_user` (`id_jenis_user`),
  ADD CONSTRAINT `hak_akses_ibfk_2` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`);

--
-- Constraints for table `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_FK` FOREIGN KEY (`uuid_customer`) REFERENCES `customer` (`uuid_customer`);

--
-- Constraints for table `laundry_history`
--
ALTER TABLE `laundry_history`
  ADD CONSTRAINT `laundry_history_FK` FOREIGN KEY (`uuid_laundry`) REFERENCES `laundry` (`uuid_laundry`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_FK` FOREIGN KEY (`id_jenis_laundry`) REFERENCES `jenis_laundry` (`id_jenis_laundry`) ON UPDATE CASCADE,
  ADD CONSTRAINT `task_FK_1` FOREIGN KEY (`uuid_laundry`) REFERENCES `laundry` (`uuid_laundry`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_FK` FOREIGN KEY (`uuid_task`) REFERENCES `task` (`uuid_task`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_jenis_user`) REFERENCES `jenis_user` (`id_jenis_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
