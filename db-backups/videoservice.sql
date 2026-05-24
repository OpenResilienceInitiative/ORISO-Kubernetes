/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: videoservice
-- ------------------------------------------------------
-- Server version	10.11.15-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `videoservice`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `videoservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `videoservice`;

--
-- Sequence structure for `sequence_videoroom`
--

DROP SEQUENCE IF EXISTS `sequence_videoroom`;
CREATE SEQUENCE `sequence_videoroom` start with 1 minvalue 0 maxvalue 9223372036854775806 increment by 1 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_videoroom`, 20, 0);

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES
('initSql-tables','initialSetup','db/changelog/changeset/0001_initsql/initSql.xml','2025-10-27 16:55:19',1,'EXECUTED','9:f52d72d177305c6d1da70724a4b124af','sqlFile path=db/changelog/changeset/0001_initsql/initTables.sql','',NULL,'4.23.2',NULL,NULL,'1584119692');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES
(1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videoroom`
--

DROP TABLE IF EXISTS `videoroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `videoroom` (
  `id` bigint(21) NOT NULL,
  `session_id` bigint(21) DEFAULT NULL,
  `group_chat_id` bigint(21) DEFAULT NULL,
  `jitsi_room_id` varchar(40) NOT NULL,
  `rocketchat_room_id` varchar(40) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `close_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_jitsi_room_id` (`jitsi_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videoroom`
--

LOCK TABLES `videoroom` WRITE;
/*!40000 ALTER TABLE `videoroom` DISABLE KEYS */;
INSERT INTO `videoroom` VALUES
(1,100459,NULL,'cf4a01c4-d6e6-4582-8ee0-935fb3dc1620',NULL,'2025-10-27 20:33:34',NULL),
(2,100459,NULL,'03a22ef1-0104-4735-811e-896fd878866d',NULL,'2025-10-27 20:48:09',NULL),
(3,100459,NULL,'04697114-80c8-4384-b35f-57aa7fdb7250',NULL,'2025-10-27 20:48:26',NULL),
(4,100459,NULL,'9a12b18a-1d91-4181-b0a2-84b0f23706c3',NULL,'2025-10-27 20:58:00',NULL),
(5,100459,NULL,'a9319813-5ab2-47d9-aa17-4bdaf2c1c8e5',NULL,'2025-10-27 20:58:17',NULL),
(6,100459,NULL,'40f60d75-9440-4966-8747-bf8062dad0b2',NULL,'2025-10-27 20:58:26',NULL),
(7,100459,NULL,'5e51dd2d-0c6a-4565-a20d-f30783a1e64f',NULL,'2025-10-27 21:04:29',NULL),
(8,100459,NULL,'81039ba7-4410-4ce8-9823-e04a386ec799',NULL,'2025-10-27 21:25:57',NULL),
(9,100459,NULL,'706fc3f3-e89d-4947-802e-2a759e3c8008',NULL,'2025-10-27 21:26:08',NULL),
(10,100459,NULL,'9c186ad7-a7c6-4d46-b22a-cd5da5677118',NULL,'2025-10-27 21:26:10',NULL),
(11,100459,NULL,'1b5b04f6-3e84-4034-b78e-0c5346a63689',NULL,'2025-10-27 21:34:04',NULL),
(12,100459,NULL,'38f10594-f0b2-4c1f-9b15-b17304b221a1',NULL,'2025-10-27 21:34:08',NULL),
(13,100459,NULL,'82fd41f8-1019-46a2-b4da-71394ac01865',NULL,'2025-10-27 21:46:51',NULL),
(14,100459,NULL,'49aca889-da28-46d9-adb9-b99a9016e243',NULL,'2025-10-27 22:05:15',NULL),
(15,100459,NULL,'99aed03d-b9ec-48c8-8ee7-aa51e425034e',NULL,'2025-10-27 22:13:59',NULL),
(16,100459,NULL,'e7d65275-c2b9-4c51-adea-3bbdbe68ca18',NULL,'2025-10-27 22:45:25',NULL),
(17,100459,NULL,'d29fc903-9a8c-43c3-948a-f09d10560bbc',NULL,'2025-10-27 23:11:39',NULL),
(18,100459,NULL,'cf18f0b7-4a44-4aeb-88e4-9c3fbe74c909',NULL,'2025-10-27 23:14:32',NULL),
(19,100459,NULL,'3f16f3bd-754a-43d4-9a59-ba4a8f8d9bd5',NULL,'2025-10-27 23:23:58',NULL);
/*!40000 ALTER TABLE `videoroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'videoservice'
--

--
-- Dumping routines for database 'videoservice'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 10:00:29
