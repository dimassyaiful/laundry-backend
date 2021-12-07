-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: db_laundry
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_laundry`
--

LOCK TABLES `jenis_laundry` WRITE;
/*!40000 ALTER TABLE `jenis_laundry` DISABLE KEYS */;
INSERT INTO `jenis_laundry` VALUES (23,'Cuci Kering','ks',4500,NULL,'[2,3,5]',0,1,'2021-10-29 03:13:03',1,'2021-11-02 06:35:08'),(24,'Cuci Kering Setrika','kg',6500,NULL,'[2,3,4,5]',1,1,'2021-10-29 03:13:46',1,'2021-10-29 03:13:46'),(27,'Cuci Keringssssssss','ksssss',45000000,NULL,'[2,3,4,5]',0,1,'2021-10-29 05:49:28',1,'2021-10-29 06:01:26'),(28,'Dimpul','kg',90000,NULL,'[2,5]',0,1,'2021-10-29 06:01:38',1,'2021-10-29 06:02:16'),(29,'Setrika','kg',4500,NULL,'[4,5]',1,1,'2021-12-03 23:40:44',1,'2021-12-03 23:40:54'),(30,'Cuci Kering','kg',3500,NULL,'[2,3]',1,1,'2021-12-03 23:41:24',1,'2021-12-03 23:41:24');
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
  `tanggal_masuk` datetime DEFAULT NULL,
  `tanggal_keluar` datetime DEFAULT NULL,
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
INSERT INTO `laundry` VALUES ('18d549a0-5454-11ec-a282-13bc9d3832bb','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22','2021-12-03 23:14:00',NULL,9,0,1,1,'2021-12-03 23:14:57',1,'2021-12-03 23:14:57'),('c686e230-5453-11ec-a282-13bc9d3832bb','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22','2021-12-03 23:12:00',NULL,9,0,1,1,'2021-12-03 23:13:09',1,'2021-12-03 23:13:09'),('f71df5b0-5452-11ec-a282-13bc9d3832bb','60c0e0d0-3b6d-11ec-aac9-e7503e36ae22','2021-12-03 23:06:00',NULL,9,0,1,1,'2021-12-03 23:06:43',1,'2021-12-03 23:06:43'),('qwersstwys','65bb2c88-15c2-11ec-82a8-0242ac130003','2020-02-02 00:00:00',NULL,9,0,1,2,'2021-12-03 23:21:38',2,'2021-12-03 23:21:38'),('qwertys','65bb2c88-15c2-11ec-82a8-0242ac130003','2020-02-02 00:00:00',NULL,0,0,1,2,'2021-12-03 23:20:14',2,'2021-12-03 23:20:14');
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
INSERT INTO `laundry_history` VALUES ('0042d8e3-925c-4204-a69e-e28c28b5c7fd','f71df5b0-5452-11ec-a282-13bc9d3832bb','Laundry Baru Telah Ditambahkan',1,'2021-12-03 23:06:43',1,'2021-12-03 23:06:43'),('22193184-0b42-4370-b66e-a86af8b4863e','qwersstwys','Laundry Baru Telah Ditambahkan',2,'2021-12-03 23:21:38',2,'2021-12-03 23:21:38'),('4ed4ce85-0109-44fd-9dc0-fc1ad6b85f15','c686e230-5453-11ec-a282-13bc9d3832bb','Laundry Baru Telah Ditambahkan',1,'2021-12-03 23:13:09',1,'2021-12-03 23:13:09'),('5a2f3893-9b47-4c0e-82fd-4429b56bb773','18d549a0-5454-11ec-a282-13bc9d3832bb','Laundry Baru Telah Ditambahkan',1,'2021-12-03 23:14:57',1,'2021-12-03 23:14:57'),('cb11061e-0eb2-4869-929f-4199122242fe','qwertys','Laundry Baru Telah Ditambahkan',2,'2021-12-03 23:20:14',2,'2021-12-03 23:20:14');
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
INSERT INTO `passport` VALUES (1,'dimpul','$2y$10$.SEFhbqhofC8h9JPkr3QH.78HbmB68efZOF/jRl3oMi08f0CWBNIe','2021-12-07 13:31:50','2021-12-08 13:31:50'),(2,'test','$2y$10$2gx2fImdWeb4SFwSGwtY5O/cCLR5ToK6R5X8uiJuIlpoS23RmkYRi','2021-12-07 14:25:54','2021-12-08 14:25:54'),(32,'dicky','$2y$10$ZESmBrItSxT2BcWkOewJI.7xKXBbRbLG2hdM3aZbauwt/WEvAUFL6','2021-10-24 19:47:26','2021-10-28 09:20:58');
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
INSERT INTO `status` VALUES (0,'Tersedia',NULL,NULL,'task_status',1,0,NULL,0,NULL),(1,'Selesai',NULL,NULL,'task_status',1,0,NULL,0,NULL),(2,'Cuci',NULL,NULL,'task_status',1,0,NULL,0,NULL),(3,'Jemur',NULL,NULL,'task_status',1,0,NULL,0,NULL),(4,'Setrika',NULL,NULL,'task_status',1,0,NULL,0,NULL),(5,'Packing',NULL,NULL,'task_status',1,0,NULL,0,NULL),(6,'Dalam Proses',NULL,NULL,'laundry_status',1,0,NULL,0,NULL),(7,'Selesai',NULL,NULL,'laundry_status',1,0,NULL,0,NULL),(8,'Telah Diterima Customer',NULL,NULL,'laundry_status',1,0,NULL,0,NULL),(9,'Belum Lunas',NULL,NULL,'transasksi_status',1,0,NULL,0,NULL),(10,'Lunas',NULL,NULL,'transasksi_status',1,0,NULL,0,NULL);
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
INSERT INTO `task` VALUES ('20443610-5454-11ec-a282-13bc9d3832bb','18d549a0-5454-11ec-a282-13bc9d3832bb',24,0,2.00,'kg',6500.00,13000.00,0,1,1,'2021-12-03 23:14:57',1,'2021-12-03 23:14:57'),('cd074ff0-5453-11ec-a282-13bc9d3832bb','c686e230-5453-11ec-a282-13bc9d3832bb',24,0,2.00,'kg',6500.00,13000.00,0,1,1,'2021-12-03 23:13:09',1,'2021-12-03 23:13:09'),('fdaf5360-5452-11ec-a282-13bc9d3832bb','f71df5b0-5452-11ec-a282-13bc9d3832bb',24,0,2.00,'kg',6500.00,13000.00,0,1,1,'2021-12-03 23:06:43',1,'2021-12-03 23:06:43'),('qwersstwys','qwersstwys',24,0,2.00,'kg',20000.00,40000.00,0,1,2,'2021-12-03 23:21:38',2,'2021-12-03 23:21:38'),('qwertys','qwertys',24,0,2.00,'kg',20000.00,40000.00,0,1,2,'2021-12-03 23:20:14',2,'2021-12-03 23:20:14');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updateStatusLaundry_onInsert
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updateStatusLaundry_onUpdate
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updateStatusLaundry_onDelete
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
INSERT INTO `task_history` VALUES ('6b3c2fad-83d6-4f5a-a785-dec698dd109d','fdaf5360-5452-11ec-a282-13bc9d3832bb',NULL,6,'List Cucian Telah Ditambahkan',1,'2021-12-03 23:06:43',1,'2021-12-03 23:06:43'),('714a1672-9bae-4be8-a465-6d21fc4b1bd0','qwertys',NULL,0,'List Cucian Telah Ditambahkan',2,'2021-12-03 23:20:14',2,'2021-12-03 23:20:14'),('8596fd19-f7c4-48a6-aeba-888c4dc020ba','cd074ff0-5453-11ec-a282-13bc9d3832bb',NULL,6,'List Cucian Telah Ditambahkan',1,'2021-12-03 23:13:09',1,'2021-12-03 23:13:09'),('c57c4288-b9b7-4255-afd0-d0d181708372','20443610-5454-11ec-a282-13bc9d3832bb',NULL,6,'List Cucian Telah Ditambahkan',1,'2021-12-03 23:14:57',1,'2021-12-03 23:14:57'),('f92028d8-4524-4da9-89a4-a249cf08dc1e','qwersstwys',NULL,0,'List Cucian Telah Ditambahkan',2,'2021-12-03 23:21:38',2,'2021-12-03 23:21:38');
/*!40000 ALTER TABLE `task_history` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,1,'SYSTEM','SYSTEM',1,0,NULL,0,NULL),(1,2,'dimpul','$2y$10$xb6wBASRkcNuRICEP.3hk.8qAekVVfexpfqDgzm0vplYqK5bJd8vO',1,0,NULL,1,'2021-09-17 06:06:05'),(2,2,'test','$2y$10$xb6wBASRkcNuRICEP.3hk.8qAekVVfexpfqDgzm0vplYqK5bJd8vO',1,0,NULL,1,'2021-09-17 06:06:05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_laundry`
--

DROP TABLE IF EXISTS `view_laundry`;
/*!50001 DROP VIEW IF EXISTS `view_laundry`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_laundry` (
  `uuid_laundry` tinyint NOT NULL,
  `nama_customer` tinyint NOT NULL,
  `tanggal_masuk` tinyint NOT NULL,
  `tanggal_keluar` tinyint NOT NULL,
  `status_bayar` tinyint NOT NULL,
  `status_laundry` tinyint NOT NULL,
  `total` tinyint NOT NULL,
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
  `jumlah` tinyint NOT NULL,
  `uom` tinyint NOT NULL,
  `harga` tinyint NOT NULL,
  `total_harga` tinyint NOT NULL,
  `tanggal_masuk` tinyint NOT NULL,
  `tanggal_keluar` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `handle_by` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `update_at` tinyint NOT NULL,
  `update_by` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
CREATE DEFINER=`root`@`localhost` PROCEDURE `setStatusLaundry`(IN xuuid_laundry VARCHAR(100))
BEGIN
     DECLARE total_task,task_completed,new_status INT;

    select (select count(uuid_task) from task where uuid_laundry=xuuid_laundry) as total_task , 
    (select count(uuid_task) from task where uuid_laundry=xuuid_laundry and status_task=1) as total_completed
    into total_task, task_completed;
   	
   	# to debug variable SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = task_completed;
   	# Cek Apakah task selesai = total task, jika sama berarti status laundry jadi 1
   	IF (total_task = task_completed) THEN
    	set new_status = 1;
   	else
    	set new_status = 0;
  	END IF;
    
 	#update
   	update laundry set status_laundry=new_status where uuid_laundry = xuuid_laundry;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_laundry` AS select `l`.`uuid_laundry` AS `uuid_laundry`,`c`.`nama` AS `nama_customer`,`l`.`tanggal_masuk` AS `tanggal_masuk`,`l`.`tanggal_keluar` AS `tanggal_keluar`,`l`.`status_bayar` AS `status_bayar`,`l`.`status_laundry` AS `status_laundry`,sum(`t`.`total_harga`) AS `total`,`l`.`is_active` AS `is_active`,`l`.`update_at` AS `update_at`,`l`.`update_by` AS `update_by` from ((`laundry` `l` join `customer` `c`) join `task` `t`) where `l`.`uuid_laundry` = `t`.`uuid_laundry` and `c`.`uuid_customer` = `l`.`uuid_customer` group by `l`.`uuid_laundry`,`c`.`nama`,`l`.`tanggal_masuk`,`l`.`tanggal_keluar`,`l`.`status_bayar`,`l`.`status_laundry`,`l`.`is_active`,`l`.`update_at`,`l`.`update_by` */;
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
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_task` AS select `t`.`uuid_task` AS `uuid_task`,`t`.`uuid_laundry` AS `uuid_laundry`,`c`.`nama` AS `nama`,`j`.`jenis_laundry` AS `jenis_laundry`,`t`.`jumlah` AS `jumlah`,`t`.`uom` AS `uom`,`t`.`harga` AS `harga`,`t`.`total_harga` AS `total_harga`,`l`.`tanggal_masuk` AS `tanggal_masuk`,`l`.`tanggal_keluar` AS `tanggal_keluar`,`s`.`keterangan` AS `status`,if(`t`.`id_user` = 0,' - ',`u`.`username`) AS `handle_by`,`t`.`is_active` AS `is_active`,`t`.`update_at` AS `update_at`,`t`.`update_by` AS `update_by` from (((((`task` `t` join `customer` `c`) join `laundry` `l`) join `jenis_laundry` `j`) join `status` `s`) join `user` `u`) where `t`.`uuid_laundry` = `l`.`uuid_laundry` and `l`.`uuid_customer` = `c`.`uuid_customer` and `t`.`id_jenis_laundry` = `j`.`id_jenis_laundry` and `t`.`status_task` = `s`.`id_status` and `t`.`id_user` = `u`.`id_user` */;
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

-- Dump completed on 2021-12-07 22:33:14
