-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2021 at 07:34 PM
-- Server version: 10.3.31-MariaDB-cll-lve
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u1555875_laundry_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `uuid_customer` varchar(50) NOT NULL,
  `no_telp` int(15) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `map_longtitude` varchar(100) DEFAULT NULL,
  `map_latitude` varchar(100) DEFAULT NULL,
  `inden` float(12,2) DEFAULT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

CREATE TABLE `laundry` (
  `uuid_laundry` varchar(50) NOT NULL,
  `uuid_customer` varchar(50) NOT NULL,
  `tanggal_masuk` datetime DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
  `status_bayar` tinyint(1) DEFAULT 0,
  `status_laundry` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laundry_history`
--

CREATE TABLE `laundry_history` (
  `uuid_laundry_history` varchar(50) NOT NULL,
  `uuid_laundry` varchar(50) NOT NULL,
  `status_paid_from` int(11) DEFAULT 0,
  `status_paid_to` int(11) DEFAULT 0,
  `status_laundry_from` int(11) DEFAULT 0,
  `status_laundry_to` int(11) DEFAULT 0,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `icon_material` varchar(50) DEFAULT NULL,
  `icon_image` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `uuid_task` varchar(50) NOT NULL,
  `uuid_laundry` varchar(50) NOT NULL,
  `id_jenis_laundry` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `jumlah` decimal(12,2) NOT NULL DEFAULT 0.00,
  `uom` varchar(10) NOT NULL,
  `harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

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
  ADD KEY `id_jenis_user` (`id_jenis_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_laundry`
--
ALTER TABLE `jenis_laundry`
  MODIFY `id_jenis_laundry` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_user`
--
ALTER TABLE `jenis_user`
  MODIFY `id_jenis_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `task_FK_1` FOREIGN KEY (`uuid_laundry`) REFERENCES `laundry` (`uuid_laundry`);

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
