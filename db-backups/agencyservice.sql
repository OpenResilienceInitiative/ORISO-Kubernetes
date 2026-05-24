/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: agencyservice
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
-- Current Database: `agencyservice`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `agencyservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `agencyservice`;

--
-- Sequence structure for `sequence_agency`
--

DROP SEQUENCE IF EXISTS `sequence_agency`;
CREATE SEQUENCE `sequence_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency`, 250, 0);

--
-- Sequence structure for `sequence_agency_postcode_range`
--

DROP SEQUENCE IF EXISTS `sequence_agency_postcode_range`;
CREATE SEQUENCE `sequence_agency_postcode_range` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency_postcode_range`, 250, 0);

--
-- Sequence structure for `sequence_agency_topic`
--

DROP SEQUENCE IF EXISTS `sequence_agency_topic`;
CREATE SEQUENCE `sequence_agency_topic` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency_topic`, 370, 0);

--
-- Sequence structure for `sequence_diocese`
--

DROP SEQUENCE IF EXISTS `sequence_diocese`;
CREATE SEQUENCE `sequence_diocese` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_diocese`, 0, 0);

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
('initSql-tables','initialSetup','db/changelog/changeset/0001_initsql/initSql.xml','2025-09-06 14:49:14',1,'EXECUTED','9:fcd26225fa81c17ee81b0b1facacfcac','sqlFile path=db/changelog/changeset/0001_initsql/initTables.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('initSql-trigger','initialSetup','db/changelog/changeset/0001_initsql/initSql.xml','2025-09-06 14:49:14',2,'EXECUTED','9:19a49921f540a2937d3bb360b39b4c69','sqlFile path=db/changelog/changeset/0001_initsql/initTrigger.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('COBH-1413-agency_id_old_null','COBH-1413','db/changelog/changeset/0002_agency_id_old_null/0002_changeSet.xml','2025-09-06 14:49:14',3,'EXECUTED','9:8cf4b52eaafcbc4535b3e74156e70794','sqlFile path=db/changelog/changeset/0002_agency_id_old_null/agenyIdOldNull.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('COBH-1395-agency_consulting_type','COBH-1395','db/changelog/changeset/0003_agency_consulting_type/0003_changeSet.xml','2025-09-06 14:49:14',4,'EXECUTED','9:ea60e25cfc91a86b0d354f1b96b10e5a','sqlFile path=db/changelog/changeset/0003_agency_consulting_type/agencyConsultingType.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('COBH-1411-agency_offline','COBH-1411','db/changelog/changeset/0004_agency_offline/0004_changeSet.xml','2025-09-06 14:49:14',5,'EXECUTED','9:2f1b412f597e1c0932120998b14209a3','sqlFile path=db/changelog/changeset/0004_agency_offline/agencyOffline.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('COBH-2387-agency-delete-flag','COBH-2387','db/changelog/changeset/0005_agency_delete_flag/0005_changeSet.xml','2025-09-06 14:49:14',6,'EXECUTED','9:1b6d12b210017c23a5d54cd7ec50c2bc','sqlFile path=db/changelog/changeset/0005_agency_delete_flag/agencyDeleteFlag.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agency-url-and-external-flag','daho4b','db/changelog/changeset/0006_agency_url_and_external_flag/0006_changeSet.xml','2025-09-06 14:49:14',7,'EXECUTED','9:61030918861edf7a6330ee8af4591748','sqlFile path=db/changelog/changeset/0006_agency_url_and_external_flag/agencyUrlAndExternalFlag.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('tenantId','aalicic','db/changelog/changeset/0007_tenant_id/0007_changeSet.xml','2025-09-06 14:49:14',8,'EXECUTED','9:c59544648035248bf5ba5101918fd8c1','sqlFile path=db/changelog/changeset/0007_tenant_id/tenant_id.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('tenantIdRemoveDiocese','aalicic','db/changelog/changeset/0008_tenant_id_remove/0008_changeSet.xml','2025-09-06 14:49:15',9,'EXECUTED','9:9897d54c5f115db122051f601c57a97f','sqlFile path=db/changelog/changeset/0008_tenant_id_remove/tenant_id.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agencyTopic','patric-dosch-vi','db/changelog/changeset/0009_agency_topic/0009_changeSet.xml','2025-09-06 14:49:15',10,'EXECUTED','9:8c32fed41b8f93a49da2d7609f884fe9','sqlFile path=db/changelog/changeset/0009_agency_topic/agencyTopic.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agencyTopic-trigger','patric-dosch-vi','db/changelog/changeset/0009_agency_topic/0009_changeSet.xml','2025-09-06 14:49:15',11,'EXECUTED','9:4ffa52a9dc2b30fb99ae99bb32ac61e8','sqlFile path=db/changelog/changeset/0009_agency_topic/agencyTopicTrigger.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agencyDemographics','tkuzynow','db/changelog/changeset/0010_agency_demographics/0010_changeSet.xml','2025-09-06 14:49:15',12,'EXECUTED','9:ae4a6f04451030882866fb96039e7c38','sqlFile path=db/changelog/changeset/0010_agency_demographics/agencyDemographics.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agencyDemographics','tkuzynow','db/changelog/changeset/0011_agency_demographics_gender_column_change/0011_changeSet.xml','2025-09-06 14:49:15',13,'EXECUTED','9:d941dbba4926fc3cc8dce996f113f7f1','sqlFile path=db/changelog/changeset/0011_agency_demographics_gender_column_change/genderColumn-rename.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agencyDemographics','tkuzynow','db/changelog/changeset/0012_agency_counseling_relations/0012_changeSet.xml','2025-09-06 14:49:15',14,'EXECUTED','9:2792ff873df23a337b48162fcc5ee304','sqlFile path=db/changelog/changeset/0012_agency_counseling_relations/agencyCounselingRelations.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('agencyDemographics','tkuzynow','db/changelog/changeset/0013_make_diocese_nullable/0013_changeSet.xml','2025-09-06 14:49:15',15,'EXECUTED','9:6bed217b60b39fe6e47c21295a1d5084','sqlFile path=db/changelog/changeset/0013_make_diocese_nullable/makeDioceseNullable.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('changeConsultingTypeColumnType','tkuzynow','db/changelog/changeset/0015_change_consultingtype_column_type/0015_changeSet.xml','2025-09-06 14:49:15',16,'EXECUTED','9:5e06facd246f84f2f45a64c591fb066f','sqlFile path=db/changelog/changeset/0015_change_consultingtype_column_type/changeConsultingtypeColumnType.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('addDataProtectionAttributes','tkuzynow','db/changelog/changeset/0016_add_data_protection_attributes/0016_changeSet.xml','2025-09-06 14:49:15',17,'EXECUTED','9:5528d4cf29047d993cc713a45400b30a','sqlFile path=db/changelog/changeset/0016_add_data_protection_attributes/addDataProtectionAttributes.sql','',NULL,'4.23.2',NULL,NULL,'7170154528'),
('addAgencyLogo','tkuzynow','db/changelog/changeset/0017_add_agency_logo/0017_changeSet.xml','2025-09-06 14:49:15',18,'EXECUTED','9:9bab7e43e5612b1271bf85ba6faf0d6a','sqlFile path=db/changelog/changeset/0017_add_agency_logo/addAgencyLogo.sql','',NULL,'4.23.2',NULL,NULL,'7170154528');
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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency` (
  `id` bigint(21) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `diocese_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `is_team_agency` tinyint(4) NOT NULL DEFAULT 0,
  `consulting_type` int(11) DEFAULT NULL,
  `is_offline` tinyint(4) NOT NULL DEFAULT 0,
  `url` varchar(500) DEFAULT NULL,
  `is_external` tinyint(4) NOT NULL DEFAULT 0,
  `age_from` smallint(6) DEFAULT NULL,
  `age_to` smallint(6) DEFAULT NULL,
  `genders` varchar(50) DEFAULT NULL,
  `id_old` bigint(21) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `delete_date` datetime DEFAULT NULL,
  `counselling_relations` varchar(200) DEFAULT NULL,
  `data_protection_responsible_entity` varchar(100) DEFAULT NULL,
  `data_protection_alternative_contact` longtext DEFAULT NULL,
  `data_protection_officer_contact` longtext DEFAULT NULL,
  `data_protection_agency_contact` longtext DEFAULT NULL,
  `agency_logo` longtext DEFAULT NULL,
  `matrix_user_id` varchar(255) DEFAULT NULL,
  `matrix_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diocese_id` (`diocese_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES
(237,1,NULL,'Caritas Agency','Description.','12345','City',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 17:28:02','2026-03-13 17:29:36',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-237-service:91.99.183.160','NSDta-DETIWNyvb7tzCQo5Gc'),
(238,1,NULL,'Caritas Mitte','Description.','12345','Berlin',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 19:43:17','2026-04-10 10:27:06',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-238-service:91.99.183.160','McgyiNBNsmCb4DoQ43m3_40D'),
(239,0,NULL,'Testing Field','description.','12345','CITY',0,1,1,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 20:00:26','2026-03-13 20:00:26',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-239-service:91.99.183.160','iFxyWrTZonBzP3QnGdU-bLye'),
(240,1,NULL,'Testing field 2','description.','12345','city',0,1,1,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 20:01:54','2026-03-13 20:01:54',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-240-service:91.99.183.160','zadQ0Y6smDulB7xTL_4H79Qj'),
(241,1,NULL,'Beratungsstelle Kreuzberg','Schaun ma wie es jeht - na jut!','10965','Berlin',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-19 13:22:00','2026-03-24 12:51:16',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-241-service:91.99.183.160','XDmfYtp0RSdDsJrOoElGkV-w'),
(243,20,NULL,'Beratungsstelle Kiel','Vorführung Christine ','24103','Kiel',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-30 12:08:37','2026-03-30 12:11:52',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-243-service:91.99.183.160','aGnSX0Q9zK0oPXMskSEEY65i'),
(244,20,NULL,'Beratungstelle U25 ','Peer Beratung für Jugendliche in Schwierigen Situationen','00000','Kiel',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-30 12:11:12','2026-03-30 12:11:46',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-244-service:91.99.183.160','wvzBZdlCUTc2-tibAnkPIfms'),
(245,21,NULL,'Caritas am Meer','','23966','Wismar',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-31 13:52:35','2026-03-31 13:54:02',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-245-service:91.99.183.160','2xT0ZAg3z8K01CkmH-OIOTE9'),
(246,21,NULL,'Caritasverband Wismar ','dfds','23966','Wismar',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-31 13:54:41','2026-03-31 13:59:53',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-246-service:91.99.183.160','LxBq_wZ-CnqKmXBIxFSs6kj_'),
(247,1,NULL,'Caritas Neukölln','','12043','Berlin',0,1,1,NULL,0,NULL,NULL,NULL,NULL,'2026-04-10 10:46:47','2026-04-10 10:46:47',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-247-service:91.99.183.160','eKGF2iAVLWvFWRA7rcnX7-Zs'),
(248,22,NULL,'Schwangerschaftberatung Deutschland','Demo 14. April','86161','Augburg',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-04-14 06:51:00','2026-04-14 06:54:06',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-248-service:91.99.183.160','Ck38ojHZ0zVrzVCocCOloLuf');
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`agencyservice`@`%`*/ /*!50003 TRIGGER `agencyservice`.`agency_update` BEFORE UPDATE ON `agencyservice`.`agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `agency_postcode_range`
--

DROP TABLE IF EXISTS `agency_postcode_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency_postcode_range` (
  `id` bigint(21) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `agency_id` bigint(21) NOT NULL,
  `postcode_from` varchar(5) NOT NULL,
  `postcode_to` varchar(5) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `agency_postcode_range_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_postcode_range`
--

LOCK TABLES `agency_postcode_range` WRITE;
/*!40000 ALTER TABLE `agency_postcode_range` DISABLE KEYS */;
INSERT INTO `agency_postcode_range` VALUES
(221,1,237,'00000','99999','2026-03-13 17:29:37','2026-03-13 17:29:37'),
(224,0,239,'00000','99999','2026-03-13 20:00:27','2026-03-13 20:00:27'),
(225,1,240,'00000','99999','2026-03-13 20:01:55','2026-03-13 20:01:55'),
(229,1,241,'00000','99999','2026-03-24 12:51:16','2026-03-24 12:51:16'),
(233,20,244,'00000','99999','2026-03-30 12:11:46','2026-03-30 12:11:46'),
(234,20,243,'24103','24159','2026-03-30 12:11:52','2026-03-30 12:11:52'),
(236,21,245,'00000','99999','2026-03-31 13:54:03','2026-03-31 13:54:03'),
(242,21,246,'00000','99999','2026-03-31 13:59:53','2026-03-31 13:59:53'),
(243,1,238,'10115','10117','2026-04-10 10:27:06','2026-04-10 10:27:06'),
(244,1,238,'10000','10999','2026-04-10 10:27:06','2026-04-10 10:27:06'),
(245,1,247,'12040','12043','2026-04-10 10:46:47','2026-04-10 10:46:47'),
(248,22,248,'00000','99999','2026-04-14 06:54:06','2026-04-14 06:54:06');
/*!40000 ALTER TABLE `agency_postcode_range` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`agencyservice`@`%`*/ /*!50003 TRIGGER `agencyservice`.`agency_postcode_range_update` BEFORE UPDATE ON `agencyservice`.`agency_postcode_range` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `agency_topic`
--

DROP TABLE IF EXISTS `agency_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency_topic` (
  `id` bigint(21) NOT NULL,
  `agency_id` bigint(21) NOT NULL,
  `topic_id` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `agency_topic_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_topic`
--

LOCK TABLES `agency_topic` WRITE;
/*!40000 ALTER TABLE `agency_topic` DISABLE KEYS */;
INSERT INTO `agency_topic` VALUES
(334,237,3,'2026-03-13 17:29:36','2026-03-13 17:29:36'),
(337,239,3,'2026-03-13 20:00:26','2026-03-13 20:00:26'),
(338,240,3,'2026-03-13 20:01:54','2026-03-13 20:01:54'),
(341,241,2,'2026-03-24 12:51:16','2026-03-24 12:51:16'),
(348,244,2,'2026-03-30 12:11:46','2026-03-30 12:11:46'),
(349,243,3,'2026-03-30 12:11:52','2026-03-30 12:11:52'),
(350,243,2,'2026-03-30 12:11:52','2026-03-30 12:11:52'),
(353,245,3,'2026-03-31 13:54:02','2026-03-31 13:54:02'),
(354,245,1,'2026-03-31 13:54:02','2026-03-31 13:54:02'),
(360,246,2,'2026-03-31 13:59:53','2026-03-31 13:59:53'),
(361,246,1,'2026-03-31 13:59:53','2026-03-31 13:59:53'),
(362,246,3,'2026-03-31 13:59:53','2026-03-31 13:59:53'),
(363,238,1,'2026-04-10 10:27:06','2026-04-10 10:27:06'),
(364,238,3,'2026-04-10 10:27:06','2026-04-10 10:27:06'),
(365,247,2,'2026-04-10 10:46:47','2026-04-10 10:46:47'),
(368,248,3,'2026-04-14 06:54:06','2026-04-14 06:54:06');
/*!40000 ALTER TABLE `agency_topic` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`agencyservice`@`%`*/ /*!50003 TRIGGER `agencyservice`.`agency_topic_update` BEFORE UPDATE ON `agencyservice`.`agency_topic` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `diocese`
--

DROP TABLE IF EXISTS `diocese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `diocese` (
  `id` bigint(21) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_old` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diocese`
--

LOCK TABLES `diocese` WRITE;
/*!40000 ALTER TABLE `diocese` DISABLE KEYS */;
/*!40000 ALTER TABLE `diocese` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`agencyservice`@`%`*/ /*!50003 TRIGGER `agencyservice`.`diocese_update` BEFORE UPDATE ON `agencyservice`.`diocese` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'agencyservice'
--

--
-- Dumping routines for database 'agencyservice'
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
