/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: consultingtypeservice
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
-- Current Database: `consultingtypeservice`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `consultingtypeservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `consultingtypeservice`;

--
-- Sequence structure for `sequence_topic`
--

DROP SEQUENCE IF EXISTS `sequence_topic`;
CREATE SEQUENCE `sequence_topic` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_topic`, 0, 0);

--
-- Sequence structure for `sequence_topic_group`
--

DROP SEQUENCE IF EXISTS `sequence_topic_group`;
CREATE SEQUENCE `sequence_topic_group` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_topic_group`, 0, 0);

--
-- Sequence structure for `sequence_topic_group_x_topic`
--

DROP SEQUENCE IF EXISTS `sequence_topic_group_x_topic`;
CREATE SEQUENCE `sequence_topic_group_x_topic` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_topic_group_x_topic`, 0, 0);

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
('initSql-tables','initialSetup','db/changelog/changeset/0001_initsql/initSql.xml','2025-09-06 14:44:31',1,'EXECUTED','8:e0b3fa0b7c8b1f834422df6d5a059fbc','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('initSql-tables','initialSetup','db/changelog/changeset/0002_topic_internal_identifier/topic_internal_identifier_column.xml','2025-09-06 14:44:31',2,'EXECUTED','8:e7b1ca2422d21803f6a1fd73e807f06d','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('migrateToMultilingualContent','idrissnaji','db/changelog/changeset/0003_migrate_topic_to_multilingual_structure/0003-changeSet.xml','2025-09-06 14:44:31',3,'EXECUTED','8:08fdbb118d9f72ed774f0ad04dd2fd43','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('topicGroups','dodalovicgran','db/changelog/changeset/0004_topic_groups/0004-changeSet.xml','2025-09-06 14:44:31',4,'EXECUTED','8:183f9b74679c0aca8ce595671a026704','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('initSql-tables','initialSetup','db/changelog/changeset/0005_topic_fallback_agency_id/topic_fallback_agency_id.xml','2025-09-06 14:44:31',5,'EXECUTED','8:97b045eea237996e49a39fbacaa0dc66','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('initSql-tables','initialSetup','db/changelog/changeset/0006_topic_fallback_url/topic_fallback_url.xml','2025-09-06 14:44:31',6,'EXECUTED','8:2d4916d52daf9e8d02c21b1c8b6add98','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('topic_welcome_message','dodalovicgran','db/changelog/changeset/0007_topic_welcome_message/topic_welcome_message.xml','2025-09-06 14:44:31',7,'EXECUTED','8:8dcfe4006cee45cd94fbd850b8980a21','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('topic_send_next_step_message','dodalovicgran','db/changelog/changeset/0008_topic_send_next_step_message/topic_send_next_step_message.xml','2025-09-06 14:44:31',8,'EXECUTED','8:bdac8320fd05fca30da686df05f41cb8','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('topic_add_titles','dodalovicgran','db/changelog/changeset/0009_topic_add_titles_and_extend_internal_identifier/0009_topic_add_titles_and_extend_internal_identifier.xml','2025-09-06 14:44:31',9,'EXECUTED','8:075434200b126abd32d734e6c7644db5','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428'),
('topic_add_titles','dodalovicgran','db/changelog/changeset/0010_change_topic_and_topic_groups_to_be_i18n_aware/0010_change_topic_and_topic_groups_to_be_i18n_aware.xml','2025-09-06 14:44:31',10,'EXECUTED','8:7c462c4ccd916b17b1569d2f4576818f','sqlFile','',NULL,'4.9.1',NULL,NULL,'7169871428');
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
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `id` bigint(21) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `name` varchar(4092) DEFAULT NULL,
  `description` varchar(4092) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `internal_identifier` varchar(255) DEFAULT NULL,
  `fallback_agency_id` bigint(21) DEFAULT NULL,
  `fallback_url` varchar(200) DEFAULT NULL,
  `welcome_message` varchar(200) DEFAULT NULL,
  `send_next_step_message` tinyint(1) NOT NULL DEFAULT 0,
  `titles_short` varchar(4092) DEFAULT NULL,
  `titles_long` varchar(4092) DEFAULT NULL,
  `titles_welcome` varchar(255) DEFAULT NULL,
  `titles_dropdown` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`,`tenant_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES
(1,1,'{\"de\": \"Beratung\", \"en\": \"Counseling\"}','{\"de\": \"Allgemeine Beratung\", \"en\": \"General Counseling\"}','ACTIVE','2025-09-07 09:28:07','2025-09-07 09:28:07','counseling',NULL,NULL,NULL,0,'{\"de\": \"Beratung\", \"en\": \"Counseling\"}','{\"de\": \"Allgemeine Beratung\", \"en\": \"General Counseling\"}','Willkommen zur Beratung','Beratung','counseling'),
(2,1,'{\"de\": \"Suchtberatung\", \"en\": \"Addiction Counseling\"}','{\"de\": \"Beratung bei Suchtproblemen\", \"en\": \"Counseling for addiction problems\"}','ACTIVE','2025-09-07 09:28:07','2025-09-07 09:28:07','addiction',NULL,NULL,NULL,0,'{\"de\": \"Sucht\", \"en\": \"Addiction\"}','{\"de\": \"Suchtberatung\", \"en\": \"Addiction Counseling\"}','Willkommen zur Suchtberatung','Suchtberatung','addiction-counseling'),
(3,1,'{\"de\": \"Familienberatung\", \"en\": \"Family Counseling\"}','{\"de\": \"Beratung für Familien\", \"en\": \"Counseling for families\"}','ACTIVE','2025-09-07 09:28:07','2025-09-07 09:28:07','family',NULL,NULL,NULL,0,'{\"de\": \"Familie\", \"en\": \"Family\"}','{\"de\": \"Familienberatung\", \"en\": \"Family Counseling\"}','Willkommen zur Familienberatung','Familienberatung','family-counseling');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_group`
--

DROP TABLE IF EXISTS `topic_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_group` (
  `id` bigint(21) NOT NULL,
  `name` varchar(4092) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_group`
--

LOCK TABLES `topic_group` WRITE;
/*!40000 ALTER TABLE `topic_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_group_x_topic`
--

DROP TABLE IF EXISTS `topic_group_x_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic_group_x_topic` (
  `group_id` bigint(21) NOT NULL,
  `topic_id` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  KEY `group_id` (`group_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `fk_group` FOREIGN KEY (`group_id`) REFERENCES `topic_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_group_x_topic`
--

LOCK TABLES `topic_group_x_topic` WRITE;
/*!40000 ALTER TABLE `topic_group_x_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_group_x_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'consultingtypeservice'
--

--
-- Dumping routines for database 'consultingtypeservice'
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
