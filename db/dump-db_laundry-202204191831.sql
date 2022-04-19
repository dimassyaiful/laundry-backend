-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: db_laundry
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absensi`
--

DROP TABLE IF EXISTS `absensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absensi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `tanggal_masuk` datetime DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
  `insert_by` int(11) DEFAULT NULL,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `absensi_FK` (`id_user`),
  CONSTRAINT `absensi_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absensi`
--

LOCK TABLES `absensi` WRITE;
/*!40000 ALTER TABLE `absensi` DISABLE KEYS */;
INSERT INTO `absensi` VALUES (2,'2022-04-14','2022-04-14 11:40:52','2022-04-14 11:41:18',2,'2022-04-14 23:40:52',2,'2022-04-14 23:40:52',2),(3,'2022-04-15','2022-04-15 12:19:47','2022-04-15 10:19:51',2,'2022-04-15 00:19:47',2,'2022-04-15 00:19:47',2),(12,'2022-04-15','2022-04-15 19:26:05','2022-04-15 19:26:07',1,'2022-04-15 19:26:05',1,'2022-04-15 19:26:05',1);
/*!40000 ALTER TABLE `absensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('22442250-3a09-11ec-8d43-4b6e16b5a29d','12312332','asdasdasd','asdsad',NULL,NULL,0.00,0,1,'2021-10-31 12:12:30',1,'2021-11-02 06:42:17'),('60c0e0d0-3b6d-11ec-aac9-e7503e36ae22','085834246342','Dimas Syaiful','Buana Impian Blok K no 20',NULL,NULL,20000.00,1,1,'2021-11-02 06:42:43',1,'2021-11-02 07:31:29'),('6214b1f0-4d3d-11ec-9bc4-4bd238ad561b','8000','asd','sss',NULL,NULL,0.00,1,1,'2021-11-24 22:44:27',1,'2021-11-24 22:44:27'),('65bb2c88-15c2-11ec-82a8-0242ac130003','5','Dimas','asdasd',NULL,NULL,0.00,0,0,NULL,1,'2021-11-02 06:42:23'),('Dimpul','5555555','Contoh Customer','Batams',NULL,NULL,200.00,1,2,'2021-10-31 08:45:37',1,'2021-11-02 07:36:21'),('e15de820-3a08-11ec-80fc-87e9de7a02eb','085834246342','dimpulssss','Batam',NULL,NULL,0.00,0,1,'2021-10-31 12:12:03',1,'2021-11-02 06:42:28');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_inden_history`
--

DROP TABLE IF EXISTS `customer_inden_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_inden_history` (
  `uuid_inden_history` varchar(50) NOT NULL,
  `uuid_customer` varchar(50) NOT NULL,
  `total` float(12,2) DEFAULT 0.00,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid_inden_history`),
  KEY `customer_inden_history_FK` (`uuid_customer`),
  CONSTRAINT `customer_inden_history_FK` FOREIGN KEY (`uuid_customer`) REFERENCES `customer` (`uuid_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_inden_history`
--

LOCK TABLES `customer_inden_history` WRITE;
/*!40000 ALTER TABLE `customer_inden_history` DISABLE KEYS */;
INSERT INTO `customer_inden_history` VALUES ('0b4e286c-30ed-4ebe-8e97-292a4f5b6860','Dimpul',4000.00,'test Mengubah data inden menjadi 4,000',2,'2021-10-31 08:53:44',2,'2021-10-31 08:53:44'),('123','Dimpul',10000.00,'test Mengubah data inden menjadi 10,000',2,'2021-10-31 08:53:19',2,'2021-10-31 08:53:19'),('12323','Dimpul',10000.00,'test Mengubah data inden menjadi 10,000',2,'2021-10-31 08:53:19',2,'2021-10-31 08:53:19'),('4456e86a-c356-438c-8c1e-2d60ce985f40','Dimpul',4000.00,'test Mengubah data inden menjadi 4,000',2,'2021-11-02 07:26:03',2,'2021-11-02 07:26:03'),('898eb225-753b-4d50-b608-04cb91439d05','Dimpul',700000.00,'dimpul Mengubah data inden menjadi 700,000',1,'2021-11-02 07:35:59',1,'2021-11-02 07:35:59'),('9247a408-ae1c-4452-9a21-ced4728b6991','Dimpul',700000.00,'dimpul Mengubah data inden menjadi 700,000',1,'2021-11-02 07:35:19',1,'2021-11-02 07:35:19'),('99ea4e6c-63d3-4cd7-8250-440bf4ff3d5e','Dimpul',99999.00,'test Mengubah data inden menjadi 99,999',2,'2021-11-02 07:26:26',2,'2021-11-02 07:26:26'),('b1d1840f-929e-4718-890c-43e9f4fae7b4','Dimpul',5000.00,'test Mengubah data inden menjadi 5,000',2,'2021-10-31 08:53:38',2,'2021-10-31 08:53:38'),('bc64f369-e91c-4aa2-b010-9079093fdbec','Dimpul',10000.00,'test Mengubah data inden menjadi 10,000',2,'2021-10-31 08:53:19',2,'2021-10-31 08:53:19'),('c952f5fb-261b-4426-b906-b32bc581e8d4','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',20000.00,'dimpul Mengubah data inden menjadi 20,000',1,'2021-11-02 07:31:29',1,'2021-11-02 07:31:29'),('fb31835e-0cc5-4473-8b94-9c29aae06c0d','Dimpul',200.00,'dimpul Mengubah data inden menjadi 200',1,'2021-11-02 07:36:21',1,'2021-11-02 07:36:21'),('fde13ac4-653f-4854-910f-d591fc5d02ed','Dimpul',200.00,'dimpul Mengubah data inden menjadi 200',1,'2021-11-02 07:36:11',1,'2021-11-02 07:36:11');
/*!40000 ALTER TABLE `customer_inden_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hak_akses`
--

DROP TABLE IF EXISTS `hak_akses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hak_akses` (
  `id_hak_akses` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_user` int(11) NOT NULL,
  `id_modul` varchar(50) NOT NULL,
  `activity` varchar(200) DEFAULT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_hak_akses`),
  KEY `id_jenis_user` (`id_jenis_user`),
  KEY `id_modul` (`id_modul`),
  CONSTRAINT `hak_akses_ibfk_1` FOREIGN KEY (`id_jenis_user`) REFERENCES `jenis_user` (`id_jenis_user`),
  CONSTRAINT `hak_akses_ibfk_2` FOREIGN KEY (`id_modul`) REFERENCES `modul` (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hak_akses`
--

LOCK TABLES `hak_akses` WRITE;
/*!40000 ALTER TABLE `hak_akses` DISABLE KEYS */;
INSERT INTO `hak_akses` VALUES (1,1,'mod_laundry',NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `hak_akses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_laundry`
--

DROP TABLE IF EXISTS `jenis_laundry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_laundry` (
  `id_jenis_laundry` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_laundry` varchar(50) NOT NULL,
  `uom` varchar(10) NOT NULL,
  `harga_per_uom` int(11) NOT NULL,
  `additional_group` varchar(50) DEFAULT NULL,
  `status_order_array` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_jenis_laundry`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_laundry`
--

LOCK TABLES `jenis_laundry` WRITE;
/*!40000 ALTER TABLE `jenis_laundry` DISABLE KEYS */;
INSERT INTO `jenis_laundry` VALUES (23,'Cuci Kering','ks',4500,NULL,'[2,3,5]',0,1,'2021-10-29 03:13:03',1,'2021-11-02 06:35:08'),(24,'Cuci Kering Setrika','kg',6500,NULL,'[2,3,4,5]',1,1,'2021-10-29 03:13:46',1,'2021-10-29 03:13:46'),(27,'Cuci Keringssssssss','ksssss',45000000,NULL,'[2,3,4,5]',0,1,'2021-10-29 05:49:28',1,'2021-10-29 06:01:26'),(28,'Dimpul','kg',90000,NULL,'[2,5]',0,1,'2021-10-29 06:01:38',1,'2021-10-29 06:02:16'),(29,'Setrika','kg',4500,NULL,'[4,5]',1,1,'2021-12-03 23:40:44',1,'2021-12-03 23:40:54'),(30,'Cuci Kering','kg',3500,NULL,'[2,3]',1,1,'2021-12-03 23:41:24',1,'2021-12-03 23:41:24'),(31,'test','kg',20000,NULL,'[2]',1,2,'2022-01-08 20:32:58',2,'2022-01-08 20:32:58'),(32,'testing','kg',5000,NULL,'[2,3,5]',1,1,'2022-01-22 15:44:55',1,'2022-01-22 15:44:55');
/*!40000 ALTER TABLE `jenis_laundry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_user`
--

DROP TABLE IF EXISTS `jenis_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_user` (
  `id_jenis_user` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_user` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_jenis_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_user`
--

LOCK TABLES `jenis_user` WRITE;
/*!40000 ALTER TABLE `jenis_user` DISABLE KEYS */;
INSERT INTO `jenis_user` VALUES (1,'Root',1,0,NULL,0,NULL),(2,'Admin',1,0,NULL,0,NULL),(3,'Karyawan',1,0,NULL,0,NULL);
/*!40000 ALTER TABLE `jenis_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundry`
--

DROP TABLE IF EXISTS `laundry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laundry` (
  `uuid_laundry` varchar(50) NOT NULL,
  `uuid_customer` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `tanggal_masuk` datetime DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
  `tanggal_lunas` datetime DEFAULT NULL,
  `status_bayar` tinyint(1) DEFAULT 9,
  `status_laundry` tinyint(1) DEFAULT 6,
  `is_active` tinyint(1) DEFAULT 1,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid_laundry`),
  KEY `laundry_FK` (`uuid_customer`),
  CONSTRAINT `laundry_FK` FOREIGN KEY (`uuid_customer`) REFERENCES `customer` (`uuid_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundry`
--

LOCK TABLES `laundry` WRITE;
/*!40000 ALTER TABLE `laundry` DISABLE KEYS */;
INSERT INTO `laundry` VALUES ('263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',1,'2022-04-01 20:38:00',NULL,'2022-04-09 21:13:00',10,7,0,1,'2022-04-09 20:37:19',1,'2022-04-12 20:50:40'),('438900e0-ba68-11ec-8e52-af973d5f0dac','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',4,'2022-04-12 20:55:00',NULL,NULL,10,7,0,1,'2022-04-12 20:56:50',1,'2022-04-12 20:58:20'),('5650c8b0-ba69-11ec-8e52-af973d5f0dac','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',8,'2022-04-12 21:03:00',NULL,'2022-04-12 21:03:00',10,0,1,1,'2022-04-12 21:03:48',1,'2022-04-12 21:03:48'),('6bdc72d0-ba67-11ec-8e52-af973d5f0dac','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',2,'2022-04-12 20:49:00',NULL,NULL,10,7,0,1,'2022-04-12 20:50:09',1,'2022-04-12 20:55:47'),('8d319f00-ba67-11ec-8e52-af973d5f0dac','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',3,'2022-04-12 20:50:00',NULL,NULL,10,7,0,1,'2022-04-12 20:51:02',1,'2022-04-12 20:55:43'),('9f3db7f0-ba68-11ec-8e52-af973d5f0dac','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',5,'2022-04-12 20:58:00',NULL,NULL,10,7,0,1,'2022-04-12 20:58:38',1,'2022-04-12 20:59:27'),('c7787c50-ba68-11ec-8e52-af973d5f0dac','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22',6,'2022-04-12 20:59:00',NULL,NULL,9,7,0,1,'2022-04-12 20:59:49',1,'2022-04-12 21:03:28'),('d7dfdb60-ba68-11ec-8e52-af973d5f0dac','Dimpul',7,'2022-04-12 21:00:00',NULL,'2022-04-12 09:00:00',10,7,0,1,'2022-04-12 21:00:14',1,'2022-04-12 21:03:23');
/*!40000 ALTER TABLE `laundry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundry_history`
--

DROP TABLE IF EXISTS `laundry_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laundry_history` (
  `uuid_laundry_history` varchar(50) NOT NULL,
  `uuid_laundry` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT NULL,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid_laundry_history`),
  KEY `laundry_history_FK` (`uuid_laundry`),
  CONSTRAINT `laundry_history_FK` FOREIGN KEY (`uuid_laundry`) REFERENCES `laundry` (`uuid_laundry`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundry_history`
--

LOCK TABLES `laundry_history` WRITE;
/*!40000 ALTER TABLE `laundry_history` DISABLE KEYS */;
INSERT INTO `laundry_history` VALUES ('08007467-0d46-4395-b470-6fd791e4a970','d7dfdb60-ba68-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 21:00:14',1,'2022-04-12 21:00:14'),('0d45e407-080e-4519-8736-0f894271b461','8d319f00-ba67-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 20:51:02',1,'2022-04-12 20:51:02'),('272abf32-8b74-4acc-ae7b-c6707cbc6f8c','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:45:23',1,'2022-04-09 20:45:23'),('41b88988-e6ee-47da-915d-b01f00660c85','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:38:04',1,'2022-04-09 20:38:04'),('49654d81-9fae-407a-9f39-c4e1a149cc49','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:44:44',1,'2022-04-09 20:44:44'),('4a580a9b-ad17-477b-a4de-095ceb447bb6','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:37:45',1,'2022-04-09 20:37:45'),('4b598f7e-c1e4-42fb-9727-ba94980175db','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:44:01',1,'2022-04-09 20:44:01'),('4b5b8fc3-2991-4659-97e4-3d5ad1d5bda0','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 21:06:17',1,'2022-04-09 21:06:17'),('4fdf70e9-9281-42b3-af5b-84090f528a35','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:45:04',1,'2022-04-09 20:45:04'),('535a6b56-1b4d-4188-a7b6-c42bc0b49e25','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:42:58',1,'2022-04-09 20:42:58'),('552acf1b-5b96-4368-8d49-e94e06d2c1ab','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Laundry Berhasil Dihapus',1,'2022-04-12 20:50:40',1,'2022-04-12 20:50:40'),('5d2e11e4-46ed-4844-9cae-4e0170a2b86c','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Laundry Baru Telah Ditambahkan',1,'2022-04-09 20:37:19',1,'2022-04-09 20:37:19'),('5d3408a3-daf0-4c86-8ba3-f9d2e3d36fd3','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 21:01:41',1,'2022-04-09 21:01:41'),('60cb6ba7-b834-4ae3-ac16-6c20febe605f','438900e0-ba68-11ec-8e52-af973d5f0dac','Laundry Berhasil Dihapus',1,'2022-04-12 20:58:20',1,'2022-04-12 20:58:20'),('62d9116c-ed70-4f42-9e40-b366b1f4ed37','9f3db7f0-ba68-11ec-8e52-af973d5f0dac','Laundry Berhasil Dihapus',1,'2022-04-12 20:59:27',1,'2022-04-12 20:59:27'),('6fa1e03c-2c23-4c1c-a7eb-17ddf7b90fbb','c7787c50-ba68-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 20:59:49',1,'2022-04-12 20:59:49'),('70f5b9a1-35d9-428b-b659-bb0a8706bce1','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 21:13:02',1,'2022-04-09 21:13:02'),('8ebdf681-eced-407a-a878-f0987b1bd39f','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:50:29',1,'2022-04-09 20:50:29'),('982307c1-3d4c-4c70-b4c0-0a21ac7cf5c5','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:45:46',1,'2022-04-09 20:45:46'),('a6a9989d-1b0f-45b8-ac6f-8581de720c4c','6bdc72d0-ba67-11ec-8e52-af973d5f0dac','Laundry Berhasil Dihapus',1,'2022-04-12 20:55:47',1,'2022-04-12 20:55:47'),('aeccf754-395f-4c08-928c-3cdb5a599731','6bdc72d0-ba67-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 20:50:09',1,'2022-04-12 20:50:09'),('b5d66a8a-59ae-4cdc-9d10-6a2692bf1d7f','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 21:11:32',1,'2022-04-09 21:11:32'),('b61e775f-509a-4676-b670-a44b6374733d','d7dfdb60-ba68-11ec-8e52-af973d5f0dac','Laundry Berhasil Dihapus',1,'2022-04-12 21:03:23',1,'2022-04-12 21:03:23'),('b7d0914f-9052-4a03-a51b-133ad1789dda','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:49:56',1,'2022-04-09 20:49:56'),('cd144cd6-8b5f-4cd4-aa9f-d8bddefbc7a1','438900e0-ba68-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 20:56:50',1,'2022-04-12 20:56:50'),('dc8b0e66-b676-4792-8184-b23bdcf678b0','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 21:12:03',1,'2022-04-09 21:12:03'),('de2dffd4-9b13-497b-aa3c-be539db0cd51','8d319f00-ba67-11ec-8e52-af973d5f0dac','Laundry Berhasil Dihapus',1,'2022-04-12 20:55:43',1,'2022-04-12 20:55:43'),('e3ffab04-d20d-4421-93c1-c0d55332ba04','9f3db7f0-ba68-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 20:58:38',1,'2022-04-12 20:58:38'),('e5a9db59-d33a-4de4-bc36-0849a60a5162','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:37:30',1,'2022-04-09 20:37:30'),('eab62e11-2244-4cc4-8db8-a20baa32fef8','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9','Detail Laundry Berhasil Diubah',1,'2022-04-09 20:42:47',1,'2022-04-09 20:42:47'),('f285aa4f-b1b2-4ef6-8270-cd201b0ddcb6','5650c8b0-ba69-11ec-8e52-af973d5f0dac','Laundry Baru Telah Ditambahkan',1,'2022-04-12 21:03:48',1,'2022-04-12 21:03:48'),('f6ee50ea-6d33-4900-942d-d2e9e810ad37','c7787c50-ba68-11ec-8e52-af973d5f0dac','Laundry Berhasil Dihapus',1,'2022-04-12 21:03:28',1,'2022-04-12 21:03:28');
/*!40000 ALTER TABLE `laundry_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (16,'2016_06_01_000001_create_oauth_auth_codes_table',1),(17,'2016_06_01_000002_create_oauth_access_tokens_table',1),(18,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(19,'2016_06_01_000004_create_oauth_clients_table',1),(20,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modul` (
  `id_modul` varchar(50) NOT NULL,
  `nama_modul` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
INSERT INTO `modul` VALUES ('mod_laundry','Modul Laundry',0,NULL,0,NULL);
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passport`
--

DROP TABLE IF EXISTS `passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passport` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passport` varchar(100) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passport`
--

LOCK TABLES `passport` WRITE;
/*!40000 ALTER TABLE `passport` DISABLE KEYS */;
INSERT INTO `passport` VALUES (1,'dimpul','$2y$10$c5hzqQY3KlBrA5DTe1ivvOEjyWBgfpU5ycizY1BkREdbWnAnjq7Oi','2022-04-15 22:00:27','2022-04-16 22:00:27'),(2,'test','$2y$10$RtjITTvUqwUviRj1glE2.eR6n9BsrOjTx6JyB0ltQUIB4UNBfvK0y','2022-04-16 04:10:55','2022-04-17 04:10:55'),(32,'dicky','$2y$10$ZESmBrItSxT2BcWkOewJI.7xKXBbRbLG2hdM3aZbauwt/WEvAUFL6','2021-10-24 19:47:26','2021-10-28 09:20:58');
/*!40000 ALTER TABLE `passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(50) NOT NULL,
  `icon_material` varchar(50) DEFAULT NULL,
  `icon_image` varchar(50) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (0,'Tersedia',NULL,NULL,'global',1,0,NULL,0,NULL),(1,'Selesai',NULL,NULL,'task_status',1,0,NULL,0,NULL),(2,'Cuci',NULL,NULL,'task_status',1,0,NULL,0,NULL),(3,'Jemur',NULL,NULL,'task_status',1,0,NULL,0,NULL),(4,'Setrika',NULL,NULL,'task_status',1,0,NULL,0,NULL),(5,'Packing',NULL,NULL,'task_status',1,0,NULL,0,NULL),(7,'Selesai',NULL,NULL,'laundry_status',1,0,NULL,0,NULL),(9,'Belum Lunas',NULL,NULL,'transasksi_status',1,0,NULL,0,NULL),(10,'Lunas',NULL,NULL,'transasksi_status',1,0,NULL,0,NULL);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid_task`),
  KEY `task_FK` (`id_jenis_laundry`),
  KEY `task_FK_1` (`uuid_laundry`),
  CONSTRAINT `task_FK` FOREIGN KEY (`id_jenis_laundry`) REFERENCES `jenis_laundry` (`id_jenis_laundry`) ON UPDATE CASCADE,
  CONSTRAINT `task_FK_1` FOREIGN KEY (`uuid_laundry`) REFERENCES `laundry` (`uuid_laundry`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('02bedd40-bbf4-11ec-b587-a9859057776c','5650c8b0-ba69-11ec-8e52-af973d5f0dac',29,1,2.00,'kg',4500.00,9000.00,4,1,1,'2022-04-14 20:08:46',1,'2022-04-15 20:54:53'),('2b0d5300-b80a-11ec-8faf-f75ae94cd7c9','263ba6b0-b80a-11ec-8faf-f75ae94cd7c9',30,0,2.00,'kg',3500.00,7000.00,0,0,1,'2022-04-09 20:37:19',1,'2022-04-09 20:37:19'),('5c82c850-ba69-11ec-8e52-af973d5f0dac','5650c8b0-ba69-11ec-8e52-af973d5f0dac',24,1,6.00,'kg',6500.00,39000.00,1,1,1,'2022-04-12 21:03:48',1,'2022-04-15 20:58:43'),('629b1ae0-ba68-11ec-8e52-af973d5f0dac','438900e0-ba68-11ec-8e52-af973d5f0dac',24,0,3.00,'kg',6500.00,19500.00,0,0,1,'2022-04-12 20:56:50',1,'2022-04-12 20:56:50'),('725a96a0-ba67-11ec-8e52-af973d5f0dac','6bdc72d0-ba67-11ec-8e52-af973d5f0dac',24,0,2.00,'kg',6500.00,13000.00,0,0,1,'2022-04-12 20:50:09',1,'2022-04-12 20:50:09'),('93e74d90-ba67-11ec-8e52-af973d5f0dac','8d319f00-ba67-11ec-8e52-af973d5f0dac',24,0,2.00,'kg',6500.00,13000.00,0,0,1,'2022-04-12 20:51:02',1,'2022-04-12 20:51:02'),('a541f0d0-ba68-11ec-8e52-af973d5f0dac','9f3db7f0-ba68-11ec-8e52-af973d5f0dac',30,0,2.00,'kg',3500.00,7000.00,0,0,1,'2022-04-12 20:58:38',1,'2022-04-12 20:58:38'),('cf14e160-ba68-11ec-8e52-af973d5f0dac','c7787c50-ba68-11ec-8e52-af973d5f0dac',24,0,5.00,'kg',6500.00,32500.00,0,0,1,'2022-04-12 20:59:49',1,'2022-04-12 20:59:49'),('dcf34ba0-ba68-11ec-8e52-af973d5f0dac','d7dfdb60-ba68-11ec-8e52-af973d5f0dac',24,0,20.00,'kg',6500.00,130000.00,0,0,1,'2022-04-12 21:00:14',1,'2022-04-12 21:00:14');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER updateStatusLaundry_onInsert
AFTER insert
ON task FOR EACH row
begin 
	 call setStatusLaundry(new.uuid_laundry);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER updateStatusLaundry_onUpdate
AFTER update
ON task FOR EACH row
begin 
	 call setStatusLaundry(new.uuid_laundry);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER updateStatusLaundry_onDelete
AFTER delete
ON task FOR EACH row
begin 
	 call setStatusLaundry(old.uuid_laundry);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `task_history`
--

DROP TABLE IF EXISTS `task_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_history` (
  `uuid_task_history` varchar(50) NOT NULL,
  `uuid_task` varchar(50) NOT NULL,
  `status_from` int(11) DEFAULT 0,
  `status_to` int(11) DEFAULT 0,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid_task_history`),
  KEY `task_history_FK` (`uuid_task`),
  CONSTRAINT `task_history_FK` FOREIGN KEY (`uuid_task`) REFERENCES `task` (`uuid_task`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_history`
--

LOCK TABLES `task_history` WRITE;
/*!40000 ALTER TABLE `task_history` DISABLE KEYS */;
INSERT INTO `task_history` VALUES ('0179a139-1dd6-4575-bc13-6b4461bee271','5c82c850-ba69-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 21:03:48',1,'2022-04-12 21:03:48'),('08094747-2aa3-40b7-ba7c-62bf5c5f2b2f','725a96a0-ba67-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 20:50:09',1,'2022-04-12 20:50:09'),('13fbfb78-f2c4-418d-9d1a-9ffa5ec35536','2b0d5300-b80a-11ec-8faf-f75ae94cd7c9',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-09 20:37:19',1,'2022-04-09 20:37:19'),('234c3e7c-cf58-42a0-97f2-edc7ff241939','93e74d90-ba67-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 20:51:02',1,'2022-04-12 20:51:02'),('4718e908-b434-48b7-97a0-1bf03234f00b','02bedd40-bbf4-11ec-b587-a9859057776c',1,2,'Update status dari \'Selesai\' ke \'Cuci\'',1,'2022-04-15 20:26:35',1,'2022-04-15 20:26:35'),('61d3cb4d-71a0-4193-847c-b11add6e41b4','5c82c850-ba69-11ec-8e52-af973d5f0dac',1,1,'Handover task ke dimpul',1,'2022-04-15 20:12:32',1,'2022-04-15 20:12:32'),('674a4e67-4475-4a2d-8bfa-71ead4a6a62b','02bedd40-bbf4-11ec-b587-a9859057776c',2,2,'Handover task ke dimpul',1,'2022-04-15 20:54:53',1,'2022-04-15 20:54:53'),('7a51875d-18c2-4c2d-a072-31ea4efdf36b','5c82c850-ba69-11ec-8e52-af973d5f0dac',3,1,'Update status dari \'Jemur\' ke \'Selesai\'',1,'2022-04-15 20:58:43',1,'2022-04-15 20:58:43'),('8823add9-849e-4a22-904c-ce7adff4c4e3','02bedd40-bbf4-11ec-b587-a9859057776c',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-14 20:08:46',1,'2022-04-14 20:08:46'),('aa8991c3-9057-4578-adca-27b5ce8ddcf2','5c82c850-ba69-11ec-8e52-af973d5f0dac',1,2,'Update status dari \'Selesai\' ke \'Cuci\'',1,'2022-04-14 20:16:44',1,'2022-04-14 20:16:44'),('af3c5b2f-b9bf-4499-844f-3b06faaf4aa7','dcf34ba0-ba68-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 21:00:14',1,'2022-04-12 21:00:14'),('be356db5-e5c0-4554-bc73-1a0588c8c215','5c82c850-ba69-11ec-8e52-af973d5f0dac',0,1,'Update status dari \'Tersedia\' ke \'Selesai\'',1,'2022-04-14 20:15:36',1,'2022-04-14 20:15:36'),('c2d4ee8b-f6d0-4445-bafc-e7953707b381','cf14e160-ba68-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 20:59:49',1,'2022-04-12 20:59:49'),('c921974e-a1bc-4bef-96dc-0be8a68ed601','629b1ae0-ba68-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 20:56:50',1,'2022-04-12 20:56:50'),('dd8bcd98-dc43-4ce1-be80-4cc1c009583b','5c82c850-ba69-11ec-8e52-af973d5f0dac',2,1,'Update status dari \'Cuci\' ke \'Selesai\'',1,'2022-04-14 20:16:57',1,'2022-04-14 20:16:57'),('ea2c7bae-205d-432e-bdd1-9d5e89639402','5c82c850-ba69-11ec-8e52-af973d5f0dac',1,3,'Update status dari \'Selesai\' ke \'Jemur\'',1,'2022-04-15 20:12:34',1,'2022-04-15 20:12:34'),('f422dd5d-4c39-4d6e-8504-4197f6ef3137','02bedd40-bbf4-11ec-b587-a9859057776c',0,1,'Update status dari \'Tersedia\' ke \'Selesai\'',1,'2022-04-14 20:15:16',1,'2022-04-14 20:15:16'),('f588c345-b956-4c74-b5dc-709f7ce7d45e','a541f0d0-ba68-11ec-8e52-af973d5f0dac',NULL,0,'List Cucian Telah Ditambahkan',1,'2022-04-12 20:58:38',1,'2022-04-12 20:58:38');
/*!40000 ALTER TABLE `task_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi_tambahan`
--

DROP TABLE IF EXISTS `transaksi_tambahan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi_tambahan` (
  `uuid` varchar(50) NOT NULL,
  `type` enum('in','out') DEFAULT NULL,
  `jumlah` decimal(12,2) DEFAULT 0.00,
  `tanggal_transaksi` datetime NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `insert_by` int(11) NOT NULL,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi_tambahan`
--

LOCK TABLES `transaksi_tambahan` WRITE;
/*!40000 ALTER TABLE `transaksi_tambahan` DISABLE KEYS */;
INSERT INTO `transaksi_tambahan` VALUES ('154f3a20-b7ff-11ec-a7ff-cf620dc5526e','in',200000.00,'2022-04-09 00:00:00','well',0,1,'2022-04-09 19:18:03',1,'2022-04-09 19:18:03'),('173686d0-ba67-11ec-b621-89cd9c521458','out',1000.00,'2022-04-12 00:00:00','jajan dicky',1,1,'2022-04-12 20:47:37',1,'2022-04-12 20:47:37'),('604e52e0-9ca7-11ec-a3de-d599b2d8bae9','in',1000000.00,'2022-03-06 00:00:00','dari invest orang baik',0,1,'2022-03-06 00:12:22',1,'2022-03-06 00:12:22'),('6ddacc90-9ca7-11ec-a3de-d599b2d8bae9','out',50000.00,'2022-03-06 00:00:00','bayar parfum',0,1,'2022-03-06 00:12:43',1,'2022-03-06 00:12:43'),('7bae8870-9ca7-11ec-a3de-d599b2d8bae9','out',500000.00,'2022-02-01 00:00:00','bayar rumah',0,1,'2022-03-06 00:13:04',1,'2022-03-06 00:13:04'),('8bf4c420-ba65-11ec-befd-8517ad3e4bcf','in',2000.00,'2022-04-04 00:00:00','Beli Permen',1,1,'2022-04-12 20:36:43',1,'2022-04-12 20:37:48'),('95b621a0-b66b-11ec-adf8-b595595b568a','out',5000000.00,'2022-04-07 00:00:00','dimasss',0,1,'2022-04-07 19:09:42',1,'2022-04-09 19:36:03'),('a2069060-b801-11ec-b29d-e702da3d0df6','in',55.00,'2022-04-09 00:00:00','ff',0,1,'2022-04-09 19:36:14',1,'2022-04-09 19:36:14'),('a6f365d0-b801-11ec-b29d-e702da3d0df6','out',55.00,'2022-04-18 00:00:00','cc',0,1,'2022-04-09 19:36:23',1,'2022-04-09 19:36:23'),('acb8c0f0-b801-11ec-b29d-e702da3d0df6','out',200000.00,'2022-04-09 00:00:00','rff',0,1,'2022-04-09 19:36:34',1,'2022-04-09 19:36:34'),('b2a29400-b801-11ec-b29d-e702da3d0df6','in',888.00,'2022-04-09 00:00:00','zzx',0,1,'2022-04-09 19:36:46',1,'2022-04-09 19:36:46'),('b9c89090-b801-11ec-b29d-e702da3d0df6','in',888.00,'2022-04-09 00:00:00','xxx',0,1,'2022-04-09 19:36:57',1,'2022-04-09 19:36:57');
/*!40000 ALTER TABLE `transaksi_tambahan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_un` (`username`),
  KEY `id_jenis_user` (`id_jenis_user`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_jenis_user`) REFERENCES `jenis_user` (`id_jenis_user`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,1,'SYSTEM','SYSTEM',1,0,NULL,0,NULL),(1,2,'dimpul','$2y$10$9dOXGOEjojrR/929QhB48.qA1Eawlp/xQWbb8n637yPtrm6RBaKTW',1,0,NULL,2,'2022-01-08 20:31:05'),(2,3,'test','$2y$10$PcVk5Jhv//qSclEhig4wIOqb1ApzHcA2kNrabdBkJYBoZor1dmNzK',1,0,NULL,1,'2022-04-15 21:51:59'),(45,1,'dimpulssss2ss','$2y$10$XXRMTbn5ix9qTw7K.efc4.SwOPm0N3rVvQtU4bhiQ0DXhoi3XUrLW',1,2,'2022-01-08 20:30:39',2,'2022-01-08 20:30:39');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_keuangan_report`
--

DROP TABLE IF EXISTS `view_keuangan_report`;
/*!50001 DROP VIEW IF EXISTS `view_keuangan_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_keuangan_report` (
  `jenis` tinyint NOT NULL,
  `tipe` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `keterangan` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `tanggal_transaksi` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_laundry`
--

DROP TABLE IF EXISTS `view_laundry`;
/*!50001 DROP VIEW IF EXISTS `view_laundry`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_laundry` (
  `id` tinyint NOT NULL,
  `uuid_laundry` tinyint NOT NULL,
  `uuid_customer` tinyint NOT NULL,
  `nama_customer` tinyint NOT NULL,
  `alamat` tinyint NOT NULL,
  `no_telp` tinyint NOT NULL,
  `tanggal_masuk` tinyint NOT NULL,
  `tanggal_keluar` tinyint NOT NULL,
  `tanggal_lunas` tinyint NOT NULL,
  `status_bayar` tinyint NOT NULL,
  `status_laundry` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `insert_at` tinyint NOT NULL,
  `update_at` tinyint NOT NULL,
  `update_by` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_laundry_report`
--

DROP TABLE IF EXISTS `view_laundry_report`;
/*!50001 DROP VIEW IF EXISTS `view_laundry_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_laundry_report` (
  `id` tinyint NOT NULL,
  `uuid_laundry` tinyint NOT NULL,
  `uuid_customer` tinyint NOT NULL,
  `nama_customer` tinyint NOT NULL,
  `tanggal_masuk` tinyint NOT NULL,
  `tanggal_keluar` tinyint NOT NULL,
  `tanggal_lunas` tinyint NOT NULL,
  `status_bayar` tinyint NOT NULL,
  `status_laundry` tinyint NOT NULL,
  `jenis_laundry` tinyint NOT NULL,
  `jumlah` tinyint NOT NULL,
  `uom` tinyint NOT NULL,
  `harga` tinyint NOT NULL,
  `total_harga` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `update_at` tinyint NOT NULL,
  `update_by` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_task`
--

DROP TABLE IF EXISTS `view_task`;
/*!50001 DROP VIEW IF EXISTS `view_task`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_task` (
  `uuid_task` tinyint NOT NULL,
  `uuid_laundry` tinyint NOT NULL,
  `nama` tinyint NOT NULL,
  `jenis_laundry` tinyint NOT NULL,
  `id_jenis_laundry` tinyint NOT NULL,
  `jumlah` tinyint NOT NULL,
  `uom` tinyint NOT NULL,
  `harga` tinyint NOT NULL,
  `total_harga` tinyint NOT NULL,
  `tanggal_masuk` tinyint NOT NULL,
  `tanggal_keluar` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `status_id` tinyint NOT NULL,
  `handle_by` tinyint NOT NULL,
  `handle_by_id` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `update_at` tinyint NOT NULL,
  `update_by` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wa_message`
--

DROP TABLE IF EXISTS `wa_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wa_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wa_message`
--

LOCK TABLES `wa_message` WRITE;
/*!40000 ALTER TABLE `wa_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `wa_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifi`
--

DROP TABLE IF EXISTS `wifi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifi` (
  `BSSID` varchar(100) NOT NULL,
  `SSID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BSSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifi`
--

LOCK TABLES `wifi` WRITE;
/*!40000 ALTER TABLE `wifi` DISABLE KEYS */;
INSERT INTO `wifi` VALUES ('02:00:00:00:00:00','EJJI COFFEE');
/*!40000 ALTER TABLE `wifi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_laundry'
--
/*!50003 DROP PROCEDURE IF EXISTS `setStatusLaundry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `setStatusLaundry`(IN xuuid_laundry VARCHAR(100))
BEGIN

DECLARE total_task,task_completed,new_status INT;







    select (select count(uuid_task) from task where uuid_laundry=xuuid_laundry and is_active=1) as total_task , 



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

	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_keuangan_report`
--

/*!50001 DROP TABLE IF EXISTS `view_keuangan_report`*/;
/*!50001 DROP VIEW IF EXISTS `view_keuangan_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_keuangan_report` AS (select 'laundry' AS `jenis`,'in' AS `tipe`,`view_laundry_report`.`uuid_laundry` AS `id`,concat(`view_laundry_report`.`nama_customer`,'\n',`view_laundry_report`.`jenis_laundry`,'\n',`view_laundry_report`.`jumlah`,`view_laundry_report`.`uom`) AS `keterangan`,`view_laundry_report`.`total_harga` AS `total`,`view_laundry_report`.`tanggal_lunas` AS `tanggal_transaksi` from `view_laundry_report`) union (select 'transaksi_tambahan' AS `jenis`,`transaksi_tambahan`.`type` AS `tipe`,`transaksi_tambahan`.`uuid` AS `id`,`transaksi_tambahan`.`keterangan` AS `keterangan`,`transaksi_tambahan`.`jumlah` AS `total`,`transaksi_tambahan`.`tanggal_transaksi` AS `tanggal_transaksi` from `transaksi_tambahan`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_laundry`
--

/*!50001 DROP TABLE IF EXISTS `view_laundry`*/;
/*!50001 DROP VIEW IF EXISTS `view_laundry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_laundry` AS select `l`.`id` AS `id`,`l`.`uuid_laundry` AS `uuid_laundry`,`c`.`uuid_customer` AS `uuid_customer`,`c`.`nama` AS `nama_customer`,`c`.`alamat` AS `alamat`,`c`.`no_telp` AS `no_telp`,`l`.`tanggal_masuk` AS `tanggal_masuk`,`l`.`tanggal_keluar` AS `tanggal_keluar`,`l`.`tanggal_lunas` AS `tanggal_lunas`,`l`.`status_bayar` AS `status_bayar`,`l`.`status_laundry` AS `status_laundry`,sum(`t`.`total_harga`) AS `total`,`l`.`is_active` AS `is_active`,`l`.`insert_at` AS `insert_at`,`l`.`update_at` AS `update_at`,`l`.`update_by` AS `update_by` from ((`laundry` `l` join `customer` `c`) join `task` `t`) where `l`.`uuid_laundry` = `t`.`uuid_laundry` and `c`.`uuid_customer` = `l`.`uuid_customer` and `t`.`is_active` = 1 group by `l`.`id`,`l`.`uuid_laundry`,`c`.`uuid_customer`,`c`.`nama`,`c`.`alamat`,`c`.`no_telp`,`l`.`tanggal_masuk`,`l`.`tanggal_keluar`,`l`.`tanggal_lunas`,`l`.`status_bayar`,`l`.`status_laundry`,`l`.`is_active`,`l`.`insert_at`,`l`.`update_at`,`l`.`update_by` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_laundry_report`
--

/*!50001 DROP TABLE IF EXISTS `view_laundry_report`*/;
/*!50001 DROP VIEW IF EXISTS `view_laundry_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_laundry_report` AS select `l`.`id` AS `id`,`l`.`uuid_laundry` AS `uuid_laundry`,`c`.`uuid_customer` AS `uuid_customer`,`c`.`nama` AS `nama_customer`,`l`.`tanggal_masuk` AS `tanggal_masuk`,`l`.`tanggal_keluar` AS `tanggal_keluar`,`l`.`tanggal_lunas` AS `tanggal_lunas`,`l`.`status_bayar` AS `status_bayar`,`l`.`status_laundry` AS `status_laundry`,`jl`.`jenis_laundry` AS `jenis_laundry`,`t`.`jumlah` AS `jumlah`,`t`.`uom` AS `uom`,`t`.`harga` AS `harga`,`t`.`total_harga` AS `total_harga`,`l`.`is_active` AS `is_active`,`l`.`update_at` AS `update_at`,`l`.`update_by` AS `update_by` from (((`laundry` `l` join `customer` `c`) join `task` `t`) join `jenis_laundry` `jl`) where `l`.`uuid_laundry` = `t`.`uuid_laundry` and `c`.`uuid_customer` = `l`.`uuid_customer` and `t`.`id_jenis_laundry` = `jl`.`id_jenis_laundry` and `t`.`is_active` = 1 and `l`.`is_active` = 1 and `l`.`status_bayar` = 10 group by `l`.`id`,`l`.`uuid_laundry`,`c`.`uuid_customer`,`c`.`nama`,`l`.`tanggal_masuk`,`l`.`tanggal_keluar`,`l`.`tanggal_lunas`,`l`.`status_bayar`,`l`.`status_laundry`,`jl`.`jenis_laundry`,`t`.`jumlah`,`t`.`uom`,`t`.`harga`,`t`.`total_harga`,`l`.`is_active`,`l`.`update_at`,`l`.`update_by` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_task`
--

/*!50001 DROP TABLE IF EXISTS `view_task`*/;
/*!50001 DROP VIEW IF EXISTS `view_task`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_task` AS select `t`.`uuid_task` AS `uuid_task`,`t`.`uuid_laundry` AS `uuid_laundry`,`c`.`nama` AS `nama`,`j`.`jenis_laundry` AS `jenis_laundry`,`j`.`id_jenis_laundry` AS `id_jenis_laundry`,`t`.`jumlah` AS `jumlah`,`t`.`uom` AS `uom`,`t`.`harga` AS `harga`,`t`.`total_harga` AS `total_harga`,`l`.`tanggal_masuk` AS `tanggal_masuk`,`l`.`tanggal_keluar` AS `tanggal_keluar`,`s`.`keterangan` AS `status`,`t`.`status_task` AS `status_id`,if(`t`.`id_user` = 0,' - ',`u`.`username`) AS `handle_by`,`u`.`id_user` AS `handle_by_id`,`t`.`is_active` AS `is_active`,`t`.`update_at` AS `update_at`,`t`.`update_by` AS `update_by` from (((((`task` `t` join `customer` `c`) join `laundry` `l`) join `jenis_laundry` `j`) join `status` `s`) join `user` `u`) where `t`.`uuid_laundry` = `l`.`uuid_laundry` and `l`.`uuid_customer` = `c`.`uuid_customer` and `t`.`id_jenis_laundry` = `j`.`id_jenis_laundry` and `t`.`status_task` = `s`.`id_status` and `t`.`id_user` = `u`.`id_user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 18:31:46
