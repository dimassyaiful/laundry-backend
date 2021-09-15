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
INSERT INTO `customer` VALUES ('65bb2c88-15c2-11ec-82a8-0242ac130003','085834246342','Dimas',NULL,NULL,NULL,0.00,1,0,NULL,0,NULL),('asd','08888888888','Dimas','',NULL,NULL,44444.00,0,1,'2021-09-15 01:31:40',1,'2021-09-15 02:13:08');
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
INSERT INTO `customer_inden_history` VALUES ('asdd','asd',2000.00,'dimpul Mengubah data inden menjadi 2,000',1,'2021-09-15 02:12:15',1,'2021-09-15 02:12:15'),('asdds','asd',2000.00,'dimpul Mengubah data inden menjadi 2,000',1,'2021-09-15 02:13:01',1,'2021-09-15 02:13:01'),('asddss','asd',44444.00,'dimpul Mengubah data inden menjadi 44,444',1,'2021-09-15 02:13:08',1,'2021-09-15 02:13:08');
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
  `status_paid_from` int(11) DEFAULT 0,
  `status_paid_to` int(11) DEFAULT 0,
  `status_laundry_from` int(11) DEFAULT 0,
  `status_laundry_to` int(11) DEFAULT 0,
  `keterangan` varchar(100) NOT NULL,
  `insert_by` int(11) DEFAULT 0,
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
INSERT INTO `passport` VALUES (1,'dimpul','$2y$10$QogS.3EN0iFe25.tQsNQXOUnu/cErn./VzUuPEmL5L5Z/zM2E0Z12','2021-09-14 20:58:21','2021-09-15 20:58:21');
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
  `id_user` int(11) DEFAULT NULL,
  `jumlah` decimal(12,2) NOT NULL DEFAULT 0.00,
  `uom` varchar(10) NOT NULL,
  `harga` decimal(12,2) NOT NULL DEFAULT 0.00,
  `total_harga` decimal(12,2) NOT NULL DEFAULT 0.00,
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
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `user` VALUES (0,1,'SYSTEM','SYSTEM',1,0,NULL,0,NULL),(1,2,'dimpul','$2y$10$FMv.y24.l9GNaC.YbizcQO/AujfjW4yVFgI6AaGw.CPIMiOTler3.',1,0,NULL,0,NULL),(20,1,'dimpulssss','$2y$10$4H0fIuHZtXfuo3sNi4fIW.aNytEDDxxMXC82ZAJ/a4.Dyqf6LzLhS',1,NULL,'2021-09-14 17:42:03',NULL,'2021-09-14 17:42:03'),(21,2,'ddd','$2y$10$r52wLsSOpBN/Jt9tHe/Hd.BFvo4WmdRiusMvYfXN6RF1JEOf4oh9u',1,1,'2021-09-14 17:43:43',1,'2021-09-14 18:58:17'),(25,1,'dimpulssss2s','$2y$10$eCj0ZBCJZXFVK7a2OeKWrOtx3ZQ0jc14qEusXdABOpB3w/O0ZymfG',0,1,'2021-09-14 17:46:07',1,'2021-09-14 19:02:56');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_laundry'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-15  9:16:25
