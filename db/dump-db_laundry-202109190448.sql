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
INSERT INTO `customer` VALUES ('65bb2c88-15c2-11ec-82a8-0242ac130003','085834246342','Dimas',NULL,NULL,NULL,0.00,1,0,NULL,0,NULL),('asd','08888888888','Dimas','',NULL,NULL,44444.00,1,1,'2021-09-15 01:31:40',1,'2021-09-16 10:13:53');
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
INSERT INTO `customer_inden_history` VALUES ('d0b31a4a-a6a9-44cc-a743-6949169c142a','asd',44444.00,'dimpul Mengubah data inden menjadi 44,444',1,'2021-09-16 10:13:53',1,'2021-09-16 10:13:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_laundry`
--

LOCK TABLES `jenis_laundry` WRITE;
/*!40000 ALTER TABLE `jenis_laundry` DISABLE KEYS */;
INSERT INTO `jenis_laundry` VALUES (1,'CKS','kg',6500,'laundry','0,2,3,4,5,1',1,0,NULL,0,NULL),(2,'CK','kg',4500,'laundry','0,2,3,5,1',1,0,NULL,0,NULL),(3,'Kiloan','kg',2000,NULL,'0,1,2,3',1,1,'2021-09-14 23:45:07',1,'2021-09-14 23:45:07'),(4,'Kiloan','kg',2000,NULL,'0,1,2,3',1,1,'2021-09-14 23:45:16',1,'2021-09-14 23:45:16'),(5,'Kiloan','kg',2000,NULL,'0,1,2,3',1,1,'2021-09-14 23:45:18',1,'2021-09-14 23:45:18'),(6,'Kiloan','kg',2000,NULL,'0,1,2,3',1,1,'2021-09-14 23:45:19',1,'2021-09-14 23:45:19'),(7,'Kiloan','kg',2000,NULL,'0,1,2,3',1,1,'2021-09-14 23:45:19',1,'2021-09-14 23:45:19'),(8,'asd','asd',2000,NULL,'0,2,2,2',0,1,'2021-09-14 23:45:20',1,'2021-09-14 23:58:03'),(9,'Kiloan','kg',2000,NULL,'0,1,2,3',0,1,'2021-09-14 23:45:38',1,'2021-09-14 23:58:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_user`
--

LOCK TABLES `jenis_user` WRITE;
/*!40000 ALTER TABLE `jenis_user` DISABLE KEYS */;
INSERT INTO `jenis_user` VALUES (1,'root',1,0,NULL,0,NULL),(2,'admin',1,0,NULL,0,NULL);
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
  `status_bayar` tinyint(1) DEFAULT 0,
  `status_laundry` tinyint(1) DEFAULT 0,
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
INSERT INTO `laundry` VALUES ('asdasd','65bb2c88-15c2-11ec-82a8-0242ac130003',NULL,NULL,0,0,1,0,NULL,0,NULL),('qwerty','65bb2c88-15c2-11ec-82a8-0242ac130003','2020-09-09 00:00:00',NULL,1,1,0,1,'2021-09-19 04:24:56',1,'2021-09-19 04:45:00'),('qwertys','65bb2c88-15c2-11ec-82a8-0242ac130003','2020-02-02 00:00:00',NULL,0,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33');
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
INSERT INTO `laundry_history` VALUES ('5a9cd4e1-3b0d-4259-8545-a75f3a8a232e','qwerty','Detail Laundry Berhasil Diubah',1,'2021-09-19 04:40:14',1,'2021-09-19 04:40:14'),('99c47e6b-e1b8-4813-b727-02061dc06df9','qwerty','Detail Laundry Berhasil Diubah',1,'2021-09-19 04:40:37',1,'2021-09-19 04:40:37'),('9b5dc5ab-10cb-4e98-8056-b6e3ce0e0615','qwerty','Laundry Baru Telah Ditambahkan',1,'2021-09-19 04:24:56',1,'2021-09-19 04:24:56'),('dc7f7e74-6825-431e-9dca-74d3e86ca890','qwertys','Laundry Baru Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('ee53a788-8439-4f2a-874b-447e1dac48ce','qwerty','Laundry Berhasil Dihapus',1,'2021-09-19 04:45:00',1,'2021-09-19 04:45:00');
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
INSERT INTO `passport` VALUES (1,'dimpul','$2y$10$zkpq6cm0F3zCUh/LUFnVj.9Sq1DyXa90JKUwpGxMQBqC4nyowy/3m','2021-09-19 01:37:32','2021-09-20 01:37:32');
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
  `is_active` tinyint(1) DEFAULT 0,
  `insert_by` int(11) DEFAULT 0,
  `insert_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT 0,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (0,'Tersedia',NULL,NULL,1,0,NULL,0,NULL),(1,'Selesai',NULL,NULL,1,0,NULL,0,NULL),(2,'Cuci',NULL,NULL,1,0,NULL,0,NULL),(3,'Jemur',NULL,NULL,1,0,NULL,0,NULL),(4,'Setrika',NULL,NULL,1,0,NULL,0,NULL),(5,'Packing',NULL,NULL,1,0,NULL,0,NULL);
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
  CONSTRAINT `task_FK_1` FOREIGN KEY (`uuid_laundry`) REFERENCES `laundry` (`uuid_laundry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES ('1222222','asdasd',1,0,2.00,'kg',6500.50,13000.00,3,1,1,'2021-09-16 10:50:31',1,'2021-09-16 10:50:31'),('asdasdasdasd','asdasd',2,0,0.00,'kg',0.00,0.00,1,1,0,NULL,0,NULL),('dimdimdimdim','asdasd',3,1,10.00,'kg',10000.00,100000.00,1,1,1,'2021-09-16 11:58:31',1,'2021-09-16 12:02:14'),('qwerty','qwerty',1,0,2.00,'kg',20000.00,40000.00,1,1,1,'2021-09-19 04:24:56',1,'2021-09-19 04:30:21'),('qwertys','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertysaaa','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertysaaaaaa','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertysee','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertyseeeeee','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertysqq','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertysqqqqqq','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertyss','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertyssss','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('qwertysssssss','qwertys',1,0,2.00,'kg',20000.00,40000.00,0,1,1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33');
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
INSERT INTO `task_history` VALUES ('1ca2db24-1d7b-462f-801c-57f717d001ab','qwerty',0,1,'Update status dari \'Tersedia\' ke \'Selesai\'',1,'2021-09-19 04:30:21',1,'2021-09-19 04:30:21'),('1d5ae347-65fc-4daf-a483-1a558a98bfb2','dimdimdimdim',3,4,'Update status dari \'Jemur\' ke \'Setrika\'',1,'2021-09-16 12:02:06',1,'2021-09-16 12:02:06'),('20b04a9c-262f-4a7b-b816-117152f57f58','qwertysee',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('2c22996f-f600-405b-848e-2ad1787882f1','dimdimdimdim',5,1,'Update status dari \'Packing\' ke \'Selesai\'',1,'2021-09-16 12:02:14',1,'2021-09-16 12:02:14'),('3550b94a-4ba3-4785-be49-b23f3aca2d93','qwertysqqqqqq',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('3df03a00-fab7-4933-8848-3b0a0e0d3be0','dimdimdimdim',4,5,'Update status dari \'Setrika\' ke \'Packing\'',1,'2021-09-16 12:02:09',1,'2021-09-16 12:02:09'),('400db3b4-79dd-4aa8-9193-4c2d0f047eaf','qwerty',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:24:56',1,'2021-09-19 04:24:56'),('4d703334-d237-46ec-b4b6-e586169681db','qwertysaaa',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('74d677bd-92a0-4b5b-9f72-121a243eba61','dimdimdimdim',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-16 11:58:31',1,'2021-09-16 11:58:31'),('79a0b7e1-1804-4e41-9004-e7133df9d3ce','qwertysssssss',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('816f5540-a30f-4ff0-b89b-df3c58280de0','qwertyssss',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('a20186c4-688c-4f9d-8f7e-3ff191ba1b8d','qwertyseeeeee',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('a259be2d-b0f0-4591-98ae-f631113a79c2','dimdimdimdim',0,2,'Update status dari \'Tersedia\' ke \'Cuci\'',1,'2021-09-16 12:01:55',1,'2021-09-16 12:01:55'),('a87cc769-d890-41de-826e-f3cdedee9ca0','qwertyss',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('aaa41fb9-63ad-4fa6-81f6-fb605d54e04f','qwertys',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('bc4bb520-e87b-481e-8a81-e42c3c214be7','qwertysqq',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('bf601af6-215a-4d1e-af9f-6a440d6ec5a8','qwertysaaaaaa',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-19 04:47:33',1,'2021-09-19 04:47:33'),('dab9a566-4a08-4815-b0de-ea0d18acd95a','dimdimdimdim',2,3,'Update status dari \'Cuci\' ke \'Jemur\'',1,'2021-09-16 12:02:02',1,'2021-09-16 12:02:02'),('ed4c0ad3-9400-439e-b2e2-5789e333e331','dimdimdimdim',0,0,'Handover task ke dimpul',1,'2021-09-16 12:01:01',1,'2021-09-16 12:01:01'),('f3906286-f1df-4a18-b210-d2b3220de3d9','1222222',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:31',1,'2021-09-16 10:50:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,1,'SYSTEM','SYSTEM',1,0,NULL,0,NULL),(1,2,'dimpul','$2y$10$xb6wBASRkcNuRICEP.3hk.8qAekVVfexpfqDgzm0vplYqK5bJd8vO',1,0,NULL,1,'2021-09-17 06:06:05'),(20,1,'dimpulssss','$2y$10$4H0fIuHZtXfuo3sNi4fIW.aNytEDDxxMXC82ZAJ/a4.Dyqf6LzLhS',1,NULL,'2021-09-14 17:42:03',NULL,'2021-09-14 17:42:03'),(21,2,'ddd','$2y$10$JAbU5t/eMdDF9O/8EnfYe.pJ6Jm8388TYOr7tzjj8azlBfzA7pGrW',1,1,'2021-09-14 17:43:43',1,'2021-09-17 06:05:01'),(25,1,'dimpulssss2s','$2y$10$eCj0ZBCJZXFVK7a2OeKWrOtx3ZQ0jc14qEusXdABOpB3w/O0ZymfG',0,1,'2021-09-14 17:46:07',1,'2021-09-14 19:02:56');
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

-- Dump completed on 2021-09-19  4:48:08
