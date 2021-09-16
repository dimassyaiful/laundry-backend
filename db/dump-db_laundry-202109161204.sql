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
INSERT INTO `laundry` VALUES ('asdasd','65bb2c88-15c2-11ec-82a8-0242ac130003',NULL,NULL,0,0,1,0,NULL,0,NULL);
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
INSERT INTO `passport` VALUES (1,'dimpul','$2y$10$VR.3C9uxumt9lfmaBDZw2OJxvqUeEM43MLDzFNaf/YAWwlLZmP4tW','2021-09-16 02:16:06','2021-09-17 02:16:06');
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
INSERT INTO `task` VALUES ('12','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 10:50:23',1,'2021-09-16 10:50:23'),('122','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 10:50:25',1,'2021-09-16 10:50:25'),('1222','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 10:50:27',1,'2021-09-16 10:50:27'),('12222','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 10:50:28',1,'2021-09-16 10:50:28'),('122222','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 10:50:30',1,'2021-09-16 10:50:30'),('1222222','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 10:50:31',1,'2021-09-16 10:50:31'),('dimdimdimdim','asdasd',1,1,10.00,'kg',10000.00,100000.00,1,1,1,'2021-09-16 11:58:31',1,'2021-09-16 12:02:14'),('qwerty','asdasd',1,0,1.00,'kg',6500.00,6500.00,0,0,0,NULL,1,'2021-09-16 11:10:11'),('zaqwer','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 03:05:44',1,'2021-09-16 03:05:44'),('zaqwerw','asdasd',1,0,2.00,'kg',6500.56,13000.00,0,1,1,'2021-09-16 03:06:13',1,'2021-09-16 03:06:13'),('zaqwerww','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,1,'2021-09-16 03:06:16',1,'2021-09-16 03:06:16'),('zaqwerwww','asdasd',1,0,123123.00,'kg',22.00,123123.00,3,1,1,'2021-09-16 03:06:18',1,'2021-09-16 11:22:41'),('zaqwerwwws','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,0,NULL,0,NULL),('zaqwerwwwss','asdasd',1,1,2.00,'kg',6500.50,13000.00,3,1,0,NULL,1,'2021-09-16 12:01:35'),('zaqwerwwwsss','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,0,NULL,0,NULL),('zaqwerwwwssss','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,1,0,NULL,0,NULL),('zaqwerwwwsssss','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,0,0,NULL,1,'2021-09-16 11:06:12'),('zaqwerwwwssssss','asdasd',1,0,2.00,'kg',6500.50,13000.00,0,0,0,NULL,1,'2021-09-16 11:03:50');
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
INSERT INTO `task_history` VALUES ('01646060-b958-486e-8b62-377a96167d16','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:33',1,'2021-09-16 10:56:33'),('06ea7bd8-0714-474e-a113-b6979201dcef','122',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:25',1,'2021-09-16 10:50:25'),('075a8866-4f39-4bb1-a6bb-0dc30370b0e8','zaqwerwwwss',2,3,'Update status dari \'Cuci\' ke \'Jemur\'',1,'2021-09-16 12:01:35',1,'2021-09-16 12:01:35'),('0ae4a4bd-ac0c-46bb-bb1d-fa1b6b7ba429','zaqwerwwwssss',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:05',1,'2021-09-16 10:50:05'),('0f08684f-91fb-49f5-97bd-ad50c1485954','qwerty',0,0,'dimpul Menghapus List Cucian',1,'2021-09-16 11:10:09',1,'2021-09-16 11:10:09'),('11f63337-458d-43c5-a02d-fb51c48c6fc1','12',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:23',1,'2021-09-16 10:50:23'),('1b5dfaaa-8ee9-46ea-842f-41aa4d958531','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:50:42',1,'2021-09-16 10:50:42'),('1d5ae347-65fc-4daf-a483-1a558a98bfb2','dimdimdimdim',3,4,'Update status dari \'Jemur\' ke \'Setrika\'',1,'2021-09-16 12:02:06',1,'2021-09-16 12:02:06'),('1faf1701-65ac-4d03-881b-78dd258691e5','zaqwerwwwsssss',0,0,'dimpul Menghapus List Cucian',1,'2021-09-16 11:06:12',1,'2021-09-16 11:06:12'),('2c22996f-f600-405b-848e-2ad1787882f1','dimdimdimdim',5,1,'Update status dari \'Packing\' ke \'Selesai\'',1,'2021-09-16 12:02:14',1,'2021-09-16 12:02:14'),('2e470020-df1e-4aaa-a5af-1848d7e859f4','zaqwerwwwss',0,0,'Handover task ke dimpul',1,'2021-09-16 11:52:55',1,'2021-09-16 11:52:55'),('39622499-804b-499d-b471-8c3ed6303d46','qwerty',0,0,'dimpul Menghapus List Cucian',1,'2021-09-16 11:10:11',1,'2021-09-16 11:10:11'),('3a4706dc-e4de-4cc8-b6f4-3ac6c4310e53','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:10',1,'2021-09-16 10:56:10'),('3c81c3c1-45fb-4892-bbfa-ad40525f1096','zaqwerwwws',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:49:59',1,'2021-09-16 10:49:59'),('3df03a00-fab7-4933-8848-3b0a0e0d3be0','dimdimdimdim',4,5,'Update status dari \'Setrika\' ke \'Packing\'',1,'2021-09-16 12:02:09',1,'2021-09-16 12:02:09'),('45aff62e-7bd4-489f-acdc-f6b61904bba3','zaqwerwww',2,3,'dimpul Mengubah status dari \'Cuci\' ke \'Jemur\'',1,'2021-09-16 11:22:41',1,'2021-09-16 11:22:41'),('4d3adba8-5836-4dae-8acd-f42cb7cfa46c','qwerty',0,0,'dimpul Menghapus List Cucian',1,'2021-09-16 11:10:10',1,'2021-09-16 11:10:10'),('50b58ed0-22af-404c-a402-1e44e6efeb92','12222',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:28',1,'2021-09-16 10:50:28'),('520f543a-52cd-40f9-9ee5-b21b8d6c33fa','zaqwerwwwssssss',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:08',1,'2021-09-16 10:50:08'),('5375f5ee-ba30-40b6-9dd0-18a6a122e84d','122222',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:30',1,'2021-09-16 10:50:30'),('572cc2c1-0d46-475b-8096-323a6db189b4','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:50:41',1,'2021-09-16 10:50:41'),('595a11db-900a-489d-bcb6-34d9e5b632f5','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:53:14',1,'2021-09-16 10:53:14'),('5db95956-a7c6-46c3-82ba-92426d192b39','zaqwerwwwss',0,1,'Update status dari \'Tersedia\' ke \'Selesai\'',1,'2021-09-16 12:01:26',1,'2021-09-16 12:01:26'),('697533ce-53ab-4c76-b954-d99a66bfecd7','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:50:43',1,'2021-09-16 10:50:43'),('69d11a52-a756-4ca9-877e-2a15727f4136','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:09',1,'2021-09-16 10:56:09'),('6a27866d-9a0e-4bdf-97fa-44de09fefdd2','zaqwerwwwss',0,0,' Handover task ke dimpul',1,'2021-09-16 11:45:00',1,'2021-09-16 11:45:00'),('6bebc52a-3018-49ea-8ce2-7df31a76fc3f','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:35',1,'2021-09-16 10:56:35'),('6cd88c2d-baa3-4485-ba9c-7854bee5393d','zaqwerwwwss',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:01',1,'2021-09-16 10:50:01'),('712f8f1f-ce90-4c66-93dd-0f7580fdf3b2','zaqwerwwwss',0,0,' Handover task ke ',1,'2021-09-16 11:40:36',1,'2021-09-16 11:40:36'),('716bce75-f632-484d-a610-61a582bb09c4','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:28',1,'2021-09-16 10:56:28'),('74d677bd-92a0-4b5b-9f72-121a243eba61','dimdimdimdim',NULL,0,'List Cucian Telah Ditambahkan',1,'2021-09-16 11:58:31',1,'2021-09-16 11:58:31'),('7694120e-f01b-4916-84c3-ad8d0ad71ed2','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:36',1,'2021-09-16 10:56:36'),('7cf596d6-5412-4e8c-b115-5564dbbb7550','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:49:25',1,'2021-09-16 10:49:25'),('8878e82f-5cb1-41c8-bdd2-4db791270199','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:31',1,'2021-09-16 10:56:31'),('899243f4-66df-4675-ab42-0ca36357c892','qwerty',0,0,'dimpul Menghapus List Cucian',1,'2021-09-16 11:06:34',1,'2021-09-16 11:06:34'),('913e1455-0f75-4449-8444-4292e36e43b3','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:57:39',1,'2021-09-16 10:57:39'),('9173ae5c-f91d-43a2-84ea-0776c77acca9','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:57:47',1,'2021-09-16 10:57:47'),('9274906e-0a80-4a1e-b290-9c6192c463f4','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:57:46',1,'2021-09-16 10:57:46'),('9289ffe1-39ae-4942-ac8b-fb1abc0990e6','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:06',1,'2021-09-16 10:56:06'),('97d6c70b-f9ac-4af1-889e-380c3246bf77','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:57:40',1,'2021-09-16 10:57:40'),('a259be2d-b0f0-4591-98ae-f631113a79c2','dimdimdimdim',0,2,'Update status dari \'Tersedia\' ke \'Cuci\'',1,'2021-09-16 12:01:55',1,'2021-09-16 12:01:55'),('a28c4a55-06e5-4be5-9ab9-42f495dc0b10','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:32',1,'2021-09-16 10:56:32'),('abd2713c-d3df-4e4c-99d2-778a4c79197e','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:53:12',1,'2021-09-16 10:53:12'),('ac77678e-db21-4ab2-a0ab-9b8a1b7bc603','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:53:11',1,'2021-09-16 10:53:11'),('be0b9e8e-51a5-4f8f-b4fd-0474611e13e7','zaqwerwwwsss',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:03',1,'2021-09-16 10:50:03'),('be74ad27-19f6-4b7e-8e8d-4836fe8aee46','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:34',1,'2021-09-16 10:56:34'),('ce753681-c7ac-479a-811d-4d384d7a77fd','zaqwerwwwss',0,0,'dimpul Handover task ke dimpul',1,'2021-09-16 11:43:54',1,'2021-09-16 11:43:54'),('d4026cae-f2b9-4187-974b-611d61c4a993','zaqwerwwwsssss',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:06',1,'2021-09-16 10:50:06'),('d5d1573e-ffbd-4444-a419-22bbf890e694','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:50:40',1,'2021-09-16 10:50:40'),('d8fddec4-82fe-44fe-971e-04da2ad0ae53','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:30',1,'2021-09-16 10:56:30'),('dab9a566-4a08-4815-b0de-ea0d18acd95a','dimdimdimdim',2,3,'Update status dari \'Cuci\' ke \'Jemur\'',1,'2021-09-16 12:02:02',1,'2021-09-16 12:02:02'),('daeaee50-502e-4d17-a874-94858da3fbf2','zaqwerwwwss',0,0,'dimpul Set Handover task ke dimpul',1,'2021-09-16 11:46:24',1,'2021-09-16 11:46:24'),('dbd8fb8a-9c74-4b2e-aa51-87ee85dec9d2','zaqwerwww',0,2,'dimpul Mengubah status dari \'Tersedia\' ke \'Cuci\'',1,'2021-09-16 11:22:30',1,'2021-09-16 11:22:30'),('dd5d70a0-1b66-4e2c-9c31-50b9ce4bb8c5','zaqwerwwwss',0,0,'dimpul Handover task ke dimpul',1,'2021-09-16 11:43:06',1,'2021-09-16 11:43:06'),('defc992f-9138-4a8d-b4d9-f9615035ee14','1222',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:27',1,'2021-09-16 10:50:27'),('df8d28c3-4d1a-4344-8b19-0e29cc948064','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:29',1,'2021-09-16 10:56:29'),('e27a464a-77bc-4fb2-8799-b616cad580a5','zaqwerwwwss',0,2,'Update status dari \'Tersedia\' ke \'Cuci\'',1,'2021-09-16 12:01:31',1,'2021-09-16 12:01:31'),('e5fd6137-c84e-4e0c-81cf-221c176eb26c','zaqwerwwwss',0,0,'Handover task ke dimpul',1,'2021-09-16 11:49:03',1,'2021-09-16 11:49:03'),('ea094c8c-f9fd-48ed-a7f0-038111f7a201','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:56:08',1,'2021-09-16 10:56:08'),('eab2f912-d641-4d87-8479-6a4c6294d942','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:49:24',1,'2021-09-16 10:49:24'),('ed4c0ad3-9400-439e-b2e2-5789e333e331','dimdimdimdim',0,0,'Handover task ke dimpul',1,'2021-09-16 12:01:01',1,'2021-09-16 12:01:01'),('ee48121c-f7b5-46ca-bccb-24b7d87076ca','zaqwerwwwss',0,0,'dimpul Handover task ke dimpul',1,'2021-09-16 11:44:23',1,'2021-09-16 11:44:23'),('f116a250-0a11-4aaa-b46c-58d42218529b','zaqwerwwwss',2,3,'Update status dari \'Cuci\' ke \'Jemur\'',1,'2021-09-16 11:53:04',1,'2021-09-16 11:53:04'),('f3906286-f1df-4a18-b210-d2b3220de3d9','1222222',NULL,0,'dimpul Menambahkan List Cucian Baru',1,'2021-09-16 10:50:31',1,'2021-09-16 10:50:31'),('faa9a7f8-b331-4c1e-b2c2-0e12d8791677','zaqwerwww',0,1,'dimpul Mengubah status dari \'Tersedia\' ke \'Selesai\'',1,'2021-09-16 11:22:00',1,'2021-09-16 11:22:00'),('fc3c7e51-ccc9-497c-98bc-d5cf925038d5','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:53:13',1,'2021-09-16 10:53:13'),('fd8bd6e2-ce84-4528-9407-6e3d90abd77d','zaqwerwww',0,0,'dimpul Mengubah Detail List Cucian',1,'2021-09-16 10:49:23',1,'2021-09-16 10:49:23');
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
-- Temporary table structure for view `view_task_history`
--

DROP TABLE IF EXISTS `view_task_history`;
/*!50001 DROP VIEW IF EXISTS `view_task_history`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_task_history` (
  `uuid_task` tinyint NOT NULL,
  `uuid_laundry` tinyint NOT NULL,
  `handle_by` tinyint NOT NULL,
  `nama` tinyint NOT NULL,
  `jenis_laundry` tinyint NOT NULL,
  `tanggal_masuk` tinyint NOT NULL,
  `tanggal_keluar` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_laundry'
--

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

--
-- Final view structure for view `view_task_history`
--

/*!50001 DROP TABLE IF EXISTS `view_task_history`*/;
/*!50001 DROP VIEW IF EXISTS `view_task_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_task_history` AS select `t`.`uuid_task` AS `uuid_task`,`t`.`uuid_laundry` AS `uuid_laundry`,`t`.`id_user` AS `handle_by`,`c`.`nama` AS `nama`,`j`.`jenis_laundry` AS `jenis_laundry`,`l`.`tanggal_masuk` AS `tanggal_masuk`,`l`.`tanggal_keluar` AS `tanggal_keluar`,`s`.`keterangan` AS `status` from (((((`task` `t` join `customer` `c`) join `laundry` `l`) join `jenis_laundry` `j`) join `status` `s`) join `user` `u`) where `t`.`uuid_laundry` = `l`.`uuid_laundry` and `l`.`uuid_customer` = `c`.`uuid_customer` and `t`.`id_jenis_laundry` = `j`.`id_jenis_laundry` and `t`.`status_task` = `s`.`id_status` and `t`.`id_user` = `u`.`id_user` */;
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

-- Dump completed on 2021-09-16 12:04:02
