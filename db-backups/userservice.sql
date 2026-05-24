/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: userservice
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
-- Current Database: `userservice`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `userservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `userservice`;

--
-- Sequence structure for `sequence_admin_agency`
--

DROP SEQUENCE IF EXISTS `sequence_admin_agency`;
CREATE SEQUENCE `sequence_admin_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_admin_agency`, 100100, 0);

--
-- Sequence structure for `sequence_chat`
--

DROP SEQUENCE IF EXISTS `sequence_chat`;
CREATE SEQUENCE `sequence_chat` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_chat`, 800, 0);

--
-- Sequence structure for `sequence_chat_agency`
--

DROP SEQUENCE IF EXISTS `sequence_chat_agency`;
CREATE SEQUENCE `sequence_chat_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_chat_agency`, 700, 0);

--
-- Sequence structure for `sequence_consultant_agency`
--

DROP SEQUENCE IF EXISTS `sequence_consultant_agency`;
CREATE SEQUENCE `sequence_consultant_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_consultant_agency`, 100900, 0);

--
-- Sequence structure for `sequence_consultant_mobile_token`
--

DROP SEQUENCE IF EXISTS `sequence_consultant_mobile_token`;
CREATE SEQUENCE `sequence_consultant_mobile_token` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_consultant_mobile_token`, 0, 0);

--
-- Sequence structure for `sequence_session`
--

DROP SEQUENCE IF EXISTS `sequence_session`;
CREATE SEQUENCE `sequence_session` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_session`, 102500, 0);

--
-- Sequence structure for `sequence_session_data`
--

DROP SEQUENCE IF EXISTS `sequence_session_data`;
CREATE SEQUENCE `sequence_session_data` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_session_data`, 100, 0);

--
-- Sequence structure for `sequence_session_topic`
--

DROP SEQUENCE IF EXISTS `sequence_session_topic`;
CREATE SEQUENCE `sequence_session_topic` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_session_topic`, 100000, 0);

--
-- Sequence structure for `sequence_user_agency`
--

DROP SEQUENCE IF EXISTS `sequence_user_agency`;
CREATE SEQUENCE `sequence_user_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_user_agency`, 100, 0);

--
-- Sequence structure for `sequence_user_chat`
--

DROP SEQUENCE IF EXISTS `sequence_user_chat`;
CREATE SEQUENCE `sequence_user_chat` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_user_chat`, 0, 0);

--
-- Sequence structure for `sequence_user_mobile_token`
--

DROP SEQUENCE IF EXISTS `sequence_user_mobile_token`;
CREATE SEQUENCE `sequence_user_mobile_token` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_user_mobile_token`, 0, 0);

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
('initSql-tables','initialSetup','db/changelog/changeset/0001_initsql/initSql.xml','2025-09-06 15:03:28',1,'EXECUTED','8:31cd34a0d7a21ad623a6157784a3183a','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('initSql-trigger','initialSetup','db/changelog/changeset/0001_initsql/initSql.xml','2025-09-06 15:03:28',2,'EXECUTED','8:bde546e00bcb5de62e5a1253ea884558','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-1323-monitoringKeys','COBH-1323','db/changelog/changeset/0002_monitoringKeys_feedbackChatClumn/0002_changeSet.xml','2025-09-06 15:03:28',3,'EXECUTED','8:858f9493e5916c5a4526b740ea9a228f','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-1323-feedbackChatColumn','COBH-1323','db/changelog/changeset/0002_monitoringKeys_feedbackChatClumn/0002_changeSet.xml','2025-09-06 15:03:28',4,'EXECUTED','8:c92036b3cd9574432ba0dd564d7235d0','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-1619-user_attribute_languageFormal','COBH-1619','db/changelog/changeset/0003_user_attribute_languageFormal/0003_changeSet.xml','2025-09-06 15:03:29',5,'EXECUTED','8:3afe67e527dd73e46905dba35e5b8c63','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-1619-consultant_attribute_languageFormal','COBH-1619','db/changelog/changeset/0004_consultant_attribute_languageFormal/0004_changeSet.xml','2025-09-06 15:03:29',6,'EXECUTED','8:17b207009da55a0872ef47ba4ba18e5e','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-1859-session_attribute_isMonitoring','COBH-1859','db/changelog/changeset/0005_session_attribute_isMonitoring/0005_changeSet.xml','2025-09-06 15:03:29',7,'EXECUTED','8:f3a2d83474bf3be322257a88f6b20605','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-2046_database_extension_for_chat','COBH-2046','db/changelog/changeset/0006_chat/0006_changeSet.xml','2025-09-06 15:03:29',8,'EXECUTED','8:63d1ba4a519c96c88b9f32889c89a30d','sqlFile; sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-2046_user_agency_relation','COBH-2046','db/changelog/changeset/0007_user_agency_relation/0007_changeSet.xml','2025-09-06 15:03:29',9,'EXECUTED','8:31d8adf566a9752541491bae3ae02b34','sqlFile; sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-2046_chat_extension','COBH-2046','db/changelog/changeset/0008_chat_extension/0008_changeSet.xml','2025-09-06 15:03:29',10,'EXECUTED','8:3562956a36f6f6d6d42cf59a388fba86','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-2345_consultant_user_extension','COBH-2345','db/changelog/changeset/0009_delete_timestamp_for_user_consultant/0009_changeSet.xml','2025-09-06 15:03:29',11,'EXECUTED','8:1c1dcbfbd6b49c858ddda0320ed552a3','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-2345_consultant_user_extension','COBH-2345','db/changelog/changeset/0010_delete_timestamp_for_consultant_agency/0010_changeSet.xml','2025-09-06 15:03:29',12,'EXECUTED','8:7669cc761ac17d80ad7fc7aa84da70c6','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-3498_user_mobile_token','COBH-3498','db/changelog/changeset/0011_add_mobile_token_for_user/0011_changeSet.xml','2025-09-06 15:03:29',13,'EXECUTED','8:28d510e722c6db790e8e1c66c1214868','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-3674_add_type_to_session','COBH-3674','db/changelog/changeset/0012_add_type_to_session/0012_changeSet.xml','2025-09-06 15:03:29',14,'EXECUTED','8:e2bd66b116f2b5fe8b598ff0387c1723','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-3932_assign_date','COBH-3932','db/changelog/changeset/0013_add_assign_date_to_session/0013_changeSet.xml','2025-09-06 15:03:29',15,'EXECUTED','8:75e1921948515d1fd530fbb8bdabee8d','sqlFile; sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-3885','COBH-3885','db/changelog/changeset/0014_add_is_peer_chat_to_session/0014_changeSet.xml','2025-09-06 15:03:29',16,'EXECUTED','8:aff0af0d5880769496c09a471b47ef98','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-3944','COBH-3944','db/changelog/changeset/0015_add_app_mobile_token/0015_changeSet.xml','2025-09-06 15:03:29',17,'EXECUTED','8:bf2bfebc2ec6a41e074c12364c2c9152','sqlFile; sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('DDO-64','DDO-64','db/changelog/changeset/0016_add_consultant_languages/0016_changeSet.xml','2025-09-06 15:03:29',18,'EXECUTED','8:dbac6662ad4dcb7a723ed63aef4dc0ae','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('DDO-85','DDO-85','db/changelog/changeset/0017_add_session_language/0017_changeSet.xml','2025-09-06 15:03:29',19,'EXECUTED','8:64e9446087efc05e3197634c47d0cd57','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('COBH-4158','COBH-4158','db/changelog/changeset/0018_add_2fa_encourage/0018_changeSet.xml','2025-09-06 15:03:29',20,'EXECUTED','8:11735e08f77c4ec84059273eee1e61bb','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('tenantId','aalicic','db/changelog/changeset/0019_tenant_id/0019_changeSet.xml','2025-09-06 15:03:29',21,'EXECUTED','8:2736d2fa783ebf9510e6dce5c4cc4427','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-138','OBI-138','db/changelog/changeset/0020_add_appointments/0020_changeSet.xml','2025-09-06 15:03:29',22,'EXECUTED','8:2ca8b6147ecb733d6e4ec1b43bfd293d','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-172','OBI-172','db/changelog/changeset/0021_index_for_consultant_search/0021_changeSet.xml','2025-09-06 15:03:29',23,'EXECUTED','8:e0310caa9bbdae1b9a1bff5d11c3d8eb','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-172','OBI-172','db/changelog/changeset/0022_delete_date_for_consultant_search/0022_changeSet.xml','2025-09-06 15:03:29',24,'EXECUTED','8:5d85d6c75c8cb00d291c0ea9f011f268','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('consultantStatus','aalicic','db/changelog/changeset/0023_consultant_status/0023_changeSet.xml','2025-09-06 15:03:29',25,'EXECUTED','8:0508c7e46cc30939a8f109ce40640c8a','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('consultantWalkThrough','aalicic','db/changelog/changeset/0024_consultant_walk_through/0024_changeSet.xml','2025-09-06 15:03:29',26,'EXECUTED','8:88c0eaea08b30d7053e5683f0aca6be2','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-408','OBI-408','db/changelog/changeset/0025_add_notify_enquiries_repeating/0025_changeSet.xml','2025-09-06 15:03:29',27,'EXECUTED','8:d08ed605fa32a1bc2a17fa6f373fd4f7','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-369','OBI-369','db/changelog/changeset/0026_add_notify_new_messages_from_advice_seeker/0026_changeSet.xml','2025-09-06 15:03:29',28,'EXECUTED','8:085be0dd0fd45628ec7cec2091bd61ec','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('consultantStatus','aalicic','db/changelog/changeset/0027_consultant_agency_status/0027_changeSet.xml','2025-09-06 15:03:29',29,'EXECUTED','8:6ebedd9f1d81a75c839a6ebb513c67e3','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('sessionMainTopic','tkuzynow','db/changelog/changeset/0028_session_main_topic/0028_changeSet.xml','2025-09-06 15:03:29',30,'EXECUTED','8:2f427e7485ba188d7678dde417494c77','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('sessionMainTopic','tkuzynow','db/changelog/changeset/0029_session_gender_and_age/0029_changeSet.xml','2025-09-06 15:03:29',31,'EXECUTED','8:666c8e087931b19564cb1c3dc0dc7f8a','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('sessionMainTopic','tkuzynow','db/changelog/changeset/0030_session_counsellingrelation_and_topics/0030_changeSet.xml','2025-09-06 15:03:29',32,'EXECUTED','8:3961a67011cca42d0315da03b84ddc8c','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-552','OBI-552','db/changelog/changeset/0031_add_preferred_language/0031_changeSet.xml','2025-09-06 15:03:29',33,'EXECUTED','8:5b692d7a9ecd966e676bc6b4301c8a12','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('VIC-284-chat-consulting-type-optional','patric-dosch-vi','db/changelog/changeset/0032_chat_consulting_type_optional/0032_changeSet.xml','2025-09-06 15:03:29',34,'EXECUTED','8:82f229e7a1f41f817a2fdac8ba84f959','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('VIC-838-chat-user-relation','patric-dosch-vi','db/changelog/changeset/0033_chat_add_user_chat_relation/0033_changeSet.xml','2025-09-06 15:03:29',35,'EXECUTED','8:ec6be7e23257a078e1ba93eb4bd208b5','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('OBI-650','OBI-650','db/changelog/changeset/0034_add_consultant_directly_set/0034_changeSet.xml','2025-09-06 15:03:29',36,'EXECUTED','8:37c9d29fe7857c0c07d83e114241bec1','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('VIC-2021','VIC-2021','db/changelog/changeset/0035_admin/0035_changeSet.xml','2025-09-06 15:03:29',37,'EXECUTED','8:f82e03b01494c84c86e8dbbfda1ae0ce','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('VIC-2021','idrissnaji','db/changelog/changeset/0036_index_for_admin_search/0036_changeSet.xml','2025-09-06 15:03:29',38,'EXECUTED','8:79ec7be9756bdad9875cdcaa4aec01d3','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('VIC-xxxx','aalicic','db/changelog/changeset/0037_user_confirmation_fields/0037_changeSet.xml','2025-09-06 15:03:29',39,'EXECUTED','8:0d221081891c4f9e1d6820908f8e0624','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('VIC-2252','aalicic','db/changelog/changeset/0038_consultant_confirmation_fields/0038_changeSet.xml','2025-09-06 15:03:29',40,'EXECUTED','8:b64a70464efb327c4c3f3ed053085a11','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('sessionMainTopicType','OBI','db/changelog/changeset/0039_session_main_topic_type/0039_changeSet.xml','2025-09-06 15:03:29',41,'EXECUTED','8:621b95375602028927c2f4b1c79162e9','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('addUserNotificationSettings','tkuzynow','db/changelog/changeset/0040_add_notification_settings/0040_changeSet.xml','2025-09-06 15:03:29',42,'EXECUTED','8:58343c965d75a2b6e1210dbe1f524c89','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('migrateUserNotificationSettings','tkuzynow','db/changelog/changeset/0041_migrate_notification_settings/0041_changeSet.xml','2025-09-06 15:03:29',43,'EXECUTED','8:c3d9606d45accbdc6dfeac1c0dd015f2','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('remove_session_monitoring_and_option','IoannisLafiotis','db/changelog/changeset/0042_remove_session_monitoring_and_option/0042_changeSet.xml','2025-09-06 15:03:29',44,'EXECUTED','8:0206790048e4caccafd49aed72c33565','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('migrateUserNotificationSettings','tkuzynow','db/changelog/changeset/0043_add_booking_id_to_appointment/0043_changeSet.xml','2025-09-06 15:03:29',45,'EXECUTED','8:00b480dde7bf7032d2fbdd3dbfb2c647','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('migrateUserNotificationSettings','tkuzynow','db/changelog/changeset/0044_add_referer_to_user/0044_changeSet.xml','2025-09-06 15:03:29',46,'EXECUTED','8:8929950a4598e810156142658f8b55f5','sqlFile','',NULL,'4.9.1',NULL,NULL,'7171008640'),
('migrateUserNotificationSettings','tkuzynow','db/changelog/changeset/0045_add_hint_and_create_date_to_chat/0045_changeSet.xml','2025-09-06 15:34:37',47,'EXECUTED','8:ee3f381e5bd033b63acda0ee5f269df5','sqlFile','',NULL,'4.9.1',NULL,NULL,'7172877548'),
('removeFeedbackRelatedColumns','leandroSilva','db/changelog/changeset/0046_remove_feeback_related_columns/0046_changeSet.xml','2025-10-26 11:02:31',48,'EXECUTED','8:993c04d8183c8c4dbf56ff7fcba3814a','sqlFile; sqlFile; sqlFile','',NULL,'4.9.1',NULL,NULL,'1476551342'),
('addMatrixPasswordColumn','caritas','db/changelog/changeset/0047_add_matrix_password/0047_changeSet.xml','2025-10-26 11:02:31',49,'EXECUTED','8:4971454cc3a92382468e233483b5c29c','sqlFile; sqlFile','',NULL,'4.9.1',NULL,NULL,'1476551342');
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(36) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(6) NOT NULL,
  `rc_user_id` varchar(255) DEFAULT NULL,
  `id_old` bigint(21) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `idx_username_first_name_last_name_email` (`username`,`first_name`,`last_name`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES
('0ba195a0-fa29-4a55-a2f0-ee50e2704fb6',4,'caritas-frankfurt-admin','Caritas','Frankfurt','caritas-frankfurt-admin@oriso-dev.site','TENANT',NULL,NULL,'2026-03-07 06:45:04','2026-03-07 06:45:04'),
('0c23356e-67ec-41a6-8905-d185fe867e8e',1,'caritas-agency-admin','Caritas','AgencyAdmin','caritas-agency-admin@oriso-dev.site','AGENCY',NULL,NULL,'2026-04-21 18:54:54','2026-04-21 18:54:54'),
('1321383d-8f44-40d6-bc24-41bc37d8a20d',0,'hedgeond','Hakeem','Edgeon','hedgeond@miitbeian.gov.cn','SUPER','fdtjKz',NULL,'2022-09-21 16:27:15','2022-09-03 20:41:30'),
('13885432-21d8-4d4a-8c02-312d159ed635',0,'lballs26','Lucky','Balls','lballs26@nasa.gov','SUPER','azDK7zuzMW',NULL,'2022-02-12 15:17:31','2022-02-20 23:26:52'),
('17f459ce-58af-456d-84cf-2f44c9404ef7',0,'caritas','Caritas','Superadmin','caritas-superadmin@oriso-dev.site','SUPER',NULL,NULL,'2026-03-13 16:04:34','2026-03-13 16:04:34'),
('1cb9dc15-b817-441e-8070-64d770681acd',0,'closanoh','Carlene','Losano','closanoh@nbcnews.com','SUPER','r3YXo6r',NULL,'2022-09-29 20:49:52','2022-07-18 03:28:04'),
('1d6072cf-ed88-4ec4-b4e6-0401d98dabfc',0,'istollenwerck2l','Isadore','Stollenwerck','istollenwerck2l@fc2.com','SUPER','ftUD0Tw5RkRr',NULL,'2022-10-06 10:25:46','2021-12-28 15:14:14'),
('1e82f788-d6ad-4ab7-ab1d-afd3119ea9ad',0,'dturner2k','Domenico','Turner','dturner2k@accuweather.com','SUPER','PvhEk1oL8IL',NULL,'2022-10-14 13:06:44','2022-07-13 12:53:42'),
('1f6e4bec-2929-4cbc-9073-e4a9757683d4',0,'cbriant1g','Cookie','Briant','cbriant1g@cnbc.com','SUPER','8FbOcxB',NULL,'2022-08-01 16:41:09','2022-06-19 03:06:29'),
('201b961d-51e9-4eff-8981-60d2a0edb6a8',1,'technical','Technical','User','technical@gmail.com','TENANT',NULL,NULL,'2025-11-19 02:00:47','2025-11-19 02:00:47'),
('20f09062-f751-4c5d-9e9a-2a5cb7a6ab87',1,'caritas-berlin-admin','Berlin','Admin','caritas-berlin-admin@oriso-dev.site','TENANT',NULL,NULL,'2026-03-03 04:44:43','2026-03-03 04:44:43'),
('2b5e3a9f-ff69-4901-b4b9-7b99713a99b2',0,'twieldi','Thacher','Wield','twieldi@latimes.com','SUPER','oXIYmz7M',NULL,'2022-08-29 19:41:17','2022-08-19 11:37:56'),
('30026250-79d9-41d1-864f-acf0acd1a178',3,'caritas-muenchen-admin','Muenchen','Admin','caritas-muenchen-admin@oriso-dev.site','TENANT',NULL,NULL,'2026-03-03 05:36:50','2026-03-03 05:36:50'),
('3349b8ca-2f35-4337-ba7e-a6d20517bfd4',20,'caritas_traeger_kiel_admin','Olga','Musterfrau','fg+caritas_traeger_kiel_admin@dreambau.com','TENANT',NULL,NULL,'2026-03-30 12:02:54','2026-03-30 12:02:54'),
('3755c0f1-f476-4028-b439-b1cdb23a54cb',2,'caritas-hamburg-admin','Hamburg','Admin','caritas-hamburg-admin@oriso-dev.site','TENANT',NULL,NULL,'2026-03-03 04:44:43','2026-03-03 04:44:43'),
('3f5fc28e-f3ff-4ac2-a7d4-afd548d7d903',0,'jscemp18','Jeanna','Scemp','jscemp18@altervista.org','SUPER','CdfjQolA',NULL,'2022-01-15 19:46:28','2022-07-07 19:54:05'),
('3fac8a86-6720-4fdc-ad3e-324222b27a8c',0,'efrancescuccio11','Eldridge','Francescuccio','efrancescuccio11@economist.com','SUPER','ItdmqEfh',NULL,'2022-01-09 23:34:17','2022-03-16 17:45:13'),
('4077a940-2de7-4426-86e8-790a0258e570',1,'enc.MZUXE43UORSXG5A.','first','test','firsttest@gmail.com','AGENCY',NULL,NULL,'2026-04-21 18:59:11','2026-04-21 18:59:11'),
('514478e1-7340-4473-9a87-cd7e3a3c9b3d',1,'enc.ONSWG33OMR2GK43U','second','test','secondtest@gmail.com','AGENCY',NULL,NULL,'2026-04-22 05:50:50','2026-04-22 05:50:50'),
('53dde74b-fba4-414d-a140-a7634418dcf2',0,'baguirre1z','Brigham','Aguirre','baguirre1z@cpanel.net','SUPER','Mc4ACcSoYw',NULL,'2022-08-21 11:50:43','2022-03-25 09:16:53'),
('56b2dae4-5aed-467b-be3c-b3c1a5666b0e',0,'lsurcombe1t','Lauraine','Surcombe','lsurcombe1t@deliciousdays.com','SUPER','ojpeKIQP',NULL,'2022-08-07 09:53:38','2022-08-06 19:34:51'),
('595ce81f-3449-45da-8740-6578f2a0f4d4',0,'struckell1e','Somerset','Truckell','struckell1e@prweb.com','SUPER','RN10adqNrk',NULL,'2022-08-02 08:55:02','2022-08-14 01:15:02'),
('5e835ff6-4729-4dc9-aa80-ee72e57c1771',0,'lbrakef','Levin','Brake','lbrakef@globo.com','SUPER','ai3j129gFmz',NULL,'2022-07-18 20:41:08','2022-01-01 10:09:46'),
('6237dbd3-525d-49b2-9e7d-10cdb7a3b532',23,'traeger_cartias','Traeger','Caritas 14apr','traeger_cartias@dreambau.com','TENANT',NULL,NULL,'2026-04-14 07:21:07','2026-04-14 07:21:07'),
('647b9fa5-a50b-438a-9a8a-2008e25e718c',0,'acaldaroy','Angelia','Caldaro','acaldaroy@gnu.org','SUPER','FXwcfP',NULL,'2022-04-07 19:05:48','2022-03-24 07:27:59'),
('6c034bd4-1039-440e-8bfa-1860647247ce',0,'jheineke24','James','Heineke','jheineke24@example.com','SUPER','0H7CL3q',NULL,'2022-04-18 10:14:21','2022-08-21 04:03:05'),
('6c6c83f8-f7fb-4289-8f9c-0f2b4f5c0a7d',0,'gkinrade1i','Gerhardine','Kinrade','gkinrade1i@squidoo.com','SUPER','AdZibIDqoP',NULL,'2021-12-07 18:48:01','2022-03-07 15:20:26'),
('7332e31c-f6fe-4ef4-a456-545949f223b5',0,'ltrusler17','Lilla','Trusler','ltrusler17@unc.edu','SUPER','9ccHrPk',NULL,'2022-03-15 11:47:46','2022-10-16 16:41:00'),
('7e092a92-35ae-4ab8-9de6-aeeae4cda702',0,'saim2d','Saunderson','Aim','saim2d@seattletimes.com','SUPER','0upvw62neeD',NULL,'2022-10-10 20:59:24','2022-05-03 21:39:26'),
('81797270-0ead-47de-b3b3-be26c3d10f10',22,'caritas_traeger','Carlotte','Carimen','caritas_traeger@dreambau.com','TENANT',NULL,NULL,'2026-04-14 06:48:47','2026-04-14 06:48:47'),
('8562a978-4392-4666-b5be-eb1cf56e941a',21,'caritas-wismar-mandant','Daniel','von Hohenstein','fg+caritas-wismar-mandant@dreambau.com','TENANT',NULL,NULL,'2026-03-31 13:10:12','2026-03-31 13:10:12'),
('85c8cab9-fd43-41a1-9c69-dfd8b4a26dea',0,'lway1a','Linzy','Way','lway1a@yahoo.co.jp','SUPER','OjzfrJ',NULL,'2022-10-17 10:59:38','2021-12-07 01:59:44'),
('8b549d79-28c4-400f-b28d-f64868627cdd',0,'trodgman2b','Thaddus','Rodgman','trodgman2b@plala.or.jp','SUPER','kGA7nnhyDxjp',NULL,'2022-02-05 07:03:49','2022-01-18 07:51:48'),
('8e465f82-5c0f-483a-b500-b3b2074dd001',0,'mtarpey1v','Merle','Tarpey','mtarpey1v@zimbio.com','SUPER','DVEODtx5EcB',NULL,'2022-08-11 23:58:46','2022-03-28 17:39:46'),
('951f933d-e54a-4091-8f15-f62b9f0fa9bb',0,'eoretw','Elysha','Oret','eoretw@oakley.com','SUPER','x7kgiXO',NULL,'2022-01-26 21:30:47','2022-03-17 06:30:30'),
('98dc41bc-42db-4c04-aa8b-fec174ff412a',0,'lomalley15','Lemmie','O\'Malley','lomalley15@digg.com','SUPER','0R7rUc',NULL,'2022-06-04 11:38:21','2022-11-08 14:20:18'),
('9fb9dd39-0990-4516-a847-13f713493722',0,'mdimondp','Maurene','Dimond','mdimondp@4shared.com','SUPER','DhGP5DRZ',NULL,'2022-05-17 03:13:20','2022-06-03 21:06:01'),
('a5729dc1-9ad5-498a-a1b7-47650fa89b8e',0,'rhaverson1y','Robb','Haverson','rhaverson1y@upenn.edu','SUPER','3nceQflghD7',NULL,'2022-04-28 22:04:20','2022-08-26 05:00:10'),
('a7d9548b-ce8b-4643-9f9e-5c6d8a28164d',0,'ebenzi2m','Eberhard','Benzi','ebenzi2m@github.com','SUPER','Tl0TI8P',NULL,'2022-09-24 11:07:14','2022-02-04 18:10:10'),
('aa3be4a9-6242-4161-867f-33fc122993e3',0,'lwasbrought','Lilli','Wasbrough','lwasbrought@yellowpages.com','SUPER','EJK1iqL',NULL,'2022-10-07 14:34:13','2022-10-07 07:40:17'),
('b035e920-45ff-4c7b-b717-e5bfcb23f653',0,'lupshall1h','Lethia','Upshall','lupshall1h@privacy.gov.au','SUPER','tsxc5T9DSNQ7',NULL,'2022-05-12 04:47:16','2022-01-06 13:20:28'),
('b4fd870e-95cb-4b5c-9d24-99757d220a72',0,'sedghinn1b','Sheff','Edghinn','sedghinn1b@examiner.com','SUPER','Lw98Wy',NULL,'2021-12-23 00:54:41','2022-04-29 02:55:30'),
('c0a2779a-6093-451e-9859-b79915acb82f',1,'enc.ONUGC6TJMEWXIZLTOQ......','shazia','kausar','shazia-test@gmail.com','AGENCY',NULL,NULL,'2026-04-22 09:47:41','2026-04-22 09:47:41'),
('d498e192-c393-4162-ab1d-da6564747d9d',0,'jbernardoni13','Jarib','Bernardoni','jbernardoni13@artisteer.com','SUPER','dxENKq',NULL,'2022-02-15 01:47:49','2021-12-14 13:35:54'),
('dc18fabe-c0bf-442a-ae35-a870cd88bb00',0,'averonique1n','Andonis','Veronique','averonique1n@omniture.com','SUPER','QPzwe7O5T1',NULL,'2022-05-12 04:03:20','2022-01-12 21:14:33'),
('e0d9e48f-a377-4863-a5c9-9b0c81af5a3f',0,'tpray10','Tiphany','Pray','tpray10@chronoengine.com','SUPER','jWUJZ2bmH8PW',NULL,'2022-05-09 21:40:42','2022-11-10 06:04:30'),
('e15e4dff-7a0d-49c6-9c13-11c39ee35053',0,'rmacdavitt2c','Raoul','MacDavitt','rmacdavitt2c@sohu.com','SUPER','PJOI71',NULL,'2022-08-22 11:42:56','2022-05-28 00:53:45'),
('e60d9f21-ef03-4eeb-a2c6-8b0dce4e1d50',0,'owithrington2o','Odelinda','Withrington','owithrington2o@ed.gov','SUPER','LcIyZfV0P7',NULL,'2022-11-24 11:26:32','2022-06-18 20:51:36'),
('e8097387-13ae-4042-a949-afb09f8351d1',0,'kcoffelt2q','Koren','Coffelt','kcoffelt2q@opensource.org','SUPER','p8HI0E73z',NULL,'2022-10-14 02:34:36','2022-07-01 01:40:50'),
('ed927ee8-4b0d-4e28-8ad2-3e68d1990e5f',0,'epughsley19','Evita','Pughsley','epughsley19@miitbeian.gov.cn','SUPER','aOihct4la',NULL,'2022-09-01 02:17:09','2022-04-03 06:32:02'),
('ee88be00-4762-47b7-ae30-351398e759f1',0,'jcartmailv','Joachim','Cartmail','jcartmailv@samsung.com','SUPER','L9LQmDHmu',NULL,'2022-09-09 11:21:03','2021-12-08 07:03:20'),
('ff46488b-ac2a-4042-8752-e0f6dc722b84',0,'ppithcock2g','Pammy','Pithcock','ppithcock2g@umich.edu','SUPER','F8znYd',NULL,'2022-01-24 17:40:39','2022-06-19 01:35:13');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_agency`
--

DROP TABLE IF EXISTS `admin_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_agency` (
  `id` bigint(21) unsigned NOT NULL,
  `admin_id` varchar(36) NOT NULL,
  `agency_id` bigint(21) unsigned NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_agency_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_agency`
--

LOCK TABLES `admin_agency` WRITE;
/*!40000 ALTER TABLE `admin_agency` DISABLE KEYS */;
INSERT INTO `admin_agency` VALUES
(100000,'0c23356e-67ec-41a6-8905-d185fe867e8e',237,'2026-04-21 18:55:17','2026-04-21 18:55:17'),
(100001,'4077a940-2de7-4426-86e8-790a0258e570',237,'2026-04-21 18:59:11','2026-04-21 18:59:11'),
(100002,'514478e1-7340-4473-9a87-cd7e3a3c9b3d',237,'2026-04-22 05:50:50','2026-04-22 05:50:50'),
(100003,'c0a2779a-6093-451e-9859-b79915acb82f',237,'2026-04-22 09:47:41','2026-04-22 09:47:41');
/*!40000 ALTER TABLE `admin_agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agency_invite_link`
--

DROP TABLE IF EXISTS `agency_invite_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `agency_invite_link` (
  `id` bigint(21) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `tenant_id` bigint(21) unsigned NOT NULL,
  `agency_id` bigint(21) unsigned NOT NULL,
  `consulting_type_id` int(11) DEFAULT NULL,
  `created_by_user_id` varchar(36) NOT NULL,
  `created_by_username` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `expires_at` datetime DEFAULT NULL,
  `used_at` datetime DEFAULT NULL,
  `used_by_session_id` bigint(21) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_token` (`token`),
  KEY `idx_agency` (`agency_id`),
  KEY `idx_tenant` (`tenant_id`),
  KEY `idx_created_by` (`created_by_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency_invite_link`
--

LOCK TABLES `agency_invite_link` WRITE;
/*!40000 ALTER TABLE `agency_invite_link` DISABLE KEYS */;
INSERT INTO `agency_invite_link` VALUES
(1,'Bdt2N4E4UDgR9ELVtRsnbhMZCmC-Zz4X',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 19:35:17','2026-05-21 19:35:17',NULL,NULL,'ACTIVE'),
(2,'VIfDXztoOJ-GtLyh8vK8FqChg_Ppdke7',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 19:42:11','2026-04-28 19:42:11',NULL,NULL,'ACTIVE'),
(3,'hQm0QNHmNO9s9I1KW216iyEh7xSQMWjs',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 19:44:19','2026-04-28 19:44:19',NULL,NULL,'ACTIVE'),
(4,'t5wvahxOPAI7rqGPa3J6FtNrgU6a8pnA',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 19:57:00','2026-04-28 19:57:00',NULL,NULL,'ACTIVE'),
(5,'pQLodUSLZtapun9khW3jdlFZWnjOcx1V',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 19:57:41','2026-04-28 19:57:41',NULL,NULL,'ACTIVE'),
(6,'h6zyETVWrdePBME-AXNisu7KxgKKv_NA',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 19:59:36','2026-04-28 19:59:36',NULL,NULL,'ACTIVE'),
(7,'OAnwYhh3fbQOvvTgze2FKlp5e958VWOD',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 20:13:14','2026-04-28 20:13:14','2026-04-21 20:13:14',NULL,'USED'),
(8,'eqs1vedQc2nzzD3nJXtFj3qbOyqnh_rD',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-21 20:33:24','2026-05-21 20:33:24',NULL,NULL,'ACTIVE'),
(9,'oLq_L0vIisJStyYB1i69IoFa6KrmmvLe',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 04:29:09','2026-05-22 04:29:09','2026-04-22 04:49:03',NULL,'USED'),
(10,'swVREPJ-gqqIJy7Up2KzKGOCKxrIgaz_',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 04:50:06','2026-04-23 04:50:06','2026-04-22 04:50:06',NULL,'USED'),
(11,'2nIBxm864GNhdU4IVNpLSqZMlfiDOZu2',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 04:53:31','2026-05-22 04:53:31','2026-04-22 04:54:02',NULL,'USED'),
(12,'R2r9XnAfdrQgVRkg9Lu-5xb08V7modSC',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:07:35','2026-04-23 05:07:35','2026-04-22 05:07:36',NULL,'USED'),
(13,'Ffkt-vVE4UMD7fEq-0asFNNgdV5nDKUA',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:08:37','2026-04-23 05:08:37','2026-04-22 05:08:37',NULL,'USED'),
(14,'wtanpvzvf_BCDc_99kswD9MMgiooRuR1',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:08:55','2026-04-23 05:08:55','2026-04-22 05:08:55',NULL,'USED'),
(15,'TK-Eo2U9Yx_dC768mBMTMsR96zA5jM8R',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:12:52','2026-05-22 05:12:52','2026-04-22 05:13:13',NULL,'USED'),
(16,'sok0Z9d82-X1y4hMgfBJ3TwUJ915QsO6',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:21:12','2026-04-23 05:21:12','2026-04-22 05:21:12',NULL,'USED'),
(17,'SWDOSROSVYX120DcXrigvr9cJ3cE-y4_',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:22:16','2026-05-22 05:22:16','2026-04-22 05:22:24',NULL,'USED'),
(18,'bhLRM2jIQdi1IE8Y48vYGZ_O8G8Zr9kW',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 05:53:07','2026-05-22 05:53:07','2026-04-22 05:53:30',NULL,'USED'),
(19,'1VrzBuDp34sYjaXY_Aht8tAfxdA8RCnI',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 06:12:44','2026-05-22 06:12:44','2026-04-22 08:23:00',NULL,'USED'),
(20,'9yDi8xOow0olXdtPr29oqxLIL_f0WRhK',1,237,1,'fdd31d79-8285-4ab3-b042-654dacd6d93d','caritas-berlin-admin','2026-04-22 08:22:27','2026-05-22 08:22:27','2026-04-22 08:22:50',NULL,'USED'),
(21,'cxsfKzF6j8AcrLdIC_as7RkO-3yiGl6K',1,237,1,'37cd1b3e-b654-4b87-a15e-37e50ad916cb','caritas','2026-04-22 09:07:11','2026-05-22 09:07:11','2026-04-22 09:28:45',NULL,'USED'),
(22,'AWyag3zq3ahBJROb1y6wbO_se7QYv6Pi',21,246,1,'37cd1b3e-b654-4b87-a15e-37e50ad916cb','caritas','2026-04-23 12:33:40','2026-05-23 12:33:40','2026-04-23 12:33:57',NULL,'USED');
/*!40000 ALTER TABLE `agency_invite_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` char(36) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` varchar(300) DEFAULT NULL,
  `status` varchar(7) NOT NULL,
  `consultant_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_consultant_constraint` (`consultant_id`),
  CONSTRAINT `appointment_consultant_constraint` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` bigint(21) unsigned NOT NULL,
  `topic` varchar(255) NOT NULL,
  `consulting_type` tinyint(4) unsigned DEFAULT NULL,
  `initial_start_date` datetime NOT NULL,
  `start_date` datetime NOT NULL,
  `duration` smallint(6) NOT NULL,
  `is_repetitive` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `chat_interval` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `max_participants` tinyint(4) unsigned DEFAULT NULL,
  `consultant_id_owner` varchar(36) NOT NULL,
  `rc_group_id` varchar(255) DEFAULT NULL,
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `hint_message` varchar(300) DEFAULT NULL,
  `matrix_room_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_id_owner` (`consultant_id_owner`),
  CONSTRAINT `chat_consultant_ibfk_1` FOREIGN KEY (`consultant_id_owner`) REFERENCES `consultant` (`consultant_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES
(701,'Group Test',1,'2026-03-13 00:00:00','2026-03-13 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!eyryusdzsuxnPZAIud:91.99.183.160','2026-03-13 17:47:43','2026-03-13 17:47:43','','!eyryusdzsuxnPZAIud:91.99.183.160'),
(702,'Group Shazia',1,'2026-03-13 00:00:00','2026-03-13 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!OdjkgPJAbIjZigueMZ:91.99.183.160','2026-03-13 17:52:02','2026-03-13 17:52:02','','!OdjkgPJAbIjZigueMZ:91.99.183.160'),
(703,'Group FInal',1,'2026-03-13 00:00:00','2026-03-13 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!QIGYiwWjCnslNwURfr:91.99.183.160','2026-03-13 18:00:11','2026-03-13 18:00:11','','!QIGYiwWjCnslNwURfr:91.99.183.160'),
(704,'Testing Audience',1,'2026-03-17 00:00:00','2026-03-17 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!WhzCjFlPdEVrCvQsVx:91.99.183.160','2026-03-17 11:35:08','2026-03-17 11:35:08','','!WhzCjFlPdEVrCvQsVx:91.99.183.160'),
(705,'Testchat',1,'2026-03-24 00:00:00','2026-03-24 00:00:00',60,0,NULL,1,NULL,'683de8dc-cb80-4ef4-aa8e-d8ac14c74d7e','!mFqLbgguXCTwMSLWQI:91.99.183.160','2026-03-24 12:54:08','2026-03-24 12:54:08','','!mFqLbgguXCTwMSLWQI:91.99.183.160'),
(706,'New Redeploy',1,'2026-03-25 00:00:00','2026-03-25 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!SjDmpOQsXmbnlRgLCa:91.99.183.160','2026-03-25 14:56:23','2026-03-25 14:56:23','','!SjDmpOQsXmbnlRgLCa:91.99.183.160'),
(707,'Fmaily ',1,'2026-04-03 00:00:00','2026-04-03 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!YWHabfrRKmZdXETzvX:91.99.183.160','2026-04-03 21:26:32','2026-04-03 21:26:32','','!YWHabfrRKmZdXETzvX:91.99.183.160'),
(708,'ABC',1,'2026-04-04 00:00:00','2026-04-04 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!vweXbTlImdWOIegnSC:91.99.183.160','2026-04-04 19:21:54','2026-04-04 19:21:54','','!vweXbTlImdWOIegnSC:91.99.183.160'),
(709,'Hellow New chat',1,'2026-04-06 00:00:00','2026-04-06 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!sSLCKxBsNCFvaGrXZH:91.99.183.160','2026-04-06 12:21:57','2026-04-06 12:21:57','','!sSLCKxBsNCFvaGrXZH:91.99.183.160'),
(710,'Hello New Chat',1,'2026-04-06 00:00:00','2026-04-06 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!YXMYuYptwjGsGpnIgf:91.99.183.160','2026-04-06 12:23:17','2026-04-06 12:23:17','','!YXMYuYptwjGsGpnIgf:91.99.183.160'),
(711,'Multi User Group',1,'2026-04-09 00:00:00','2026-04-09 00:00:00',60,0,NULL,1,NULL,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','!opOicPqaXlQFlKjyCT:91.99.183.160','2026-04-09 11:23:28','2026-04-09 11:23:28','','!opOicPqaXlQFlKjyCT:91.99.183.160'),
(712,'group chat',1,'2026-04-22 00:00:00','2026-04-22 00:00:00',60,0,NULL,1,NULL,'45065014-46dc-45bd-b0a9-4a40a6e483ae','!uhFlPcMrDBXudeMlwj:91.99.183.160','2026-04-22 04:38:51','2026-04-22 04:38:51','','!uhFlPcMrDBXudeMlwj:91.99.183.160');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`chat_update` BEFORE UPDATE ON `userservice`.`chat` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chat_agency`
--

DROP TABLE IF EXISTS `chat_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_agency` (
  `id` bigint(21) unsigned NOT NULL,
  `chat_id` bigint(21) unsigned NOT NULL,
  `agency_id` bigint(21) unsigned NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `chat_agency_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_agency`
--

LOCK TABLES `chat_agency` WRITE;
/*!40000 ALTER TABLE `chat_agency` DISABLE KEYS */;
INSERT INTO `chat_agency` VALUES
(601,701,237,'2026-03-13 17:47:43','2026-03-13 17:47:43'),
(602,702,237,'2026-03-13 17:52:02','2026-03-13 17:52:02'),
(603,703,237,'2026-03-13 18:00:11','2026-03-13 18:00:11'),
(604,704,237,'2026-03-17 11:35:08','2026-03-17 11:35:08'),
(605,705,241,'2026-03-24 12:54:08','2026-03-24 12:54:08'),
(606,706,237,'2026-03-25 14:56:23','2026-03-25 14:56:23'),
(607,707,237,'2026-04-03 21:26:32','2026-04-03 21:26:32'),
(608,708,237,'2026-04-04 19:21:54','2026-04-04 19:21:54'),
(609,709,237,'2026-04-06 12:21:57','2026-04-06 12:21:57'),
(610,710,237,'2026-04-06 12:23:17','2026-04-06 12:23:17'),
(611,711,237,'2026-04-09 11:23:28','2026-04-09 11:23:28'),
(612,712,237,'2026-04-22 04:38:51','2026-04-22 04:38:51');
/*!40000 ALTER TABLE `chat_agency` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`chat_agency_update` BEFORE UPDATE ON `userservice`.`chat_agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `consultant`
--

DROP TABLE IF EXISTS `consultant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultant` (
  `consultant_id` varchar(36) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_team_consultant` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `is_supervisor` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `is_absent` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `absence_message` longtext DEFAULT NULL,
  `rc_user_id` varchar(255) DEFAULT NULL,
  `matrix_user_id` varchar(255) DEFAULT NULL,
  `language_formal` tinyint(4) NOT NULL DEFAULT 1,
  `data_privacy_confirmation` datetime DEFAULT NULL,
  `terms_and_conditions_confirmation` datetime DEFAULT NULL,
  `language_code` varchar(2) NOT NULL DEFAULT 'de',
  `encourage_2fa` bit(1) NOT NULL DEFAULT b'1',
  `notify_enquiries_repeating` bit(1) NOT NULL DEFAULT b'1',
  `notify_new_chat_message_from_advice_seeker` bit(1) NOT NULL DEFAULT b'1',
  `status` varchar(11) DEFAULT NULL,
  `walk_through_enabled` tinyint(4) NOT NULL DEFAULT 1,
  `id_old` bigint(21) DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `notifications_enabled` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `notifications_settings` varchar(4000) DEFAULT '',
  `matrix_password` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `magic_link_login_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `deletion_lifecycle_state` varchar(32) DEFAULT NULL,
  `deletion_read_only_until` datetime DEFAULT NULL,
  `deletion_paused_until` datetime DEFAULT NULL,
  `deletion_pause_reason` varchar(512) DEFAULT NULL,
  `deletion_paused_by` varchar(64) DEFAULT NULL,
  `deletion_pause_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`consultant_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `idx_first_name_last_name_email_delete_date` (`first_name`,`last_name`,`email`,`delete_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultant`
--

LOCK TABLES `consultant` WRITE;
/*!40000 ALTER TABLE `consultant` DISABLE KEYS */;
INSERT INTO `consultant` VALUES
('04fa28a4-dad1-471e-a1d7-7fc157292688',1,'enc.MNXW443VNR2GC3TUMJQWG23VOA......','consultant','backup','consultantbackup@gmail.com',0,1,0,NULL,'dummy-rc','@consultantbackup:91.99.183.160',1,'2026-03-13 19:56:43','2026-03-13 19:56:43','de','','','','CREATED',1,NULL,NULL,'2026-03-13 19:55:56','2026-03-26 19:35:59',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Consultant12345',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('0c303d00-061d-4956-b56c-2bb72c0f9309',1,'enc.ONSWGMBVMNXW44ZSMZQTQMTGGQ4A....','Sec05','Consultant','sec05cons2fa82f48@example.com',0,0,0,'available','dummy-rc','@sec05cons2fa82f48:91.99.183.160',1,NULL,NULL,'de','','','','IN_DELETION',1,NULL,'2026-03-26 20:39:53','2026-03-26 20:39:44','2026-03-26 20:39:53',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','Sec05!b5cd960aA1',NULL,0,'READ_ONLY_SAFEGUARD','2026-03-28 20:39:53','2026-04-26 20:39:53','consultant legal hold test','b0ee2630-6b0a-4ebb-ac8d-e716741a6c0f','2026-03-26 20:39:53'),
('200897f5-b32e-4e2e-804e-817a27400e60',1,'enc.ONUGC6TJMFRW63TTOVWHIYLOOQZA....','shazia','consultant2','shaziaconsultant2@gmail.com',0,1,0,NULL,'dummy-rc','@shaziaconsultant2:91.99.183.160',1,'2026-03-13 17:49:51','2026-03-13 17:49:51','de','','','','CREATED',1,NULL,NULL,'2026-03-13 17:29:27','2026-04-22 12:52:02',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Consultant12345','Shazia Caritastest',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('20265b12-0f7b-444f-a880-ea5ce413b9b7',20,'enc.ORUW2327NV2XG5DFOJUGK3DE','Timo','Musterheld','fg+timo_musterheld@dreambau.com',0,0,0,NULL,'dummy-rc','@timo_musterheld:91.99.183.160',1,'2026-03-30 12:50:09','2026-03-30 12:50:09','de','','','','CREATED',1,NULL,NULL,'2026-03-30 12:05:34','2026-03-30 12:50:28',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@timo_musterheld123',NULL,1,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('2d535e38-f6da-4142-8273-6c74f0ca4e13',1,'enc.MZZGC3TLOJQXI...','Frank','Gerhardt','fg+2026-03-19@dreambau.com',0,0,0,NULL,'dummy-rc','@frankrat:91.99.183.160',1,'2026-03-19 13:40:36','2026-03-19 13:40:36','de','','','','CREATED',1,NULL,NULL,'2026-03-19 13:24:39','2026-03-26 19:35:59',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Frankrat123',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('45065014-46dc-45bd-b0a9-4a40a6e483ae',1,'enc.NZUWW5LONJQWOZLOMN4Q....','nikunj','agency','nikunjagency@gmail.com',0,0,0,'hello','dummy-rc','@nikunjagency:91.99.183.160',1,NULL,NULL,'fr','','','','CREATED',1,NULL,NULL,'2026-04-22 04:27:12','2026-04-24 13:41:55',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Nikunjagency',NULL,1,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('482a558e-d07b-4fbc-a9d8-02394ffd729e',22,'enc.NFXGO4TJMRZXK3DMNFWWK...','Ingrid','Sullime','ingrid.sullime@dreambau.com',0,1,0,NULL,'dummy-rc','@ingridsullime:91.99.183.160',1,NULL,NULL,'de','','','','CREATED',1,NULL,NULL,'2026-04-14 06:49:45','2026-04-14 06:53:02',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@ingridsullime',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('683de8dc-cb80-4ef4-aa8e-d8ac14c74d7e',1,'enc.MJVG6ZLSNZPXEYLUM5SWEZLS','Björn','Ratgeber','bjoern.ludwig+bjoern_ratgeber@caritas.de',0,0,0,NULL,'dummy-rc','@bjoern_ratgeber:91.99.183.160',1,'2026-03-24 12:40:40','2026-03-24 12:40:40','ru','','','','CREATED',1,NULL,NULL,'2026-03-24 12:39:45','2026-03-26 19:35:59',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Suchtberatung1',NULL,1,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('77f74220-2348-4240-8824-21b0b3d84b59',1,'enc.MNQXE2LUMFZS2YTFOJWGS3RNMNUHE2LTORUW4ZI.','Christine','Bussian','christine.bussian@caritas.de',0,0,0,NULL,'dummy-rc','@caritas-berlin-christine:91.99.183.160',0,NULL,NULL,'de','','','','CREATED',1,NULL,NULL,'2026-04-13 09:14:55','2026-04-13 09:14:56',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','caritas-berlin-admin',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('8f9ce06e-d292-4c5e-bf05-4f0d0f682db8',21,'enc.NVQXQX3SMF2HGY3INRQWO...','Max','Ratschlag','fg+max_ratschlag@dreambau.com',0,0,0,NULL,'dummy-rc','@max_ratschlag:91.99.183.160',1,NULL,NULL,'de','','','','CREATED',1,NULL,NULL,'2026-03-31 13:49:48','2026-03-31 14:01:10',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@max_ratschlag',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('92952220-ca61-4775-bbe1-4e45fc9fbb32',1,'enc.ONUGC6TJMF2GK43U','shazia','kausar','shazia@gmail.com',0,0,0,NULL,'dummy-rc','@shaziatest:91.99.183.160',1,NULL,NULL,'de','','','','CREATED',1,NULL,NULL,'2026-04-22 09:40:52','2026-04-22 09:40:52',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','shaziatest',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('b82e4417-a6c3-466e-ac71-355f8d26c4b2',1,'enc.ONUGC6TJMFRW63TTOVWHIYLOOQZQ....','shazia','consultant3','shaziaconsultant3@gmail.com',0,1,0,NULL,'dummy-rc','@shaziaconsultant3:91.99.183.160',1,'2026-03-13 17:59:59','2026-03-13 17:59:59','de','','','','CREATED',1,NULL,NULL,'2026-03-13 17:59:02','2026-04-09 11:22:03',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Consultant12345',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'enc.ONUGC6TJMFRW63TTOVWHIYLOOQYQ....','shazia','consultant1','qadlisadream@gmail.com',0,1,0,'I am out of office','dummy-rc','@shaziaconsultant1:91.99.183.160',1,'2026-03-13 17:43:25','2026-03-13 17:43:25','de','','','','CREATED',1,NULL,NULL,'2026-03-13 17:28:44','2026-04-25 12:29:54',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Consultant12345',NULL,1,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('c81ae9b5-5178-43b1-bbf1-b9b6f1140b9f',4,'enc.NZUWW5LONJRW63TTOVWHIYLOOQ......','nikunj','consultant','nikunj.consultant@gmail.com',0,0,0,NULL,'dummy-rc','@nikunjconsultant:91.99.183.160',1,NULL,NULL,'de','','','','CREATED',1,NULL,NULL,'2026-04-21 02:08:36','2026-04-21 02:08:36',1,'{\"initialEnquiryNotificationEnabled\":true,\"newChatMessageNotificationEnabled\":true,\"reassignmentNotificationEnabled\":true,\"appointmentNotificationEnabled\":true}','@Nikunjconsultant',NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('sec6-demo-cons-fresh',1,'sec6democonsfresh','Sec6','DemoFresh','sec6democonsfresh@example.invalid',0,0,0,NULL,NULL,NULL,1,NULL,NULL,'de','','','','IN_PROGRESS',1,NULL,NULL,'2026-03-12 12:47:22','2026-03-22 12:47:22',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
('sec6-demo-cons-old',1,'sec6democonsold','Sec6','DemoOld','sec6democonsold@example.invalid',0,0,0,NULL,NULL,NULL,1,NULL,NULL,'de','','','','IN_PROGRESS',1,NULL,NULL,'2024-08-04 12:47:22','2025-03-02 12:47:22',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `consultant` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`consultant_update` BEFORE UPDATE ON `userservice`.`consultant` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `consultant_agency`
--

DROP TABLE IF EXISTS `consultant_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultant_agency` (
  `id` bigint(21) unsigned NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `consultant_id` varchar(36) NOT NULL,
  `agency_id` bigint(21) unsigned NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `delete_date` datetime DEFAULT NULL,
  `status` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultant_id` (`consultant_id`),
  CONSTRAINT `consultant_agency_ibfk_1` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultant_agency`
--

LOCK TABLES `consultant_agency` WRITE;
/*!40000 ALTER TABLE `consultant_agency` DISABLE KEYS */;
INSERT INTO `consultant_agency` VALUES
(100811,1,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',237,'2026-03-13 17:28:45','2026-03-13 17:28:45',NULL,'CREATED'),
(100812,1,'200897f5-b32e-4e2e-804e-817a27400e60',237,'2026-03-13 17:29:27','2026-03-13 17:29:27',NULL,'CREATED'),
(100813,1,'b82e4417-a6c3-466e-ac71-355f8d26c4b2',237,'2026-03-13 17:59:02','2026-03-13 17:59:02',NULL,'CREATED'),
(100814,1,'b82e4417-a6c3-466e-ac71-355f8d26c4b2',237,'2026-03-13 17:59:10','2026-03-13 17:59:10',NULL,'CREATED'),
(100815,1,'200897f5-b32e-4e2e-804e-817a27400e60',237,'2026-03-13 17:59:25','2026-03-13 17:59:25',NULL,'CREATED'),
(100816,1,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',237,'2026-03-13 17:59:33','2026-03-13 17:59:33',NULL,'CREATED'),
(100817,1,'04fa28a4-dad1-471e-a1d7-7fc157292688',238,'2026-03-13 19:55:56','2026-03-13 19:55:56',NULL,'CREATED'),
(100818,1,'04fa28a4-dad1-471e-a1d7-7fc157292688',238,'2026-03-13 19:56:00','2026-03-13 19:56:00',NULL,'CREATED'),
(100819,1,'2d535e38-f6da-4142-8273-6c74f0ca4e13',241,'2026-03-19 13:24:39','2026-03-19 13:24:39',NULL,'CREATED'),
(100820,1,'2d535e38-f6da-4142-8273-6c74f0ca4e13',241,'2026-03-19 13:25:24','2026-03-19 13:25:24',NULL,'CREATED'),
(100821,1,'2d535e38-f6da-4142-8273-6c74f0ca4e13',241,'2026-03-19 13:40:20','2026-03-19 13:40:20',NULL,'CREATED'),
(100822,1,'683de8dc-cb80-4ef4-aa8e-d8ac14c74d7e',241,'2026-03-24 12:39:46','2026-03-24 12:39:46',NULL,'CREATED'),
(100823,1,'b82e4417-a6c3-466e-ac71-355f8d26c4b2',237,'2026-03-25 19:51:33','2026-03-25 19:51:33',NULL,'CREATED'),
(100824,1,'b82e4417-a6c3-466e-ac71-355f8d26c4b2',237,'2026-03-26 19:03:21','2026-03-26 19:03:22',NULL,'CREATED'),
(100825,20,'20265b12-0f7b-444f-a880-ea5ce413b9b7',243,'2026-03-30 12:09:27','2026-03-30 12:09:27',NULL,'CREATED'),
(100826,20,'20265b12-0f7b-444f-a880-ea5ce413b9b7',243,'2026-03-30 12:11:33','2026-03-30 12:11:33',NULL,'CREATED'),
(100827,20,'20265b12-0f7b-444f-a880-ea5ce413b9b7',244,'2026-03-30 12:11:33','2026-03-30 12:11:33',NULL,'CREATED'),
(100828,20,'20265b12-0f7b-444f-a880-ea5ce413b9b7',243,'2026-03-30 12:18:43','2026-03-30 12:18:43',NULL,'CREATED'),
(100829,20,'20265b12-0f7b-444f-a880-ea5ce413b9b7',244,'2026-03-30 12:18:43','2026-03-30 12:18:43',NULL,'CREATED'),
(100830,20,'20265b12-0f7b-444f-a880-ea5ce413b9b7',243,'2026-03-30 12:35:48','2026-03-30 12:35:48',NULL,'CREATED'),
(100831,21,'8f9ce06e-d292-4c5e-bf05-4f0d0f682db8',245,'2026-03-31 13:52:55','2026-03-31 13:52:55',NULL,'CREATED'),
(100832,21,'8f9ce06e-d292-4c5e-bf05-4f0d0f682db8',245,'2026-03-31 13:54:50','2026-03-31 13:54:50',NULL,'CREATED'),
(100833,21,'8f9ce06e-d292-4c5e-bf05-4f0d0f682db8',246,'2026-03-31 13:54:50','2026-03-31 13:54:50',NULL,'CREATED'),
(100834,21,'8f9ce06e-d292-4c5e-bf05-4f0d0f682db8',245,'2026-03-31 14:01:10','2026-03-31 14:01:10',NULL,'CREATED'),
(100835,21,'8f9ce06e-d292-4c5e-bf05-4f0d0f682db8',246,'2026-03-31 14:01:10','2026-03-31 14:01:10',NULL,'CREATED'),
(100836,1,'b82e4417-a6c3-466e-ac71-355f8d26c4b2',237,'2026-04-09 11:21:34','2026-04-09 11:21:34',NULL,'CREATED'),
(100837,1,'b82e4417-a6c3-466e-ac71-355f8d26c4b2',237,'2026-04-09 11:22:02','2026-04-09 11:22:02',NULL,'CREATED'),
(100838,1,'77f74220-2348-4240-8824-21b0b3d84b59',238,'2026-04-13 09:14:55','2026-04-13 09:14:56',NULL,'CREATED'),
(100839,22,'482a558e-d07b-4fbc-a9d8-02394ffd729e',248,'2026-04-14 06:53:02','2026-04-14 06:53:02',NULL,'CREATED'),
(100841,1,'45065014-46dc-45bd-b0a9-4a40a6e483ae',237,'2026-04-22 04:27:13','2026-04-22 04:27:13',NULL,'CREATED'),
(100842,1,'45065014-46dc-45bd-b0a9-4a40a6e483ae',238,'2026-04-22 04:27:13','2026-04-22 04:27:13',NULL,'CREATED'),
(100843,1,'45065014-46dc-45bd-b0a9-4a40a6e483ae',247,'2026-04-22 04:27:13','2026-04-22 04:27:13',NULL,'CREATED'),
(100844,1,'45065014-46dc-45bd-b0a9-4a40a6e483ae',241,'2026-04-22 04:27:13','2026-04-22 04:27:13',NULL,'CREATED'),
(100845,1,'45065014-46dc-45bd-b0a9-4a40a6e483ae',240,'2026-04-22 04:27:13','2026-04-22 04:27:13',NULL,'CREATED'),
(100846,1,'92952220-ca61-4775-bbe1-4e45fc9fbb32',238,'2026-04-22 09:40:52','2026-04-22 09:40:52',NULL,'CREATED');
/*!40000 ALTER TABLE `consultant_agency` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`consultant_agency_update` BEFORE UPDATE ON `userservice`.`consultant_agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `consultant_mobile_token`
--

DROP TABLE IF EXISTS `consultant_mobile_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultant_mobile_token` (
  `id` bigint(21) unsigned NOT NULL,
  `consultant_id` varchar(36) NOT NULL,
  `mobile_app_token` longtext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_app_token` (`mobile_app_token`) USING HASH,
  KEY `consultant_id` (`consultant_id`),
  CONSTRAINT `consultant_mobile_token_ibfk_1` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultant_mobile_token`
--

LOCK TABLES `consultant_mobile_token` WRITE;
/*!40000 ALTER TABLE `consultant_mobile_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultant_mobile_token` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`consultant_mobile_token_update`
    BEFORE UPDATE ON `userservice`.`consultant_mobile_token`
    FOR EACH ROW BEGIN set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `counselor_rename_audit_log`
--

DROP TABLE IF EXISTS `counselor_rename_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `counselor_rename_audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `consultant_id` varchar(64) NOT NULL,
  `session_id` bigint(20) NOT NULL,
  `recipient_user_id` varchar(64) NOT NULL,
  `old_display_name` varchar(255) NOT NULL,
  `new_display_name` varchar(255) NOT NULL,
  `matrix_room_id` varchar(255) DEFAULT NULL,
  `event_type` varchar(64) NOT NULL,
  `changed_at` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_counselor_rename_audit_consultant` (`consultant_id`),
  KEY `idx_counselor_rename_audit_session` (`session_id`),
  KEY `idx_counselor_rename_audit_recipient` (`recipient_user_id`),
  KEY `idx_counselor_rename_audit_created` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counselor_rename_audit_log`
--

LOCK TABLES `counselor_rename_audit_log` WRITE;
/*!40000 ALTER TABLE `counselor_rename_audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `counselor_rename_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft_message`
--

DROP TABLE IF EXISTS `draft_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `draft_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `scope_key` varchar(255) NOT NULL,
  `text` text DEFAULT NULL,
  `action_path` varchar(512) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `source_session_id` bigint(20) DEFAULT NULL,
  `room_ref` varchar(255) DEFAULT NULL,
  `thread_root_id` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_draft_message_user_scope` (`user_id`,`scope_key`),
  KEY `idx_draft_message_user_update` (`user_id`,`update_date`),
  KEY `idx_draft_message_tenant` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft_message`
--

LOCK TABLES `draft_message` WRITE;
/*!40000 ALTER TABLE `draft_message` DISABLE KEYS */;
INSERT INTO `draft_message` VALUES
(41,'837d8c0a-18ed-4e8e-90b7-8375317b3be8','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:02:07','2026-03-13 17:08:18',NULL),
(42,'3c170abd-e072-4e87-91f3-99935c2c0da5','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:04:18','2026-03-13 17:12:34',NULL),
(44,'1c48b204-5a90-4edd-8e20-a6dd2dc57c73','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:04:50','2026-03-13 17:07:09',NULL),
(45,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:30:39','2026-03-13 17:46:06',NULL),
(47,'9c5eb650-9cfe-4d8d-b530-ecc3ad54b102','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:42:42','2026-03-13 17:43:55',NULL),
(49,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','scope:__draft-index__|thread:main','{\"scope:102335|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102335?sessionListTab=archive\",\"title\":\"Anonymous-1773953148545\",\"sessionId\":102335,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775187192847},\"scope:!vweXbTlImdWOIegnSC:91.99.183.160|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/708\",\"title\":\"ABC\",\"sessionId\":708,\"roomRef\":\"!vweXbTlImdWOIegnSC:91.99.183.160\",\"threadRootId\":null,\"updatedAt\":1775504072962},\"scope:102395|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102316\",\"title\":\"Anonymous-1775566926461\",\"sessionId\":102395,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775734817098},\"scope:!QIGYiwWjCnslNwURfr:91.99.183.160|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102316\",\"title\":\"Group FInal\",\"sessionId\":703,\"roomRef\":\"!QIGYiwWjCnslNwURfr:91.99.183.160\",\"threadRootId\":null,\"updatedAt\":1775713599738},\"scope:!WhzCjFlPdEVrCvQsVx:91.99.183.160|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/704\",\"title\":\"Testing Audience\",\"sessionId\":704,\"roomRef\":\"!WhzCjFlPdEVrCvQsVx:91.99.183.160\",\"threadRootId\":null,\"updatedAt\":1775987480520},\"scope:102318|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102318\",\"title\":\"shaziauser1\",\"sessionId\":102318,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1777018752736},\"scope:102316|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102316\",\"title\":\"shaziauser\",\"sessionId\":102316,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776838832189},\"scope:102447|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102447\",\"title\":\"guest_aoayqfdhk5dj\",\"sessionId\":102447,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776834906832}}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:43:40','2026-04-24 08:26:44',1),
(52,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:46:46','2026-04-25 10:55:01',1),
(55,'738c5428-afe5-458e-a0c8-92e960f677a6','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:53:43','2026-03-13 17:53:47',NULL),
(57,'200897f5-b32e-4e2e-804e-817a27400e60','scope:__draft-index__|thread:main','{\"scope:102318|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102321\",\"title\":\"shaziauser1\",\"sessionId\":102318,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775169012154},\"scope:102452|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102394\",\"title\":\"Anonymous-1776846180451\",\"sessionId\":102452,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776952477413},\"scope:!uhFlPcMrDBXudeMlwj:91.99.183.160|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/711\",\"title\":\"group chat\",\"sessionId\":712,\"roomRef\":\"!uhFlPcMrDBXudeMlwj:91.99.183.160\",\"threadRootId\":null,\"updatedAt\":1776952453433}}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 17:53:58','2026-04-23 13:54:37',1),
(59,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 18:00:23','2026-03-13 18:00:34',NULL),
(64,'9602ea11-62ce-462d-b62e-bc311c03a54e','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 19:58:19','2026-03-13 19:58:24',NULL),
(66,'04fa28a4-dad1-471e-a1d7-7fc157292688','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-13 19:58:34','2026-03-13 19:58:34',NULL),
(154,'9958b336-a315-4b9c-be6f-dafed64e86c3','scope:102326|thread:main','<ol><li><p></p></li></ol><blockquote><p> 17.3.2026, 16:15:24 </p></blockquote><p></p>','/sessions/user/view/session/102326',NULL,102326,NULL,NULL,'2026-03-17 14:10:53','2026-03-17 15:15:24',NULL),
(155,'9958b336-a315-4b9c-be6f-dafed64e86c3','scope:__draft-index__|thread:main','{\"scope:102326|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102326\",\"title\":null,\"sessionId\":102326,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1773760524708}}',NULL,NULL,NULL,NULL,NULL,'2026-03-17 14:10:53','2026-03-17 15:15:24',NULL),
(157,'f79b9384-3a8d-43a3-bf84-c7281f2af9b7','scope:__draft-index__|thread:main','{\"scope:102327|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102327\",\"title\":null,\"sessionId\":102327,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1773784555113}}',NULL,NULL,NULL,NULL,NULL,'2026-03-17 19:32:47','2026-03-17 21:55:55',NULL),
(158,'f79b9384-3a8d-43a3-bf84-c7281f2af9b7','scope:102327|thread:main','<p></p><p></p>','/sessions/user/view/session/102327',NULL,102327,NULL,NULL,'2026-03-17 21:55:55','2026-03-17 21:55:55',NULL),
(162,'04d6f440-7f1f-41a2-b7d5-b37ac3282a5e','scope:102329|thread:main','<p></p><p></p>','/sessions/user/view/session/102329',NULL,102329,NULL,NULL,'2026-03-18 11:41:08','2026-03-18 12:36:26',NULL),
(163,'04d6f440-7f1f-41a2-b7d5-b37ac3282a5e','scope:__draft-index__|thread:main','{\"scope:102329|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102329\",\"title\":null,\"sessionId\":102329,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1773837386563}}',NULL,NULL,NULL,NULL,NULL,'2026-03-18 11:41:08','2026-03-18 12:36:26',NULL),
(165,'200897f5-b32e-4e2e-804e-817a27400e60','scope:102318|thread:main','<p><em>sddssdsds</em></p><p>dfdffddfdffdfdfdfdfdfdfdfdfdf</p>','/sessions/consultant/sessionView/session/102321','shaziauser1',102318,NULL,NULL,'2026-03-18 13:03:05','2026-04-02 22:30:12',1),
(167,'00ccec31-fca9-4b4e-b7ed-55c56b60280c','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-19 05:35:14','2026-03-19 05:35:14',NULL),
(168,'3bddde71-985d-4264-94d8-074290571b66','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-19 11:26:54','2026-03-19 11:26:54',NULL),
(169,'4449fb58-fa84-4c9a-8da5-814e24c5505e','scope:102333|thread:main','<p></p>','/sessions/user/view/session/102333',NULL,102333,NULL,NULL,'2026-03-19 11:43:21','2026-03-19 11:43:22',NULL),
(170,'4449fb58-fa84-4c9a-8da5-814e24c5505e','scope:__draft-index__|thread:main','{\"scope:102333|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102333\",\"title\":null,\"sessionId\":102333,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1773920602488}}',NULL,NULL,NULL,NULL,NULL,'2026-03-19 11:43:21','2026-03-19 11:43:22',NULL),
(172,'de7613d4-b0d5-4366-bc54-983772703068','scope:__draft-index__|thread:main','{\"scope:102334|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102334\",\"title\":null,\"sessionId\":102334,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1773950035063}}',NULL,NULL,NULL,NULL,NULL,'2026-03-19 19:51:29','2026-03-19 19:53:55',NULL),
(173,'de7613d4-b0d5-4366-bc54-983772703068','scope:102334|thread:main','<p></p>','/sessions/user/view/session/102334',NULL,102334,NULL,NULL,'2026-03-19 19:53:54','2026-03-19 19:53:54',NULL),
(174,'e6bb27b0-f66c-41a7-af1e-da686c0da328','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-20 15:53:52','2026-03-20 15:53:52',NULL),
(175,'0ac1417a-0f1b-4845-b903-e06f40e0dad7','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-20 19:44:50','2026-03-20 21:58:10',NULL),
(178,'0c62b6d8-5cae-47e7-912c-b334d52fcf06','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 00:02:34','2026-03-21 03:15:19',NULL),
(179,'e4ff3273-106c-4df9-b062-09e341ce7c3d','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 04:49:08','2026-03-21 04:49:08',NULL),
(181,'ac6a6c53-6c4f-4964-a766-f28575a8dd8b','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 11:12:14','2026-03-21 11:21:14',NULL),
(182,'7afae28b-9e11-47a9-8311-455bec33a748','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 11:22:15','2026-03-21 11:22:15',NULL),
(183,'d693b4fb-0058-42d5-970f-d402ebc92be0','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 13:14:12','2026-03-21 13:14:12',NULL),
(184,'d996f341-ef1e-48ad-8ac9-786196d8cd21','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 13:15:30','2026-03-21 13:26:35',NULL),
(185,'ca2a5bfe-6ff7-4eeb-ab39-fc0ffd35a87e','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-03-21 20:44:30','2026-03-21 20:44:30',NULL),
(186,'1c62e730-52df-4782-8548-4bb96a5b5bcb','scope:102347|thread:main','<p>Write us what moves you.</p>','/sessions/user/view/session/102347',NULL,102347,NULL,NULL,'2026-03-22 19:07:03','2026-03-22 19:10:24',NULL),
(187,'1c62e730-52df-4782-8548-4bb96a5b5bcb','scope:__draft-index__|thread:main','{\"scope:102347|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102347\",\"title\":null,\"sessionId\":102347,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774206624752}}',NULL,NULL,NULL,NULL,NULL,'2026-03-22 19:07:04','2026-03-22 19:10:25',NULL),
(188,'0a77071e-d56d-475c-b5bb-23274cc2656d','scope:102348|thread:main','<p>Write us what moves you.</p>','/sessions/user/view/session/102348',NULL,102348,NULL,NULL,'2026-03-22 19:50:46','2026-03-22 19:50:46',NULL),
(189,'0a77071e-d56d-475c-b5bb-23274cc2656d','scope:__draft-index__|thread:main','{\"scope:102348|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102348\",\"title\":null,\"sessionId\":102348,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774209046648}}',NULL,NULL,NULL,NULL,NULL,'2026-03-22 19:50:46','2026-03-22 19:50:46',NULL),
(190,'26dc580b-0230-4a4b-b98f-1f23e0d6b06a','scope:102349|thread:main','<p>Write us what moves you.</p>','/sessions/user/view/session/102349',NULL,102349,NULL,NULL,'2026-03-22 22:41:49','2026-03-22 22:41:49',NULL),
(191,'26dc580b-0230-4a4b-b98f-1f23e0d6b06a','scope:__draft-index__|thread:main','{\"scope:102349|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102349\",\"title\":null,\"sessionId\":102349,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774219309957}}',NULL,NULL,NULL,NULL,NULL,'2026-03-22 22:41:50','2026-03-22 22:41:50',NULL),
(193,'683de8dc-cb80-4ef4-aa8e-d8ac14c74d7e','scope:__draft-index__|thread:main','{\"scope:!mFqLbgguXCTwMSLWQI:91.99.183.160|thread:~!mFqLbgguXCTwMSLWQI:91.99.183.160:m1774356859997.0\":{\"actionPath\":\"/sessions/consultant/sessionView/session/705?threadRootId=%7E%21mFqLbgguXCTwMSLWQI%3A91.99.183.160%3Am1774356859997.0\",\"title\":\"Testchat\",\"sessionId\":705,\"roomRef\":\"!mFqLbgguXCTwMSLWQI:91.99.183.160\",\"threadRootId\":\"~!mFqLbgguXCTwMSLWQI:91.99.183.160:m1774356859997.0\",\"updatedAt\":1774356885735},\"scope:!mFqLbgguXCTwMSLWQI:91.99.183.160|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/705\",\"title\":\"Testchat\",\"sessionId\":705,\"roomRef\":\"!mFqLbgguXCTwMSLWQI:91.99.183.160\",\"threadRootId\":null,\"updatedAt\":1774357145136}}',NULL,NULL,NULL,NULL,NULL,'2026-03-24 12:54:16','2026-03-24 12:59:05',NULL),
(200,'72a86228-36e2-4c9d-9067-091672e9b058','scope:__draft-index__|thread:main','{\"scope:102352|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102352\",\"title\":\"shaziaconsultant1\",\"sessionId\":102352,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774448001729}}',NULL,NULL,NULL,NULL,NULL,'2026-03-25 14:10:27','2026-03-25 14:13:21',1),
(205,'72a86228-36e2-4c9d-9067-091672e9b058','scope:102352|thread:main','<p></p>','/sessions/user/view/session/102352','shaziaconsultant1',102352,NULL,NULL,'2026-03-25 14:13:21','2026-03-25 14:13:21',1),
(206,'81b00232-70d8-4abb-bf3e-4160033aa4b1','scope:__draft-index__|thread:main','{\"scope:102353|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102353\",\"title\":\"shaziaconsultant1\",\"sessionId\":102353,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774468787275}}',NULL,NULL,NULL,NULL,NULL,'2026-03-25 14:55:23','2026-03-25 19:59:47',1),
(210,'b14b7574-0aab-4b7e-97c0-6e7bf87b64b4','scope:__draft-index__|thread:main','{\"scope:102355|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102355\",\"title\":null,\"sessionId\":102355,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774461529821}}',NULL,NULL,NULL,NULL,NULL,'2026-03-25 17:58:30','2026-03-25 17:58:50',1),
(211,'b14b7574-0aab-4b7e-97c0-6e7bf87b64b4','scope:102355|thread:main','<p></p>','/sessions/user/view/session/102355',NULL,102355,NULL,NULL,'2026-03-25 17:58:49','2026-03-25 17:58:49',1),
(213,'81b00232-70d8-4abb-bf3e-4160033aa4b1','scope:102353|thread:main','<p></p>','/sessions/user/view/session/102353','shaziaconsultant1',102353,NULL,NULL,'2026-03-25 19:59:47','2026-03-25 19:59:47',1),
(215,'00534109-35aa-43f9-a225-d9c605fe5153','scope:__draft-index__|thread:main','{\"scope:102356|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102356\",\"title\":null,\"sessionId\":102356,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774551628529}}',NULL,NULL,NULL,NULL,NULL,'2026-03-26 19:00:21','2026-03-26 19:00:28',1),
(217,'00534109-35aa-43f9-a225-d9c605fe5153','scope:102356|thread:main','<p></p>','/sessions/user/view/session/102356',NULL,102356,NULL,NULL,'2026-03-26 19:00:28','2026-03-26 19:00:28',1),
(237,'acf2bba0-308e-4f12-b362-0e584b0ba5ba','scope:__draft-index__|thread:main','{\"scope:102359|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102359\",\"title\":null,\"sessionId\":102359,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1774958436234}}',NULL,NULL,NULL,NULL,NULL,'2026-03-31 11:59:33','2026-03-31 12:00:36',1),
(241,'acf2bba0-308e-4f12-b362-0e584b0ba5ba','scope:102359|thread:main','<p style=\"text-align: left;\"></p><p style=\"text-align: left;\">*role=\"textbox\"**tabindex=0*</p>','/sessions/user/view/session/102359',NULL,102359,NULL,NULL,'2026-03-31 12:00:36','2026-03-31 12:00:36',1),
(245,'f4cca44f-60f8-43dd-bc0f-90219b898d69','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-02 22:31:52','2026-04-02 22:31:52',1),
(248,'6f9b85b7-796b-488f-b1ab-d121b8db9201','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 05:40:54','2026-04-03 05:40:54',1),
(249,'3ccc6990-792e-479c-93b0-ea344785c8b5','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 07:09:55','2026-04-03 07:09:55',1),
(250,'1ee2a6ec-f914-4246-bc0c-80e5ad27d7bd','scope:102367|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102367',NULL,102367,NULL,NULL,'2026-04-03 07:20:27','2026-04-03 07:20:38',1),
(252,'1ee2a6ec-f914-4246-bc0c-80e5ad27d7bd','scope:__draft-index__|thread:main','{\"scope:102367|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102367\",\"title\":null,\"sessionId\":102367,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775200838554}}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 07:20:27','2026-04-03 07:20:38',1),
(253,'f82c7a88-66c9-4aae-9f1d-4b2ce760580b','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 08:07:38','2026-04-03 08:07:38',1),
(254,'c8189789-b4a9-4a91-abc1-47ebb9c68cd1','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 08:25:11','2026-04-03 08:25:11',1),
(255,'3d8b5ea3-5efc-4511-b4f9-eddd7f688f3b','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 09:36:53','2026-04-03 09:36:53',1),
(256,'ac5b5c51-2059-4e25-b800-ecf2c1c05ae3','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 10:02:46','2026-04-03 10:02:46',1),
(257,'a082ca31-30f7-489d-afcc-92d2dc5ebb52','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 10:17:37','2026-04-03 10:17:37',1),
(258,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','scope:__draft-index__|thread:main','{\"scope:102382|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102382\",\"title\":\"shaziaconsultant1\",\"sessionId\":102382,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775475306991}}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 11:05:30','2026-04-06 11:35:07',1),
(262,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','scope:102382|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102382','shaziaconsultant1',102382,NULL,NULL,'2026-04-03 11:34:53','2026-04-06 11:35:06',1),
(263,'99f18b34-24d6-467f-a775-d36545dda70e','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-03 15:19:02','2026-04-03 15:19:02',1),
(270,'be0064d7-01c6-4ebc-8c17-2c84073013ed','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-04 05:30:46','2026-04-04 05:30:46',1),
(271,'efb28176-89c4-48e6-830e-5859f6293376','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-04 05:32:27','2026-04-04 05:32:27',1),
(315,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','scope:!vweXbTlImdWOIegnSC:91.99.183.160|thread:main','<blockquote><p style=\"text-align: left;\"></p></blockquote><p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/708','ABC',708,'!vweXbTlImdWOIegnSC:91.99.183.160',NULL,'2026-04-06 11:00:47','2026-04-06 19:34:33',1),
(316,'b3b34f87-963f-4103-8e5e-8e4895ca4fe7','scope:102388|thread:main','<p style=\"text-align: left;\">Hello inhale exhale game</p><p style=\"text-align: left;\"></p>','/sessions/user/view/session/102388',NULL,102388,NULL,NULL,'2026-04-06 11:32:56','2026-04-06 11:34:31',21),
(317,'b3b34f87-963f-4103-8e5e-8e4895ca4fe7','scope:__draft-index__|thread:main','{\"scope:102388|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102388\",\"title\":null,\"sessionId\":102388,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775475271139}}',NULL,NULL,NULL,NULL,NULL,'2026-04-06 11:32:56','2026-04-06 11:34:31',21),
(319,'88e637a3-2e35-450f-adb8-5b38969e204b','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-06 11:37:02','2026-04-06 11:38:43',21),
(322,'30b6e1e6-6b8a-4142-9db4-1cab4cef43e9','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-06 11:52:47','2026-04-06 11:52:47',21),
(326,'caa721b6-4bf0-4388-833c-9f08f431dcbc','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-07 12:46:24','2026-04-07 12:48:12',1),
(328,'500d9ef2-1d5e-4334-966d-0e083c13c339','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-07 13:02:49','2026-04-07 13:04:01',1),
(335,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','scope:!QIGYiwWjCnslNwURfr:91.99.183.160|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102316','Group FInal',703,'!QIGYiwWjCnslNwURfr:91.99.183.160',NULL,'2026-04-08 07:59:54','2026-04-09 05:46:39',1),
(341,'b2dbe7fc-125e-4625-ab27-ae68504bcf6c','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-09 07:19:48','2026-04-09 07:42:14',1),
(346,'c60539c2-ce39-4197-8b18-21dfaaecf157','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-10 22:28:39','2026-04-10 22:28:39',21),
(348,'17243509-f18b-492e-b87d-ce24055f3d11','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-11 11:57:03','2026-04-11 11:57:03',1),
(350,'3ef41468-5b77-489e-a837-708ac79b7c7d','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-11 13:23:35','2026-04-11 13:23:40',1),
(355,'a525c60f-453e-4f5d-a492-fad015582c6b','scope:__draft-index__|thread:main','{\"scope:102405|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102405\",\"title\":null,\"sessionId\":102405,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1775941012521}}',NULL,NULL,NULL,NULL,NULL,'2026-04-11 20:56:20','2026-04-11 20:56:52',1),
(356,'a525c60f-453e-4f5d-a492-fad015582c6b','scope:102405|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102405',NULL,102405,NULL,NULL,'2026-04-11 20:56:52','2026-04-11 20:56:52',1),
(373,'482a558e-d07b-4fbc-a9d8-02394ffd729e','scope:__draft-index__|thread:main','{\"scope:102407|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102409\",\"title\":\"Anonymous-1776149651799\",\"sessionId\":102407,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776166650847},\"scope:102409|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102409\",\"title\":\"Anonymous-1776151635158\",\"sessionId\":102409,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776166660844}}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 06:56:42','2026-04-14 11:37:40',22),
(374,'93be7aef-db00-466d-a1ee-930948adaae9','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 06:59:12','2026-04-14 06:59:12',1),
(375,'482a558e-d07b-4fbc-a9d8-02394ffd729e','scope:102407|thread:main','<p style=\"text-align: left;\">Kannst du bitte sagen w</p>','/sessions/consultant/sessionView/session/102409','Anonymous-1776149651799',102407,NULL,NULL,'2026-04-14 06:59:59','2026-04-14 11:37:30',22),
(377,'25680a88-64c2-4cad-b3df-e2f312fbdd99','scope:__draft-index__|thread:main','{\"scope:102407|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102407\",\"title\":\"ingridsullime\",\"sessionId\":102407,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776151519092}}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 07:03:11','2026-04-14 07:25:19',22),
(378,'52d8b1e0-3241-4d55-a5d6-5012e769872d','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 07:03:42','2026-04-14 08:11:01',22),
(379,'25680a88-64c2-4cad-b3df-e2f312fbdd99','scope:102407|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102407','ingridsullime',102407,NULL,NULL,'2026-04-14 07:04:13','2026-04-14 07:25:19',22),
(382,'71f98872-e0d4-4e74-b521-9e618397cc2c','scope:__draft-index__|thread:main','{\"scope:102409|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102409\",\"title\":\"ingridsullime\",\"sessionId\":102409,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776169659731}}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 07:29:54','2026-04-14 12:27:39',22),
(383,'482a558e-d07b-4fbc-a9d8-02394ffd729e','scope:102409|thread:main','<p style=\"text-align: left;\"></p><p style=\"text-align: left;\"></p><p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102409','Anonymous-1776151635158',102409,NULL,NULL,'2026-04-14 07:30:13','2026-04-14 11:37:40',22),
(387,'085b09b2-4dcb-4050-b069-65df80f2d97b','scope:102411|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102411',NULL,102411,NULL,NULL,'2026-04-14 09:33:41','2026-04-14 14:33:13',22),
(388,'085b09b2-4dcb-4050-b069-65df80f2d97b','scope:__draft-index__|thread:main','{\"scope:102411|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102411\",\"title\":null,\"sessionId\":102411,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776177193187}}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 09:33:41','2026-04-14 14:33:13',22),
(389,'71f98872-e0d4-4e74-b521-9e618397cc2c','scope:102409|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102409','ingridsullime',102409,NULL,NULL,'2026-04-14 12:27:39','2026-04-14 12:27:39',22),
(390,'7598cf93-eaf2-4ad1-bf0e-a124911909c5','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-14 12:46:45','2026-04-14 12:46:45',1),
(393,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','scope:102318|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/712','shaziauser1',102318,NULL,NULL,'2026-04-15 07:47:40','2026-04-24 08:19:12',1),
(394,'65968bc8-df77-48da-864c-05f6e23575cf','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-15 19:07:11','2026-04-15 19:07:20',22),
(396,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','scope:102316|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102329','shaziauser',102316,NULL,NULL,'2026-04-19 19:37:56','2026-04-22 06:20:29',1),
(398,'176c42f5-2262-4baa-8ee3-c11c27461d6a','scope:__draft-index__|thread:main','{\"scope:102426|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102426\",\"title\":null,\"sessionId\":102426,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776666035510}}',NULL,NULL,NULL,NULL,NULL,'2026-04-20 06:20:39','2026-04-20 06:20:40',1),
(400,'5e8b987d-ac54-42da-a11b-15c84c4e1fee','scope:__draft-index__|thread:main','{\"scope:102427|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102427\",\"title\":null,\"sessionId\":102427,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776667786459}}',NULL,NULL,NULL,NULL,NULL,'2026-04-20 06:48:54','2026-04-20 06:49:46',1),
(401,'5e8b987d-ac54-42da-a11b-15c84c4e1fee','scope:102427|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102427',NULL,102427,NULL,NULL,'2026-04-20 06:49:46','2026-04-20 06:49:46',1),
(402,'e24bf81a-8f22-40ca-a7d6-1f2852daabb3','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-20 06:53:29','2026-04-20 06:53:29',1),
(403,'f13085a2-2d0a-428e-af71-3001ff20b61f','scope:__draft-index__|thread:main','{\"scope:102430|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102430\",\"title\":null,\"sessionId\":102430,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776669176867}}',NULL,NULL,NULL,NULL,NULL,'2026-04-20 06:59:03','2026-04-20 07:12:57',1),
(405,'f13085a2-2d0a-428e-af71-3001ff20b61f','scope:102430|thread:main','<p style=\"text-align: left;\"></p>','/sessions/user/view/session/102430',NULL,102430,NULL,NULL,'2026-04-20 07:12:56','2026-04-20 07:12:56',1),
(411,'2b09f883-10c0-4736-8ee2-4740fc02aad1','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-20 16:16:44','2026-04-20 16:16:47',1),
(413,'45065014-46dc-45bd-b0a9-4a40a6e483ae','scope:__draft-index__|thread:main','{\"scope:!uhFlPcMrDBXudeMlwj:91.99.183.160|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/712\",\"title\":\"group chat\",\"sessionId\":712,\"roomRef\":\"!uhFlPcMrDBXudeMlwj:91.99.183.160\",\"threadRootId\":null,\"updatedAt\":1777038282113},\"scope:102440|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102416\",\"title\":\"Anonymous-1776756560671\",\"sessionId\":102440,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1777051921628},\"scope:102416|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102416\",\"title\":\"Anonymous-1776581521763\",\"sessionId\":102416,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1777114451964}}',NULL,NULL,NULL,NULL,NULL,'2026-04-22 04:39:01','2026-04-25 10:54:12',1),
(414,'45065014-46dc-45bd-b0a9-4a40a6e483ae','scope:!uhFlPcMrDBXudeMlwj:91.99.183.160|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102440','group chat',712,'!uhFlPcMrDBXudeMlwj:91.99.183.160',NULL,'2026-04-22 04:40:42','2026-04-24 13:44:42',1),
(416,'45065014-46dc-45bd-b0a9-4a40a6e483ae','scope:102440|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102416','Anonymous-1776756560671',102440,NULL,NULL,'2026-04-22 04:41:44','2026-04-24 17:32:01',1),
(419,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','scope:102447|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102447','guest_aoayqfdhk5dj',102447,NULL,NULL,'2026-04-22 05:15:06','2026-04-22 05:15:06',1),
(420,'057b64db-a659-4a42-bc31-fcc63dc37737','scope:102453|thread:main','<p style=\"text-align: left;\">hallo i am qr dude </p>','/sessions/user/view/session/102453','shaziaconsultant2',102453,NULL,NULL,'2026-04-22 12:24:56','2026-04-22 12:25:02',1),
(421,'057b64db-a659-4a42-bc31-fcc63dc37737','scope:__draft-index__|thread:main','{\"scope:102453|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102453\",\"title\":\"shaziaconsultant2\",\"sessionId\":102453,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776860702944}}',NULL,NULL,NULL,NULL,NULL,'2026-04-22 12:24:56','2026-04-22 12:25:02',1),
(422,'ff691d60-b1ad-4d29-955d-118455c10ede','scope:102454|thread:main','<p style=\"text-align: left;\">Hallo Sie haben mir eine E-Mail zugesendet mit dem link hier bin ich </p>','/sessions/user/view/session/102454','shaziaconsultant2',102454,NULL,NULL,'2026-04-22 12:29:06','2026-04-22 12:29:30',1),
(423,'ff691d60-b1ad-4d29-955d-118455c10ede','scope:__draft-index__|thread:main','{\"scope:102454|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102454\",\"title\":\"shaziaconsultant2\",\"sessionId\":102454,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776860970746}}',NULL,NULL,NULL,NULL,NULL,'2026-04-22 12:29:06','2026-04-22 12:29:30',1),
(425,'200897f5-b32e-4e2e-804e-817a27400e60','scope:102452|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102394','Anonymous-1776846180451',102452,NULL,NULL,'2026-04-22 12:50:52','2026-04-23 13:54:37',1),
(426,'f5634c10-409b-42ae-964f-e6fb61ec005c','scope:102455|thread:main','<p style=\"text-align: left;\">hi</p>','/sessions/user/view/session/102455','shaziaconsultant1',102455,NULL,NULL,'2026-04-22 13:30:22','2026-04-22 13:30:24',1),
(427,'f5634c10-409b-42ae-964f-e6fb61ec005c','scope:__draft-index__|thread:main','{\"scope:102455|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102455\",\"title\":\"shaziaconsultant1\",\"sessionId\":102455,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776864625011}}',NULL,NULL,NULL,NULL,NULL,'2026-04-22 13:30:23','2026-04-22 13:30:25',1),
(429,'97b0bea3-55a6-4d90-8664-dd909dd78ae6','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-22 19:28:49','2026-04-22 19:28:49',1),
(434,'3ad3bed0-0c07-4862-b158-ebcd031979a1','scope:__draft-index__|thread:main','{\"scope:102457|thread:main\":{\"actionPath\":\"/sessions/consultant/sessionView/session/102457\",\"title\":\"qrcodeuser2\",\"sessionId\":102457,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776955624637}}',NULL,NULL,NULL,NULL,NULL,'2026-04-23 10:15:21','2026-04-23 14:47:05',1),
(436,'463f2bbc-ed6d-474d-9e4f-5c723452e01d','scope:__draft-index__|thread:main','{}',NULL,NULL,NULL,NULL,NULL,'2026-04-23 10:27:20','2026-04-23 10:27:22',1),
(437,'200897f5-b32e-4e2e-804e-817a27400e60','scope:!uhFlPcMrDBXudeMlwj:91.99.183.160|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/711','group chat',712,'!uhFlPcMrDBXudeMlwj:91.99.183.160',NULL,'2026-04-23 13:50:33','2026-04-23 13:54:13',1),
(439,'50c78e23-393c-47ae-a044-c810a18b3470','scope:__draft-index__|thread:main','{\"scope:102471|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102472\",\"title\":null,\"sessionId\":102471,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776954933817},\"scope:102472|thread:$SEjpRmaPnK0Y5qVLKCmh7xbIJa2Uk_c9lMPK8eqNZ5s\":{\"actionPath\":\"/sessions/user/view/session/102472?threadRootId=%24SEjpRmaPnK0Y5qVLKCmh7xbIJa2Uk_c9lMPK8eqNZ5s\",\"title\":null,\"sessionId\":102472,\"roomRef\":null,\"threadRootId\":\"$SEjpRmaPnK0Y5qVLKCmh7xbIJa2Uk_c9lMPK8eqNZ5s\",\"updatedAt\":1776954921931},\"scope:102472|thread:main\":{\"actionPath\":\"/sessions/user/view/session/102472\",\"title\":null,\"sessionId\":102472,\"roomRef\":null,\"threadRootId\":null,\"updatedAt\":1776954936650}}',NULL,NULL,NULL,NULL,NULL,'2026-04-23 14:27:57','2026-04-23 14:35:37',21),
(446,'3ad3bed0-0c07-4862-b158-ebcd031979a1','scope:102457|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102457','qrcodeuser2',102457,NULL,NULL,'2026-04-23 14:47:04','2026-04-23 14:47:04',1),
(450,'45065014-46dc-45bd-b0a9-4a40a6e483ae','scope:102416|thread:main','<p style=\"text-align: left;\"></p>','/sessions/consultant/sessionView/session/102416','Anonymous-1776581521763',102416,NULL,NULL,'2026-04-23 15:07:44','2026-04-25 10:54:11',1);
/*!40000 ALTER TABLE `draft_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_notification`
--

DROP TABLE IF EXISTS `event_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recipient_user_id` varchar(64) NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `category` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text DEFAULT NULL,
  `action_path` varchar(512) DEFAULT NULL,
  `source_session_id` bigint(20) DEFAULT NULL,
  `read_date` datetime DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_event_notification_recipient_create` (`recipient_user_id`,`create_date`),
  KEY `idx_event_notification_recipient_read` (`recipient_user_id`,`read_date`),
  KEY `idx_event_notification_tenant` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_notification`
--

LOCK TABLES `event_notification` WRITE;
/*!40000 ALTER TABLE `event_notification` DISABLE KEYS */;
INSERT INTO `event_notification` VALUES
(110,'9c5eb650-9cfe-4d8d-b530-ecc3ad54b102','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!cBELUXzWFMqvIocTzM:91.99.183.160/102317',102317,NULL,'2026-03-13 17:43:38',NULL),
(111,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-03-13 17:44:23',NULL),
(112,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-03-13 17:46:59',NULL),
(113,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message: \"Hello There\"','/sessions/user/view/!eyryusdzsuxnPZAIud:91.99.183.160/102319',102319,NULL,'2026-03-13 17:47:54',NULL),
(114,'738c5428-afe5-458e-a0c8-92e960f677a6','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant2. Chat is now active.','/sessions/user/view/!acGRUXIiuOIEQeBVYp:91.99.183.160/102321',102321,NULL,'2026-03-13 17:53:55',NULL),
(115,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message: \"iH\"','/sessions/user/view/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,NULL,'2026-03-13 18:00:22',NULL),
(116,'group-chat-system','message.new','message','New message','shaziaconsultant3 sent a new message: \"Hi\"','/sessions/user/view/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,NULL,'2026-03-13 18:00:25',NULL),
(117,'group-chat-system','message.new','message','New message','shaziaconsultant3 sent a new message: \"Hello\"','/sessions/user/view/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,NULL,'2026-03-13 18:00:34',NULL),
(118,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziaconsultant3 sent a new message: \"Hello\"','/sessions/consultant/sessionView/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,'2026-03-15 18:02:30','2026-03-13 18:00:34',NULL),
(119,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message: \"hi\"','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-03-15 18:02:29','2026-03-13 18:37:55',NULL),
(120,'9602ea11-62ce-462d-b62e-bc311c03a54e','inquiry.accepted','system','Inquiry accepted','Your request was accepted by consultant backup. Chat is now active.','/sessions/user/view/!eGEjMhGBRbvhYDFcSw:91.99.183.160/102324',102324,NULL,'2026-03-13 19:58:32',NULL),
(121,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message: \"<p>mintcheck123</p>\"','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-03-18 13:01:05','2026-03-17 10:28:36',NULL),
(122,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message: \"<p>[[hl:#b2f2bb]]minttokenverify[[/hl]]</p>\"','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-03-18 13:00:59','2026-03-17 10:28:41',NULL),
(123,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message: \"<p>[[hl:#ffcdd2]]uiverifymint[[/hl]]</p>\"','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-03-18 13:01:07','2026-03-17 10:39:31',1),
(124,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message: \"<p>Hello All</p>\"','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-17 11:42:20',NULL),
(125,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message: \"[VISIBLE_TO:@shaziaconsultant2:91.99.183.160] <p>Hello consultant 2</p>\"','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-17 11:42:40',NULL),
(126,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message: \"[VISIBLE_TO:@shaziaconsultant3:91.99.183.160] <p>Hello consultant 3</p>\"','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-17 11:42:58',NULL),
(127,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message: \"[VISIBLE_TO:@shaziaconsultant2:91.99.183.160] <p></p>\"','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-17 11:44:02',NULL),
(128,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','supervisor.added','system','Consultant added to your chat','shazia consultant2 was added as a consultant supervisor to your chat #102318.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-03-17 13:08:28',NULL),
(129,'200897f5-b32e-4e2e-804e-817a27400e60','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102318.','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-03-18 13:01:59','2026-03-17 13:08:28',NULL),
(130,'group-chat-system','message.new','message','New message','bjoern_ratgeber sent a new message: \"[VISIBLE_TO:@frankrat:91.99.183.160] <p>Testnachricht</p><p></p>\"','/sessions/user/view/!mFqLbgguXCTwMSLWQI:91.99.183.160/102351',102351,NULL,'2026-03-24 12:54:20',NULL),
(131,'group-chat-system','thread.reply.new','message','New thread reply','bjoern_ratgeber replied under thread \"<p>Testnachricht</p><p></p>\": \"[VISIBLE_TO:@frankrat:91.99.183.160] <p>Testantwort</p>\"','/sessions/user/view/!mFqLbgguXCTwMSLWQI:91.99.183.160/102351?threadRootId=%7E%21mFqLbgguXCTwMSLWQI%3A91.99.183.160%3Am1774356859997.0',102351,NULL,'2026-03-24 12:54:36',NULL),
(132,'group-chat-system','message.new','message','New message','bjoern_ratgeber sent a new message: \"[VISIBLE_TO:@frankrat:91.99.183.160] <p></p><ul><li><p><strong><em>[[hl:#ffcdd2]]uiea[[/hl]]</em></strong></p></li><l...\"','/sessions/user/view/!mFqLbgguXCTwMSLWQI:91.99.183.160/102351',102351,NULL,'2026-03-24 12:56:13',NULL),
(133,'group-chat-system','message.new','message','New message','bjoern_ratgeber sent a new message: \"[VISIBLE_TO:@frankrat:91.99.183.160] <p>[[hl:#b3e5fc]]uiaeuiaedtrnnuiaedtrnn[[/hl]]</p>\"','/sessions/user/view/!mFqLbgguXCTwMSLWQI:91.99.183.160/102351',102351,NULL,'2026-03-24 12:56:25',NULL),
(134,'72a86228-36e2-4c9d-9067-091672e9b058','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!QwHYclrfayTwFwUKzL:91.99.183.160/102352',102352,NULL,'2026-03-25 14:11:15',1),
(135,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','Anonymous-1774447780792 sent a new message.','/sessions/consultant/sessionView/!QwHYclrfayTwFwUKzL:91.99.183.160/102352',102352,'2026-03-25 14:12:34','2026-03-25 14:12:20',1),
(136,'81b00232-70d8-4abb-bf3e-4160033aa4b1','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!uTfyvHhRsZDjCWUDvQ:91.99.183.160/102353',102353,NULL,'2026-03-25 14:56:10',1),
(137,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!SjDmpOQsXmbnlRgLCa:91.99.183.160/102354',102354,NULL,'2026-03-25 14:56:32',1),
(138,'b14b7574-0aab-4b7e-97c0-6e7bf87b64b4','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!onxqpPNUGXYqGPAcpt:91.99.183.160/102355',102355,NULL,'2026-03-25 17:58:46',1),
(139,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','userafterredeploy sent a new message.','/sessions/consultant/sessionView/!uTfyvHhRsZDjCWUDvQ:91.99.183.160/102353',102353,'2026-04-04 12:11:28','2026-03-25 19:58:04',1),
(140,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 01:12:24',1),
(141,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:32:57',1),
(142,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:34:19',1),
(143,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:39:05',1),
(144,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:39:11',1),
(145,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:39:27',1),
(146,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:40:17',1),
(147,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:41:01',1),
(148,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:44:48',1),
(149,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 21:57:41',1),
(150,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 22:06:19',1),
(151,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 22:28:26',1),
(152,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-28 22:28:33',1),
(153,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!WhzCjFlPdEVrCvQsVx:91.99.183.160/102325',102325,NULL,'2026-03-29 00:18:59',1),
(154,'bed9933c-58be-41b5-8848-3dde2ad3150d','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!mGxGwJngSHbRBMogAc:91.99.183.160/102328',102328,NULL,'2026-04-02 20:52:04',1),
(155,'bed9933c-58be-41b5-8848-3dde2ad3150d','supervisor.added','system','Consultant added to your chat','shazia consultant2 was added as a consultant supervisor to your chat #102328.','/sessions/user/view/!mGxGwJngSHbRBMogAc:91.99.183.160/102328',102328,NULL,'2026-04-02 20:53:07',1),
(156,'200897f5-b32e-4e2e-804e-817a27400e60','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102328.','/sessions/consultant/sessionView/!mGxGwJngSHbRBMogAc:91.99.183.160/102328',102328,'2026-04-22 13:03:22','2026-04-02 20:53:07',1),
(157,'1027e24a-ffd7-4d67-8372-c6da26fba9c6','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!MGxeAlEJNYiaYNGfsc:91.99.183.160/102323',102323,NULL,'2026-04-02 20:56:49',1),
(158,'1027e24a-ffd7-4d67-8372-c6da26fba9c6','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!MGxeAlEJNYiaYNGfsc:91.99.183.160/102323',102323,NULL,'2026-04-02 20:57:22',1),
(159,'9958b336-a315-4b9c-be6f-dafed64e86c3','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!pclhnpRSSHnLKrhoTu:91.99.183.160/102326',102326,NULL,'2026-04-02 20:57:49',1),
(160,'9958b336-a315-4b9c-be6f-dafed64e86c3','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pclhnpRSSHnLKrhoTu:91.99.183.160/102326',102326,NULL,'2026-04-02 20:58:18',1),
(161,'b916a4b4-4df3-4eb2-84ee-2819cfcf4779','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!KzDWsEjMRSTPPklTZp:91.99.183.160/102335',102335,NULL,'2026-04-02 21:20:59',1),
(162,'f4cca44f-60f8-43dd-bc0f-90219b898d69','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant2. Chat is now active.','/sessions/user/view/!EsIbckrKAcQhSwTzDM:91.99.183.160/102360',102360,NULL,'2026-04-02 22:32:24',1),
(163,'f4cca44f-60f8-43dd-bc0f-90219b898d69','supervisor.added','system','Consultant added to your chat','shazia consultant1 was added as a consultant supervisor to your chat #102360.','/sessions/user/view/!EsIbckrKAcQhSwTzDM:91.99.183.160/102360',102360,NULL,'2026-04-02 22:32:48',1),
(164,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102360.','/sessions/consultant/sessionView/!EsIbckrKAcQhSwTzDM:91.99.183.160/102360',102360,'2026-04-04 02:55:33','2026-04-02 22:32:48',1),
(165,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382',102382,'2026-04-03 11:38:39','2026-04-03 11:09:42',1),
(166,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shazia sent a new message.','/sessions/consultant/sessionView/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382',102382,'2026-04-03 20:55:23','2026-04-03 11:25:20',1),
(167,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shazia sent a new message.','/sessions/consultant/sessionView/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382',102382,'2026-04-04 02:55:09','2026-04-03 11:31:34',1),
(168,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','supervisor.added','system','Consultant added to your chat','shazia consultant2 was added as a consultant supervisor to your chat #102382.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382',102382,NULL,'2026-04-03 21:15:31',1),
(169,'200897f5-b32e-4e2e-804e-817a27400e60','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102382.','/sessions/consultant/sessionView/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382',102382,'2026-04-22 13:02:47','2026-04-03 21:15:31',1),
(170,'99f18b34-24d6-467f-a775-d36545dda70e','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!szccrngkPUGUziciHe:91.99.183.160/102381',102381,NULL,'2026-04-03 21:26:52',1),
(171,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!YWHabfrRKmZdXETzvX:91.99.183.160/102383',102383,NULL,'2026-04-04 19:29:17',1),
(172,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','supervisor.removed','system','Supervisor removed','shazia consultant2 was removed from supervision for chat #102318.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-04 20:13:30',1),
(173,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318?threadRootId=%24ea0g89SzbBBgZ8_XNn040b1ns9OWC-ouzALR1KUcTlU',102318,NULL,'2026-04-04 20:16:11',1),
(174,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318?threadRootId=%24kQg22F6DawuqAdhYrshSAZGwwWNE_fJrylvUD1vcaLw',102318,NULL,'2026-04-05 03:51:58',1),
(175,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318?threadRootId=%24kQg22F6DawuqAdhYrshSAZGwwWNE_fJrylvUD1vcaLw',102318,NULL,'2026-04-05 03:52:12',1),
(176,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382?threadRootId=%241VOTxpimoqnypvdimuP34KoylddWWmgpRBNJJndM1HE',102382,NULL,'2026-04-05 04:30:56',1),
(177,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382?threadRootId=%241VOTxpimoqnypvdimuP34KoylddWWmgpRBNJJndM1HE',102382,NULL,'2026-04-05 04:31:00',1),
(178,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382?threadRootId=%241VOTxpimoqnypvdimuP34KoylddWWmgpRBNJJndM1HE',102382,NULL,'2026-04-05 04:31:06',1),
(179,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382?threadRootId=%241VOTxpimoqnypvdimuP34KoylddWWmgpRBNJJndM1HE',102382,NULL,'2026-04-05 04:31:15',1),
(180,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-05 04:40:23',1),
(181,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 12:12:02',1),
(182,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','supervisor.added','system','Consultant added to your chat','shazia consultant2 was added as a consultant supervisor to your chat #102316.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 12:20:23',1),
(183,'200897f5-b32e-4e2e-804e-817a27400e60','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102316.','/sessions/consultant/sessionView/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,'2026-04-22 13:02:57','2026-04-05 12:20:23',1),
(184,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382?threadRootId=%241VOTxpimoqnypvdimuP34KoylddWWmgpRBNJJndM1HE',102382,NULL,'2026-04-05 12:32:21',1),
(185,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','thread.reply.new','message','New thread reply','shaziaconsultant1 replied in a thread.','/sessions/user/view/!lyzADHTpHrlpOJjTYN:91.99.183.160/102382?threadRootId=%241VOTxpimoqnypvdimuP34KoylddWWmgpRBNJJndM1HE',102382,NULL,'2026-04-05 12:32:42',1),
(186,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-05 12:33:36',1),
(187,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 12:34:04',1),
(188,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!vweXbTlImdWOIegnSC:91.99.183.160/102386',102386,NULL,'2026-04-05 12:40:56',1),
(189,'81b00232-70d8-4abb-bf3e-4160033aa4b1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!uTfyvHhRsZDjCWUDvQ:91.99.183.160/102353',102353,NULL,'2026-04-05 12:43:34',1),
(190,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 12:58:33',1),
(191,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 13:01:51',1),
(192,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 13:02:45',1),
(193,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-05 23:33:20',1),
(194,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 04:50:34',1),
(195,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 04:54:18',1),
(196,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 04:58:30',1),
(197,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 04:58:59',1),
(198,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 05:07:30',1),
(199,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 05:12:24',1),
(200,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 05:15:28',1),
(201,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!vweXbTlImdWOIegnSC:91.99.183.160/102386',102386,NULL,'2026-04-06 11:00:09',1),
(202,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!vweXbTlImdWOIegnSC:91.99.183.160/102386',102386,NULL,'2026-04-06 11:00:27',1),
(203,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!vweXbTlImdWOIegnSC:91.99.183.160/102386',102386,NULL,'2026-04-06 11:00:39',1),
(204,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-06 12:09:56',1),
(205,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-07 08:37:52',1),
(206,'500d9ef2-1d5e-4334-966d-0e083c13c339','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!PjKmFwPetAWwXICHui:91.99.183.160/102395',102395,NULL,'2026-04-07 13:03:38',1),
(207,'group-chat-system-1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!SjDmpOQsXmbnlRgLCa:91.99.183.160/102354',102354,NULL,'2026-04-08 02:43:09',1),
(208,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,NULL,'2026-04-08 07:58:17',1),
(209,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,NULL,'2026-04-08 07:58:42',1),
(210,'group-chat-system','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!QIGYiwWjCnslNwURfr:91.99.183.160/102322',102322,NULL,'2026-04-08 07:58:49',1),
(211,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-09 07:05:52',1),
(212,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-09 07:15:04',1),
(213,'b2dbe7fc-125e-4625-ab27-ae68504bcf6c','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!bvYlnPGBXTrxkWBSar:91.99.183.160/102396',102396,NULL,'2026-04-09 07:20:34',1),
(214,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-09 07:44:41',1),
(215,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','supervisor.added','system','Consultant added to your chat','shazia consultant3 was added as a consultant supervisor to your chat #102316.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-09 11:22:19',1),
(216,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102316.','/sessions/consultant/sessionView/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-09 11:22:19',1),
(217,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-10 06:51:21',1),
(218,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','supervisor.removed','system','Supervisor removed','shazia consultant2 was removed from supervision for chat #102316.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-10 22:15:23',1),
(219,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','supervisor.removed','system','Supervisor removed','shazia consultant3 was removed from supervision for chat #102316.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-10 22:15:32',1),
(220,'d996f341-ef1e-48ad-8ac9-786196d8cd21','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!TXqZeQKevUWzuQKSBv:91.99.183.160/102345',102345,NULL,'2026-04-11 07:59:47',1),
(221,'ca2a5bfe-6ff7-4eeb-ab39-fc0ffd35a87e','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!ODkQzpnfdZOgXqMXbP:91.99.183.160/102346',102346,NULL,'2026-04-11 12:01:13',1),
(222,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-11 19:23:55',1),
(223,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-11 19:24:22',1),
(224,'1c62e730-52df-4782-8548-4bb96a5b5bcb','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!LqgKiuaMgZwQYhKUAD:91.99.183.160/102347',102347,NULL,'2026-04-11 20:54:35',1),
(225,'1c62e730-52df-4782-8548-4bb96a5b5bcb','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!LqgKiuaMgZwQYhKUAD:91.99.183.160/102347',102347,NULL,'2026-04-11 20:55:27',1),
(226,'efb28176-89c4-48e6-830e-5859f6293376','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!kkMupRfhJGtPCInXzw:91.99.183.160/102385',102385,NULL,'2026-04-11 21:07:20',1),
(227,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-12 05:47:30',1),
(228,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-12 05:47:40',1),
(229,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-12 06:03:01',1),
(230,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-12 09:52:23',1),
(231,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-12 09:52:50',1),
(232,'25680a88-64c2-4cad-b3df-e2f312fbdd99','inquiry.accepted','system','Inquiry accepted','Your request was accepted by Ingrid Sullime. Chat is now active.','/sessions/user/view/!WJumDHRvkMCGNqOYWV:91.99.183.160/102407',102407,NULL,'2026-04-14 06:56:40',22),
(233,'25680a88-64c2-4cad-b3df-e2f312fbdd99','message.new','message','New message','ingridsullime sent a new message.','/sessions/user/view/!WJumDHRvkMCGNqOYWV:91.99.183.160/102407',102407,NULL,'2026-04-14 06:56:46',22),
(234,'482a558e-d07b-4fbc-a9d8-02394ffd729e','message.new','message','New message','Anonymous-1776149651799 sent a new message.','/sessions/consultant/sessionView/!WJumDHRvkMCGNqOYWV:91.99.183.160/102407',102407,'2026-04-14 07:46:25','2026-04-14 07:03:19',22),
(235,'71f98872-e0d4-4e74-b521-9e618397cc2c','inquiry.accepted','system','Inquiry accepted','Your request was accepted by Ingrid Sullime. Chat is now active.','/sessions/user/view/!IoYxorpsTnEhdZVIRJ:91.99.183.160/102409',102409,NULL,'2026-04-14 07:29:04',22),
(236,'71f98872-e0d4-4e74-b521-9e618397cc2c','message.new','message','New message','ingridsullime sent a new message.','/sessions/user/view/!IoYxorpsTnEhdZVIRJ:91.99.183.160/102409',102409,NULL,'2026-04-14 07:29:20',22),
(237,'482a558e-d07b-4fbc-a9d8-02394ffd729e','message.new','message','New message','Anonymous-1776151635158 sent a new message.','/sessions/consultant/sessionView/!IoYxorpsTnEhdZVIRJ:91.99.183.160/102409',102409,'2026-04-14 11:37:54','2026-04-14 07:46:36',22),
(238,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-04-22 22:11:32','2026-04-15 07:45:23',1),
(239,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','message.new','message','New message','shaziauser1 sent a new message.','/sessions/user/view/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,'2026-04-22 22:11:31','2026-04-15 07:47:13',1),
(240,'1a576539-af4b-4894-8404-b678441a6477','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!VDDTSGNcPlBJthEqRi:91.99.183.160/102421',102421,NULL,'2026-04-19 09:25:31',1),
(241,'ce501717-d465-4ac4-a2cf-ae1841655c08','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!JkNcMxEYzDhmpRedKp:91.99.183.160/102422',102422,NULL,'2026-04-19 10:47:54',1),
(242,'066bdcca-0d2d-4175-90a7-7a4b40c6b377','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!dppIgDQClVzybwjeGG:91.99.183.160/102420',102420,NULL,'2026-04-19 10:50:05',1),
(243,'f79b9384-3a8d-43a3-bf84-c7281f2af9b7','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!phQozIYrSZSMnTgaGS:91.99.183.160/102327',102327,NULL,'2026-04-19 19:24:56',1),
(244,'04d6f440-7f1f-41a2-b7d5-b37ac3282a5e','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!ZQUEqEmEqDlyxaIjHp:91.99.183.160/102329',102329,NULL,'2026-04-19 19:27:37',1),
(245,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!pbZoWgAXTTZjxASxuy:91.99.183.160/102316',102316,NULL,'2026-04-19 19:37:54',1),
(246,'a8e20c59-a046-43e6-90fe-307e7733499d','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!HmHTbYjIOTeQcXJlkj:91.99.183.160/102418',102418,NULL,'2026-04-19 19:39:11',1),
(247,'774f8648-f80a-4048-b99a-1841b2272c4c','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!CHLKUMBbjXRAhDczFz:91.99.183.160/102423',102423,NULL,'2026-04-19 19:40:45',1),
(248,'176c42f5-2262-4baa-8ee3-c11c27461d6a','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!vXgOfVtMeyHOFtZCRi:91.99.183.160/102426',102426,NULL,'2026-04-20 06:19:07',1),
(249,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','Anonymous-1776665764259 sent a new message.','/sessions/consultant/sessionView/!vXgOfVtMeyHOFtZCRi:91.99.183.160/102426',102426,NULL,'2026-04-20 06:20:39',1),
(250,'5e8b987d-ac54-42da-a11b-15c84c4e1fee','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!lRqMPRSAfBqVvPPjjP:91.99.183.160/102427',102427,NULL,'2026-04-20 06:48:38',1),
(251,'e24bf81a-8f22-40ca-a7d6-1f2852daabb3','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!SLlhnMCLpsKucDiMax:91.99.183.160/102428',102428,'2026-04-20 06:53:23','2026-04-20 06:52:08',1),
(252,'f13085a2-2d0a-428e-af71-3001ff20b61f','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!KWlQfQQaFNmFEEZGqp:91.99.183.160/102430',102430,NULL,'2026-04-20 06:58:48',1),
(253,'023ee47f-190c-4087-ba36-0b5f89a4c517','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!XGjJgVvqbDSKpSwIDi:91.99.183.160/102425',102425,NULL,'2026-04-20 11:15:48',1),
(254,'023ee47f-190c-4087-ba36-0b5f89a4c517','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!XGjJgVvqbDSKpSwIDi:91.99.183.160/102425',102425,NULL,'2026-04-20 11:16:07',1),
(255,'023ee47f-190c-4087-ba36-0b5f89a4c517','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!XGjJgVvqbDSKpSwIDi:91.99.183.160/102425',102425,NULL,'2026-04-20 11:16:22',1),
(256,'023ee47f-190c-4087-ba36-0b5f89a4c517','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!XGjJgVvqbDSKpSwIDi:91.99.183.160/102425',102425,NULL,'2026-04-20 11:16:30',1),
(257,'f688cc36-dab9-4da1-a354-46914088190f','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!OiAOEsBULzvurJPkjY:91.99.183.160/102417',102417,NULL,'2026-04-20 11:30:10',1),
(258,'2b09f883-10c0-4736-8ee2-4740fc02aad1','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!gehblbffoPDcWPdIrm:91.99.183.160/102437',102437,NULL,'2026-04-20 16:16:18',1),
(259,'2b09f883-10c0-4736-8ee2-4740fc02aad1','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!gehblbffoPDcWPdIrm:91.99.183.160/102437',102437,NULL,'2026-04-20 16:16:26',1),
(260,'group-chat-system-1','message.new','message','New message','nikunjagency sent a new message.','/sessions/user/view/!uhFlPcMrDBXudeMlwj:91.99.183.160/102441',102441,NULL,'2026-04-22 04:39:05',1),
(261,'f1306bed-6325-4bdd-bcda-fa53df72ef33','inquiry.accepted','system','Inquiry accepted','Your request was accepted by nikunj agency. Chat is now active.','/sessions/user/view/!mNZrDoFZKJPyCcDIxk:91.99.183.160/102440',102440,NULL,'2026-04-22 04:41:31',1),
(262,'f1306bed-6325-4bdd-bcda-fa53df72ef33','message.new','message','New message','nikunjagency sent a new message.','/sessions/user/view/!mNZrDoFZKJPyCcDIxk:91.99.183.160/102440',102440,NULL,'2026-04-22 04:41:36',1),
(263,'e4e6b006-b1ef-4a74-8bb6-70183cbff31f','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!jcqNxjZwevoxlyniHn:91.99.183.160/102447',102447,NULL,'2026-04-22 05:14:43',1),
(264,'e4e6b006-b1ef-4a74-8bb6-70183cbff31f','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!jcqNxjZwevoxlyniHn:91.99.183.160/102447',102447,NULL,'2026-04-22 05:15:00',1),
(265,'bda23150-cc97-4271-afd5-4dc5a10b5970','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!aPudmawkdNnlhzXLRb:91.99.183.160/102449',102449,NULL,'2026-04-22 05:23:42',1),
(266,'1c11133b-21b1-4ab4-9500-52b89ac01aea','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!ZxLWnLhXGclKNxtpRv:91.99.183.160/102442',102442,NULL,'2026-04-22 06:18:15',1),
(267,'caa721b6-4bf0-4388-833c-9f08f431dcbc','inquiry.accepted','system','Inquiry accepted','Your request was accepted by Shazia Caritastest. Chat is now active.','/sessions/user/view/!MRFYuyoeaLVVfxlVLf:91.99.183.160/102394',102394,NULL,'2026-04-22 12:49:32',1),
(268,'b20520e6-827c-431f-8dd1-cf94fe576c1b','inquiry.accepted','system','Inquiry accepted','Your request was accepted by Shazia Caritastest. Chat is now active.','/sessions/user/view/!qurLLUFUsyZvzvyzYp:91.99.183.160/102452',102452,NULL,'2026-04-22 12:50:10',1),
(269,'b20520e6-827c-431f-8dd1-cf94fe576c1b','message.new','message','New message','Shazia Caritastest sent a new message.','/sessions/user/view/!qurLLUFUsyZvzvyzYp:91.99.183.160/102452',102452,NULL,'2026-04-22 12:50:21',1),
(270,'97b0bea3-55a6-4d90-8664-dd909dd78ae6','message.new','message','New message','shaziaconsultant1 sent a new message.','/sessions/user/view/!zFjJEuiiIpahpLUkTt:91.99.183.160/102457',102457,NULL,'2026-04-22 14:29:38',1),
(271,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message.','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-22 22:11:09',1),
(272,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message.','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-22 22:12:03',1),
(273,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message.','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-22 22:16:43',1),
(274,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message.','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-22 22:17:27',1),
(275,'3ad3bed0-0c07-4862-b158-ebcd031979a1','inquiry.accepted','system','Inquiry accepted','Your request was accepted by shazia consultant1. Chat is now active.','/sessions/user/view/!RZSiHWtfoKqgGZpEfB:91.99.183.160/102467',102467,NULL,'2026-04-23 10:15:31',1),
(276,'f1306bed-6325-4bdd-bcda-fa53df72ef33','supervisor.added','system','Consultant added to your chat','shazia consultant1 was added as a consultant supervisor to your chat #102440.','/sessions/user/view/!mNZrDoFZKJPyCcDIxk:91.99.183.160/102440',102440,NULL,'2026-04-23 14:37:51',1),
(277,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','supervisor.assigned','system','Supervisor assignment','You were added as supervisor to chat #102440.','/sessions/consultant/sessionView/!mNZrDoFZKJPyCcDIxk:91.99.183.160/102440',102440,NULL,'2026-04-23 14:37:51',1),
(278,'dd126e91-306f-4d3a-bf43-252495b2075f','inquiry.accepted','system','Inquiry accepted','Your request was accepted by nikunj agency. Chat is now active.','/sessions/user/view/!rdIQptrRnNASaHIBjz:91.99.183.160/102416',102416,NULL,'2026-04-23 15:06:21',1),
(279,'dd126e91-306f-4d3a-bf43-252495b2075f','message.new','message','New message','nikunjagency sent a new message.','/sessions/user/view/!rdIQptrRnNASaHIBjz:91.99.183.160/102416',102416,NULL,'2026-04-23 15:06:32',1),
(280,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','message.new','message','New message','shaziauser1 sent a new message.','/sessions/consultant/sessionView/!EayEdVfEprTxtpHaYN:91.99.183.160/102318',102318,NULL,'2026-04-25 10:55:01',1);
/*!40000 ALTER TABLE `event_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_chat_participant`
--

DROP TABLE IF EXISTS `group_chat_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_chat_participant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) unsigned NOT NULL,
  `consultant_id` varchar(36) NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_chat_consultant` (`chat_id`,`consultant_id`),
  KEY `idx_consultant` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_chat_participant`
--

LOCK TABLES `group_chat_participant` WRITE;
/*!40000 ALTER TABLE `group_chat_participant` DISABLE KEYS */;
INSERT INTO `group_chat_participant` VALUES
(261,701,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-03-13 17:47:43'),
(262,102319,'200897f5-b32e-4e2e-804e-817a27400e60','2026-03-13 17:47:43'),
(263,702,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-03-13 17:52:02'),
(264,102320,'200897f5-b32e-4e2e-804e-817a27400e60','2026-03-13 17:52:02'),
(265,703,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-03-13 18:00:11'),
(266,102322,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','2026-03-13 18:00:11'),
(267,704,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-03-17 11:35:08'),
(268,102325,'200897f5-b32e-4e2e-804e-817a27400e60','2026-03-17 11:35:08'),
(269,102325,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','2026-03-17 11:35:09'),
(270,705,'683de8dc-cb80-4ef4-aa8e-d8ac14c74d7e','2026-03-24 12:54:08'),
(271,102351,'2d535e38-f6da-4142-8273-6c74f0ca4e13','2026-03-24 12:54:08'),
(272,706,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-03-25 14:56:23'),
(273,102354,'200897f5-b32e-4e2e-804e-817a27400e60','2026-03-25 14:56:23'),
(274,707,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-03 21:26:32'),
(275,102383,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','2026-04-03 21:26:32'),
(276,708,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-04 19:21:54'),
(277,102386,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','2026-04-04 19:21:54'),
(278,709,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-06 12:21:57'),
(279,102392,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','2026-04-06 12:21:58'),
(280,102392,'200897f5-b32e-4e2e-804e-817a27400e60','2026-04-06 12:21:58'),
(281,710,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-06 12:23:17'),
(282,102393,'200897f5-b32e-4e2e-804e-817a27400e60','2026-04-06 12:23:17'),
(283,711,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-09 11:23:28'),
(284,102397,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','2026-04-09 11:23:28'),
(285,102397,'200897f5-b32e-4e2e-804e-817a27400e60','2026-04-09 11:23:28'),
(286,712,'45065014-46dc-45bd-b0a9-4a40a6e483ae','2026-04-22 04:38:51'),
(287,102441,'200897f5-b32e-4e2e-804e-817a27400e60','2026-04-22 04:38:51'),
(288,102441,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-22 04:38:52');
/*!40000 ALTER TABLE `group_chat_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_tombstone`
--

DROP TABLE IF EXISTS `identity_tombstone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_tombstone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(64) NOT NULL,
  `subject_type` varchar(16) NOT NULL,
  `display_label` varchar(255) NOT NULL,
  `hard_deleted_at` datetime NOT NULL,
  `source_delete_date` datetime DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_identity_tombstone_subject_id` (`subject_id`),
  KEY `idx_identity_tombstone_subject_type` (`subject_type`),
  KEY `idx_identity_tombstone_deleted_at` (`hard_deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_tombstone`
--

LOCK TABLES `identity_tombstone` WRITE;
/*!40000 ALTER TABLE `identity_tombstone` DISABLE KEYS */;
INSERT INTO `identity_tombstone` VALUES
(1,'1547b3f7-d965-4cd3-a075-8ac196f2d277','USER','Deleted user #1547b3f7','2026-03-29 00:00:00','2026-03-26 20:40:35',1),
(2,'7e69858f-f288-42d4-868a-8bce212873ee','CONSULTANT','Deleted counselor #7e69858f','2026-04-17 00:00:00','2026-04-14 17:12:40',1);
/*!40000 ALTER TABLE `identity_tombstone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inactive_account_notification_audit_log`
--

DROP TABLE IF EXISTS `inactive_account_notification_audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `inactive_account_notification_audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_fingerprint` varchar(255) NOT NULL,
  `account_role` varchar(32) NOT NULL,
  `account_id` varchar(64) NOT NULL,
  `account_tenant_id` bigint(20) DEFAULT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `threshold_days` int(11) NOT NULL,
  `recipient_admin_id` varchar(64) NOT NULL,
  `recipient_email` varchar(255) NOT NULL,
  `email_dispatched` tinyint(1) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_inactive_account_notification_fingerprint` (`notification_fingerprint`),
  KEY `idx_inactive_account_notification_account` (`account_role`,`account_id`),
  KEY `idx_inactive_account_notification_recipient` (`recipient_admin_id`),
  KEY `idx_inactive_account_notification_created` (`create_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inactive_account_notification_audit_log`
--

LOCK TABLES `inactive_account_notification_audit_log` WRITE;
/*!40000 ALTER TABLE `inactive_account_notification_audit_log` DISABLE KEYS */;
INSERT INTO `inactive_account_notification_audit_log` VALUES
(1647,'demo|ASKER|sec6-demo-asker-old|1','ASKER','sec6-demo-asker-old',1,'2025-03-02 13:06:24',365,'demo-admin-1','demo-admin1@oriso-dev.site',0,'2026-03-27 13:00:24',1),
(1648,'demo|CONSULTANT|sec6-demo-cons-old|1','CONSULTANT','sec6-demo-cons-old',1,'2025-02-18 13:06:24',365,'demo-admin-1','demo-admin1@oriso-dev.site',0,'2026-03-27 13:01:24',1),
(1649,'demo|ADMIN|sec6-demo-admin-old|1','ADMIN','sec6-demo-admin-old',1,'2024-11-12 13:06:24',365,'demo-admin-2','demo-admin2@oriso-dev.site',0,'2026-03-27 13:02:24',1),
(1650,'demo|CONSULTANT|sec6-demo-cons-old|global','CONSULTANT','sec6-demo-cons-old',1,'2025-02-18 13:06:24',365,'demo-superadmin','superadmin@oriso-dev.site',0,'2026-03-27 13:03:24',1);
/*!40000 ALTER TABLE `inactive_account_notification_audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_code` varchar(2) NOT NULL,
  `consultant_id` varchar(36) NOT NULL,
  PRIMARY KEY (`consultant_id`,`language_code`),
  CONSTRAINT `language_id_consultant_constraint` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES
('de','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b'),
('en','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` bigint(21) unsigned NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `user_id` varchar(36) NOT NULL,
  `consultant_id` varchar(36) DEFAULT NULL,
  `consulting_type` tinyint(4) NOT NULL,
  `registration_type` varchar(20) NOT NULL DEFAULT 'REGISTERED',
  `message_date` datetime DEFAULT NULL,
  `assign_date` datetime DEFAULT NULL,
  `postcode` varchar(5) NOT NULL,
  `agency_id` bigint(21) unsigned DEFAULT NULL,
  `language_code` varchar(2) NOT NULL DEFAULT 'de',
  `rc_group_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `is_team_session` tinyint(4) NOT NULL DEFAULT 0,
  `is_consultant_directly_set` bit(1) NOT NULL DEFAULT b'0',
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `main_topic_id` bigint(21) DEFAULT NULL,
  `user_gender` varchar(50) DEFAULT NULL,
  `user_age` int(11) DEFAULT NULL,
  `counselling_relation` varchar(50) DEFAULT NULL,
  `referer` varchar(50) DEFAULT NULL,
  `matrix_room_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_consultant_id_status` (`consultant_id`,`status`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `session_ibfk_2` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES
(102316,1,'92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-03-13 17:44:23','12345',237,'de',NULL,2,0,'\0','2026-03-13 17:30:32','2026-04-05 12:34:03',3,NULL,NULL,NULL,NULL,'!pbZoWgAXTTZjxASxuy:91.99.183.160'),
(102317,NULL,'9c5eb650-9cfe-4d8d-b530-ecc3ad54b102','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-03-13 17:43:37','00000',237,'de',NULL,2,0,'\0','2026-03-13 17:42:36','2026-03-13 17:43:37',3,NULL,NULL,NULL,NULL,'!cBELUXzWFMqvIocTzM:91.99.183.160'),
(102318,1,'fe0d0f30-5f17-4a2f-9964-6517a8d96cb3','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-03-13 17:46:58','12345',237,'de',NULL,2,0,'\0','2026-03-13 17:46:37','2026-04-04 20:13:30',3,NULL,NULL,NULL,NULL,'!EayEdVfEprTxtpHaYN:91.99.183.160'),
(102319,NULL,'group-chat-system','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!eyryusdzsuxnPZAIud:91.99.183.160',2,1,'\0','2026-03-13 17:47:42','2026-03-13 17:47:43',NULL,NULL,NULL,NULL,NULL,'!eyryusdzsuxnPZAIud:91.99.183.160'),
(102320,NULL,'group-chat-system','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!OdjkgPJAbIjZigueMZ:91.99.183.160',2,1,'\0','2026-03-13 17:52:02','2026-03-13 17:52:02',NULL,NULL,NULL,NULL,NULL,'!OdjkgPJAbIjZigueMZ:91.99.183.160'),
(102321,NULL,'738c5428-afe5-458e-a0c8-92e960f677a6','200897f5-b32e-4e2e-804e-817a27400e60',1,'REGISTERED',NULL,'2026-03-13 17:53:55','00000',237,'de',NULL,2,0,'\0','2026-03-13 17:53:36','2026-03-13 17:53:55',3,NULL,NULL,NULL,NULL,'!acGRUXIiuOIEQeBVYp:91.99.183.160'),
(102322,1,'group-chat-system','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!QIGYiwWjCnslNwURfr:91.99.183.160',2,1,'\0','2026-03-13 18:00:11','2026-04-08 07:58:17',NULL,NULL,NULL,NULL,NULL,'!QIGYiwWjCnslNwURfr:91.99.183.160'),
(102323,1,'1027e24a-ffd7-4d67-8372-c6da26fba9c6','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-02 20:56:48','00000',237,'de',NULL,2,0,'\0','2026-03-13 19:57:09','2026-04-02 20:56:48',3,NULL,NULL,NULL,NULL,'!MGxeAlEJNYiaYNGfsc:91.99.183.160'),
(102324,NULL,'9602ea11-62ce-462d-b62e-bc311c03a54e','04fa28a4-dad1-471e-a1d7-7fc157292688',1,'REGISTERED',NULL,'2026-03-13 19:58:31','00000',238,'de',NULL,2,0,'\0','2026-03-13 19:58:13','2026-03-13 19:58:31',3,NULL,NULL,NULL,NULL,'!eGEjMhGBRbvhYDFcSw:91.99.183.160'),
(102325,1,'group-chat-system','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!WhzCjFlPdEVrCvQsVx:91.99.183.160',2,1,'\0','2026-03-17 11:35:08','2026-03-28 01:12:24',NULL,NULL,NULL,NULL,NULL,'!WhzCjFlPdEVrCvQsVx:91.99.183.160'),
(102326,1,'9958b336-a315-4b9c-be6f-dafed64e86c3','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-02 20:57:49','00000',237,'de',NULL,2,0,'\0','2026-03-17 14:10:40','2026-04-02 20:57:49',3,NULL,NULL,NULL,NULL,'!pclhnpRSSHnLKrhoTu:91.99.183.160'),
(102327,1,'f79b9384-3a8d-43a3-bf84-c7281f2af9b7','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 19:24:55','00000',237,'de',NULL,2,0,'\0','2026-03-17 19:32:38','2026-04-19 19:24:55',3,NULL,NULL,NULL,NULL,'!phQozIYrSZSMnTgaGS:91.99.183.160'),
(102328,1,'bed9933c-58be-41b5-8848-3dde2ad3150d','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-02 20:52:03','00000',237,'de',NULL,2,0,'\0','2026-03-18 04:45:49','2026-04-02 20:52:03',3,NULL,NULL,NULL,NULL,'!mGxGwJngSHbRBMogAc:91.99.183.160'),
(102329,1,'04d6f440-7f1f-41a2-b7d5-b37ac3282a5e','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 19:27:37','00000',237,'de',NULL,2,0,'\0','2026-03-18 10:45:09','2026-04-19 19:27:37',3,NULL,NULL,NULL,NULL,'!ZQUEqEmEqDlyxaIjHp:91.99.183.160'),
(102330,1,'eb1769d5-0517-429d-8ea5-8a369aeeb0d8',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-03-18 10:58:42','2026-04-13 09:14:56',3,NULL,NULL,NULL,NULL,'!SPPHXHoDeWMdZzfNmz:91.99.183.160'),
(102331,1,'00ccec31-fca9-4b4e-b7ed-55c56b60280c',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-19 00:35:20','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!oubemcOiVNOukYJYuu:91.99.183.160'),
(102332,1,'3bddde71-985d-4264-94d8-074290571b66',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-19 06:43:46','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!sidaOZtqmmnlDATWiZ:91.99.183.160'),
(102333,1,'4449fb58-fa84-4c9a-8da5-814e24c5505e',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-03-19 11:29:38','2026-04-13 09:14:56',3,NULL,NULL,NULL,NULL,'!AzIJTfSCgypZBxBTNL:91.99.183.160'),
(102334,1,'de7613d4-b0d5-4366-bc54-983772703068',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-19 19:51:19','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!mIcStzuUKGeAVoIvzL:91.99.183.160'),
(102335,1,'b916a4b4-4df3-4eb2-84ee-2819cfcf4779','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-02 21:20:59','00000',237,'de',NULL,4,0,'\0','2026-03-19 20:45:58','2026-04-03 03:24:01',3,NULL,NULL,NULL,NULL,'!KzDWsEjMRSTPPklTZp:91.99.183.160'),
(102336,1,'2b134e9f-8397-4910-be3d-91e727d4972d',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-19 21:32:21','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!FJPeTcCthJBDEqbqbj:91.99.183.160'),
(102337,1,'529cd8c3-4049-47b3-b112-f9a356055786',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-20 03:09:50','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!FBxCRmSCuLUYNGRnHk:91.99.183.160'),
(102338,1,'e6bb27b0-f66c-41a7-af1e-da686c0da328',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-20 10:53:59','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!DHPRclRUCrKMqRBqdL:91.99.183.160'),
(102339,1,'0ac1417a-0f1b-4845-b903-e06f40e0dad7',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-20 16:58:16','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!tOoekVUYOmtwFUHcoh:91.99.183.160'),
(102340,1,'0c62b6d8-5cae-47e7-912c-b334d52fcf06',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-20 22:15:27','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!zpvckpCujEQzajeyyU:91.99.183.160'),
(102341,1,'e4ff3273-106c-4df9-b062-09e341ce7c3d',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-20 23:49:16','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!insJcFBaFTPNNKTZSS:91.99.183.160'),
(102342,1,'ac6a6c53-6c4f-4964-a766-f28575a8dd8b',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-21 10:19:40','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!ghiMKzLiMACOQzSNKM:91.99.183.160'),
(102343,1,'7afae28b-9e11-47a9-8311-455bec33a748',NULL,1,'REGISTERED',NULL,NULL,'12345',237,'de',NULL,1,0,'\0','2026-03-21 11:22:02','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!WqZvDGMRmREEQkcpxa:91.99.183.160'),
(102344,1,'d693b4fb-0058-42d5-970f-d402ebc92be0',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-21 11:58:40','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!WqHftYIgrUFHcDlFCF:91.99.183.160'),
(102345,1,'d996f341-ef1e-48ad-8ac9-786196d8cd21','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-11 07:59:47','00000',237,'de',NULL,2,0,'\0','2026-03-21 13:14:38','2026-04-11 07:59:47',3,NULL,NULL,NULL,NULL,'!TXqZeQKevUWzuQKSBv:91.99.183.160'),
(102346,1,'ca2a5bfe-6ff7-4eeb-ab39-fc0ffd35a87e','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-11 12:01:13','00000',237,'de',NULL,2,0,'\0','2026-03-21 15:44:37','2026-04-11 12:01:13',3,NULL,NULL,NULL,NULL,'!ODkQzpnfdZOgXqMXbP:91.99.183.160'),
(102347,1,'1c62e730-52df-4782-8548-4bb96a5b5bcb','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-11 20:54:34','00000',237,'de',NULL,2,0,'\0','2026-03-22 18:29:53','2026-04-11 20:54:34',3,NULL,NULL,NULL,NULL,'!LqgKiuaMgZwQYhKUAD:91.99.183.160'),
(102348,1,'0a77071e-d56d-475c-b5bb-23274cc2656d',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-22 19:10:50','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!SatrgrPqYelNuQtPJR:91.99.183.160'),
(102349,1,'26dc580b-0230-4a4b-b98f-1f23e0d6b06a',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-22 22:38:57','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!pxWqnltpLjSFzUzRgU:91.99.183.160'),
(102350,1,'0ad2a120-e6f4-4d72-a0b8-7e9a1dc10ad1',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-23 16:21:02','2026-03-25 19:51:33',3,NULL,NULL,NULL,NULL,'!TmACCdJUzdGtRNbuFr:91.99.183.160'),
(102351,NULL,'group-chat-system','683de8dc-cb80-4ef4-aa8e-d8ac14c74d7e',1,'REGISTERED',NULL,NULL,'00000',241,'de','!mFqLbgguXCTwMSLWQI:91.99.183.160',2,1,'\0','2026-03-24 12:54:07','2026-03-24 12:54:08',NULL,NULL,NULL,NULL,NULL,'!mFqLbgguXCTwMSLWQI:91.99.183.160'),
(102352,1,'72a86228-36e2-4c9d-9067-091672e9b058','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-03-25 14:11:15','00000',237,'de',NULL,4,0,'\0','2026-03-25 14:09:49','2026-03-30 22:50:54',3,NULL,NULL,NULL,NULL,'!QwHYclrfayTwFwUKzL:91.99.183.160'),
(102353,1,'81b00232-70d8-4abb-bf3e-4160033aa4b1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-03-25 14:56:10','12345',237,'de',NULL,2,0,'\0','2026-03-25 14:55:13','2026-04-05 12:43:34',3,NULL,NULL,NULL,NULL,'!uTfyvHhRsZDjCWUDvQ:91.99.183.160'),
(102354,1,'group-chat-system-1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!SjDmpOQsXmbnlRgLCa:91.99.183.160',2,1,'\0','2026-03-25 14:56:23','2026-03-25 14:56:23',NULL,NULL,NULL,NULL,NULL,'!SjDmpOQsXmbnlRgLCa:91.99.183.160'),
(102355,1,'b14b7574-0aab-4b7e-97c0-6e7bf87b64b4','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-03-25 17:58:45','00000',237,'de',NULL,2,0,'\0','2026-03-25 17:58:05','2026-03-25 17:58:45',3,NULL,NULL,NULL,NULL,'!onxqpPNUGXYqGPAcpt:91.99.183.160'),
(102356,1,'00534109-35aa-43f9-a225-d9c605fe5153',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-03-26 19:00:01','2026-03-26 19:00:02',3,NULL,NULL,NULL,NULL,'!naNaYALiJjBKVcGGrR:91.99.183.160'),
(102357,1,'02cd9a22-11e5-4e5f-9d99-381f3ec809c9',NULL,1,'REGISTERED',NULL,NULL,'79098',237,'de',NULL,1,0,'\0','2026-03-26 20:35:55','2026-03-26 20:35:56',NULL,NULL,17,NULL,'validRef','!hpzpdUffjGHogLNxqd:91.99.183.160'),
(102359,1,'acf2bba0-308e-4f12-b362-0e584b0ba5ba',NULL,1,'REGISTERED',NULL,NULL,'00000',241,'de',NULL,1,0,'\0','2026-03-31 11:58:57','2026-03-31 11:58:58',2,NULL,NULL,NULL,NULL,'!ibGltdaYwNuLdoTXxa:91.99.183.160'),
(102360,1,'f4cca44f-60f8-43dd-bc0f-90219b898d69','200897f5-b32e-4e2e-804e-817a27400e60',1,'REGISTERED',NULL,'2026-04-02 22:32:24','12345',237,'de',NULL,4,0,'\0','2026-04-02 22:31:13','2026-04-22 12:44:45',3,NULL,NULL,NULL,NULL,'!EsIbckrKAcQhSwTzDM:91.99.183.160'),
(102361,1,'6f9b85b7-796b-488f-b1ab-d121b8db9201',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 05:39:42','2026-04-03 05:39:43',3,NULL,NULL,NULL,NULL,'!JFZuUXvVWGXgmesfXn:91.99.183.160'),
(102362,1,'cf319751-dd11-48cc-b8d3-380ee685ce6f',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-03 05:41:09','2026-04-03 05:41:10',3,NULL,NULL,NULL,NULL,'!mBVjvESVIsgCNGJcKB:91.99.183.160'),
(102363,1,'5e3f7380-afd5-40c0-ac33-1624fb1bad12',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 06:24:19','2026-04-03 06:24:19',3,NULL,NULL,NULL,NULL,'!IjiuCvSJAHChWaNfZU:91.99.183.160'),
(102364,1,'2916c0c4-d07e-43d9-afd7-42f10c2df528',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 06:41:34','2026-04-03 06:41:35',3,NULL,NULL,NULL,NULL,'!KgIimiioPQhwtgWRbp:91.99.183.160'),
(102365,1,'d92012ea-1455-47c2-bcf2-5a03355701e0',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-03 06:58:18','2026-04-03 06:58:19',3,NULL,NULL,NULL,NULL,'!rHBsnrLKDenhlbIrAF:91.99.183.160'),
(102366,1,'3ccc6990-792e-479c-93b0-ea344785c8b5',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 06:58:48','2026-04-03 06:58:49',3,NULL,NULL,NULL,NULL,'!ivmsNPotxjdoaDNCUb:91.99.183.160'),
(102367,1,'1ee2a6ec-f914-4246-bc0c-80e5ad27d7bd',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 07:10:44','2026-04-03 07:10:45',3,NULL,NULL,NULL,NULL,'!LpFoMtGnUUIqDwtDce:91.99.183.160'),
(102368,1,'f82c7a88-66c9-4aae-9f1d-4b2ce760580b',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 07:20:51','2026-04-03 07:20:52',3,NULL,NULL,NULL,NULL,'!vorZPiMxkEYBGIbqzY:91.99.183.160'),
(102369,1,'c8189789-b4a9-4a91-abc1-47ebb9c68cd1',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 08:08:22','2026-04-03 08:08:22',3,NULL,NULL,NULL,NULL,'!xMmbfqOsznbWckaDqP:91.99.183.160'),
(102370,1,'8757b99c-179d-42a5-8d5a-1385aa131b92',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 08:24:10','2026-04-03 08:24:11',3,NULL,NULL,NULL,NULL,'!MgghyMsyDOQIebbOjA:91.99.183.160'),
(102371,1,'3d8b5ea3-5efc-4511-b4f9-eddd7f688f3b',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 09:14:14','2026-04-03 09:14:15',3,NULL,NULL,NULL,NULL,'!bfTkHYAzGsJhpGneas:91.99.183.160'),
(102372,1,'7ac80fc2-8790-4f8b-845e-4404a78b5251',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-03 09:26:37','2026-04-03 09:26:38',3,NULL,NULL,NULL,NULL,'!ObMqELVcRBojOvZHhT:91.99.183.160'),
(102373,21,'20155ac6-0d87-438b-9f03-1c8661a89d51',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-03 09:30:35','2026-04-03 09:30:36',1,NULL,NULL,NULL,NULL,'!vmBMhxxUfomQaKQAFI:91.99.183.160'),
(102374,1,'68768641-5fb4-43ef-afe0-50a4afbe44ef',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 09:37:15','2026-04-03 09:37:16',3,NULL,NULL,NULL,NULL,'!fvnEtjSohAgMOAjmZu:91.99.183.160'),
(102375,1,'ac5b5c51-2059-4e25-b800-ecf2c1c05ae3',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 09:55:33','2026-04-03 09:55:34',3,NULL,NULL,NULL,NULL,'!BuSoXprsFBFUlhDfkG:91.99.183.160'),
(102376,21,'844f6358-e287-4308-aebc-a4a63f67fb3d',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-03 10:01:00','2026-04-03 10:01:01',1,NULL,NULL,NULL,NULL,'!wsQsmsEvyuvbzNoMgm:91.99.183.160'),
(102377,1,'503bf91b-96a1-4ae5-821c-fb32d67b682a',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 10:03:36','2026-04-03 10:03:37',3,NULL,NULL,NULL,NULL,'!zHeqeMRzFQhdFPUhLc:91.99.183.160'),
(102378,1,'ae07bffd-0a9f-40e9-a843-af1677e9f0e9',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-03 10:05:24','2026-04-03 10:05:25',3,NULL,NULL,NULL,NULL,'!BqdWCgodhTkxXozmSh:91.99.183.160'),
(102379,21,'6edba0bf-f126-49d8-b00e-ca36a9d4dac0',NULL,1,'REGISTERED',NULL,NULL,'00000',245,'de',NULL,1,0,'\0','2026-04-03 10:12:46','2026-04-03 10:12:47',1,NULL,NULL,NULL,NULL,'!XzokYYnOXwGqNeJTXH:91.99.183.160'),
(102380,1,'a082ca31-30f7-489d-afcc-92d2dc5ebb52',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-03 10:12:56','2026-04-03 10:12:57',3,NULL,NULL,NULL,NULL,'!KJMQTvhUEHtVKINuIe:91.99.183.160'),
(102381,1,'99f18b34-24d6-467f-a775-d36545dda70e','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-03 21:26:51','00000',237,'de',NULL,2,0,'\0','2026-04-03 10:19:10','2026-04-03 21:26:51',3,NULL,NULL,NULL,NULL,'!szccrngkPUGUziciHe:91.99.183.160'),
(102382,1,'9e62108f-0ebe-4799-bee4-2d5c67e5985b','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-03 11:09:41','13055',237,'de',NULL,2,0,'\0','2026-04-03 11:04:38','2026-04-03 11:09:41',3,NULL,NULL,NULL,NULL,'!lyzADHTpHrlpOJjTYN:91.99.183.160'),
(102383,1,'group-chat-system-1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!YWHabfrRKmZdXETzvX:91.99.183.160',2,1,'\0','2026-04-03 21:26:32','2026-04-03 21:26:32',NULL,NULL,NULL,NULL,NULL,'!YWHabfrRKmZdXETzvX:91.99.183.160'),
(102384,1,'be0064d7-01c6-4ebc-8c17-2c84073013ed',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-04 05:16:38','2026-04-04 05:16:38',3,NULL,NULL,NULL,NULL,'!pVYHMrCgnrzdhFjrWG:91.99.183.160'),
(102385,1,'efb28176-89c4-48e6-830e-5859f6293376','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-11 21:07:20','00000',237,'de',NULL,2,0,'\0','2026-04-04 05:31:09','2026-04-11 21:07:20',3,NULL,NULL,NULL,NULL,'!kkMupRfhJGtPCInXzw:91.99.183.160'),
(102386,1,'group-chat-system-1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!vweXbTlImdWOIegnSC:91.99.183.160',2,1,'\0','2026-04-04 19:21:54','2026-04-04 19:21:54',NULL,NULL,NULL,NULL,NULL,'!vweXbTlImdWOIegnSC:91.99.183.160'),
(102387,1,'0218eb0d-42b5-4451-b60b-ba4dbaf3c1da',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-06 11:20:19','2026-04-06 11:20:20',3,NULL,NULL,NULL,NULL,'!sHjeiJowXHyUsDqGxZ:91.99.183.160'),
(102388,21,'b3b34f87-963f-4103-8e5e-8e4895ca4fe7',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-06 11:30:50','2026-04-06 11:30:50',1,NULL,NULL,NULL,NULL,'!cQjLZaiUEblQKzLhVK:91.99.183.160'),
(102389,21,'88e637a3-2e35-450f-adb8-5b38969e204b',NULL,1,'REGISTERED',NULL,NULL,'00000',245,'de',NULL,1,0,'\0','2026-04-06 11:35:57','2026-04-06 11:35:58',1,NULL,NULL,NULL,NULL,'!OSOQrpUaQxAjCiZBPo:91.99.183.160'),
(102390,21,'088cf79e-98d8-47c7-951c-c173b18e3623',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-06 11:47:39','2026-04-06 11:47:39',1,NULL,NULL,NULL,NULL,'!OGAMXWeClAubYISmJl:91.99.183.160'),
(102391,21,'30b6e1e6-6b8a-4142-9db4-1cab4cef43e9',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-06 11:52:09','2026-04-06 11:52:10',1,NULL,NULL,NULL,NULL,'!GdWNQaVBXDlNaAtfjX:91.99.183.160'),
(102392,1,'group-chat-system-1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!sSLCKxBsNCFvaGrXZH:91.99.183.160',2,1,'\0','2026-04-06 12:21:57','2026-04-06 12:21:57',NULL,NULL,NULL,NULL,NULL,'!sSLCKxBsNCFvaGrXZH:91.99.183.160'),
(102393,1,'group-chat-system-1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!YXMYuYptwjGsGpnIgf:91.99.183.160',2,1,'\0','2026-04-06 12:23:17','2026-04-06 12:23:17',NULL,NULL,NULL,NULL,NULL,'!YXMYuYptwjGsGpnIgf:91.99.183.160'),
(102394,1,'caa721b6-4bf0-4388-833c-9f08f431dcbc','200897f5-b32e-4e2e-804e-817a27400e60',1,'REGISTERED',NULL,'2026-04-22 12:49:32','00000',237,'de',NULL,2,0,'\0','2026-04-07 12:45:58','2026-04-22 12:49:32',3,NULL,NULL,NULL,NULL,'!MRFYuyoeaLVVfxlVLf:91.99.183.160'),
(102395,1,'500d9ef2-1d5e-4334-966d-0e083c13c339','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-07 13:03:37','00000',237,'de',NULL,2,0,'\0','2026-04-07 13:02:16','2026-04-07 13:03:37',3,NULL,NULL,NULL,NULL,'!PjKmFwPetAWwXICHui:91.99.183.160'),
(102396,1,'b2dbe7fc-125e-4625-ab27-ae68504bcf6c','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-09 07:20:34','00000',237,'de',NULL,2,0,'\0','2026-04-09 07:19:22','2026-04-09 07:20:34',3,NULL,NULL,NULL,NULL,'!bvYlnPGBXTrxkWBSar:91.99.183.160'),
(102397,1,'group-chat-system-1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'00000',237,'de','!opOicPqaXlQFlKjyCT:91.99.183.160',2,1,'\0','2026-04-09 11:23:28','2026-04-09 11:23:28',NULL,NULL,NULL,NULL,NULL,'!opOicPqaXlQFlKjyCT:91.99.183.160'),
(102398,1,'fbcd6f57-ff53-4533-b26e-97a89c380855',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-10 22:26:57','2026-04-10 22:26:58',1,NULL,NULL,NULL,NULL,'!SDfJnCgOKXKtssAdCT:91.99.183.160'),
(102399,21,'c60539c2-ce39-4197-8b18-21dfaaecf157',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-10 22:28:24','2026-04-10 22:28:24',1,NULL,NULL,NULL,NULL,'!SgiJAMrULVERqPPGGo:91.99.183.160'),
(102400,1,'3341641d-365f-4061-9bd1-ac506ec962a2',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-11 07:54:20','2026-04-11 07:54:20',3,NULL,NULL,NULL,NULL,'!XuzyyWYSnKeBJomdhJ:91.99.183.160'),
(102401,1,'17243509-f18b-492e-b87d-ce24055f3d11',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-11 11:56:46','2026-04-11 11:56:47',1,NULL,NULL,NULL,NULL,'!AzxPqrHRDsPCCZStwh:91.99.183.160'),
(102402,1,'6b3d8570-3b9b-49e4-9b2b-2b91e6fccc75',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-11 13:11:34','2026-04-11 13:11:34',3,NULL,NULL,NULL,NULL,'!qEpYAsopydbHNgNYDf:91.99.183.160'),
(102403,1,'ec2142c9-c7f4-4e16-8657-a0030a33aaa1',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-11 13:16:25','2026-04-11 13:16:25',3,NULL,NULL,NULL,NULL,'!YRdBaKwrCbSDSjJzrm:91.99.183.160'),
(102404,1,'3ef41468-5b77-489e-a837-708ac79b7c7d',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-11 13:23:14','2026-04-11 13:23:15',3,NULL,NULL,NULL,NULL,'!InnSyakVyHqAIbjTjP:91.99.183.160'),
(102405,1,'a525c60f-453e-4f5d-a492-fad015582c6b',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-11 20:55:43','2026-04-11 20:55:43',1,NULL,NULL,NULL,NULL,'!OUQnNDGNuXjRokYEYA:91.99.183.160'),
(102406,1,'93be7aef-db00-466d-a1ee-930948adaae9',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-14 06:40:53','2026-04-14 06:40:53',1,NULL,NULL,NULL,NULL,'!ftJbXgUQwkKqMUEkjG:91.99.183.160'),
(102407,22,'25680a88-64c2-4cad-b3df-e2f312fbdd99','482a558e-d07b-4fbc-a9d8-02394ffd729e',1,'REGISTERED',NULL,'2026-04-14 06:56:39','00000',248,'de',NULL,2,0,'\0','2026-04-14 06:54:17','2026-04-14 06:56:39',3,NULL,NULL,NULL,NULL,'!WJumDHRvkMCGNqOYWV:91.99.183.160'),
(102408,22,'52d8b1e0-3241-4d55-a5d6-5012e769872d',NULL,1,'REGISTERED',NULL,NULL,'00000',248,'de',NULL,1,0,'\0','2026-04-14 06:59:33','2026-04-14 06:59:33',3,NULL,NULL,NULL,NULL,'!QvypojLByyLEabpFqZ:91.99.183.160'),
(102409,22,'71f98872-e0d4-4e74-b521-9e618397cc2c','482a558e-d07b-4fbc-a9d8-02394ffd729e',1,'REGISTERED',NULL,'2026-04-14 07:29:04','00000',248,'de',NULL,2,0,'\0','2026-04-14 07:27:48','2026-04-14 07:29:04',3,NULL,NULL,NULL,NULL,'!IoYxorpsTnEhdZVIRJ:91.99.183.160'),
(102410,1,'7598cf93-eaf2-4ad1-bf0e-a124911909c5',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-14 07:46:52','2026-04-14 07:46:52',3,NULL,NULL,NULL,NULL,'!XXVdxPNekRvxAenHbW:91.99.183.160'),
(102411,22,'085b09b2-4dcb-4050-b069-65df80f2d97b',NULL,1,'REGISTERED',NULL,NULL,'00000',248,'de',NULL,1,0,'\0','2026-04-14 09:33:22','2026-04-14 09:33:22',3,NULL,NULL,NULL,NULL,'!hEPZQcsxRiJGbUPMxi:91.99.183.160'),
(102412,1,'3e2fc20d-54d6-48e0-9cad-0aabf29e076a',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-14 12:48:10','2026-04-14 12:48:11',3,NULL,NULL,NULL,NULL,'!AynjipxFPGqeljnKKZ:91.99.183.160'),
(102413,22,'65968bc8-df77-48da-864c-05f6e23575cf',NULL,1,'REGISTERED',NULL,NULL,'00000',248,'de',NULL,1,0,'\0','2026-04-15 19:05:53','2026-04-15 19:05:54',3,NULL,NULL,NULL,NULL,'!QEvdkedPLSBxsqHsam:91.99.183.160'),
(102414,22,'f425c72c-f215-4b74-9343-cc1f91c8c074',NULL,1,'REGISTERED',NULL,NULL,'00000',248,'de',NULL,1,0,'\0','2026-04-17 06:29:26','2026-04-17 06:29:27',3,NULL,NULL,NULL,NULL,'!suXXxceTYcVszQehKm:91.99.183.160'),
(102415,1,'97fe2c40-5ae4-4680-a81d-5a5f9e825d99',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-19 05:26:23','2026-04-19 05:26:24',3,NULL,NULL,NULL,NULL,'!OhvtSaCLXClsxOTKCv:91.99.183.160'),
(102416,1,'dd126e91-306f-4d3a-bf43-252495b2075f','45065014-46dc-45bd-b0a9-4a40a6e483ae',1,'REGISTERED',NULL,'2026-04-23 15:06:20','00000',237,'de',NULL,2,0,'\0','2026-04-19 06:52:18','2026-04-23 15:06:20',3,NULL,NULL,NULL,NULL,'!rdIQptrRnNASaHIBjz:91.99.183.160'),
(102417,1,'f688cc36-dab9-4da1-a354-46914088190f','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 11:30:09','00000',237,'de',NULL,2,0,'\0','2026-04-19 08:09:26','2026-04-20 11:30:09',3,NULL,NULL,NULL,NULL,'!OiAOEsBULzvurJPkjY:91.99.183.160'),
(102418,1,'a8e20c59-a046-43e6-90fe-307e7733499d','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 19:39:11','00000',237,'de',NULL,2,0,'\0','2026-04-19 08:25:22','2026-04-19 19:39:11',3,NULL,NULL,NULL,NULL,'!HmHTbYjIOTeQcXJlkj:91.99.183.160'),
(102419,1,'918252cc-fba9-4d69-99eb-386bd888938d',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-19 08:39:31','2026-04-19 08:39:32',3,NULL,NULL,NULL,NULL,'!otyLLzSMkUUZXVgJYb:91.99.183.160'),
(102420,1,'066bdcca-0d2d-4175-90a7-7a4b40c6b377','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 10:50:05','00000',237,'de',NULL,2,0,'\0','2026-04-19 08:40:48','2026-04-19 10:50:05',3,NULL,NULL,NULL,NULL,'!dppIgDQClVzybwjeGG:91.99.183.160'),
(102421,1,'1a576539-af4b-4894-8404-b678441a6477','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 09:25:31','00000',237,'de',NULL,2,0,'\0','2026-04-19 09:07:31','2026-04-19 09:25:31',3,NULL,NULL,NULL,NULL,'!VDDTSGNcPlBJthEqRi:91.99.183.160'),
(102422,1,'ce501717-d465-4ac4-a2cf-ae1841655c08','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 10:47:54','00000',237,'de',NULL,2,0,'\0','2026-04-19 09:59:32','2026-04-19 10:47:54',3,NULL,NULL,NULL,NULL,'!JkNcMxEYzDhmpRedKp:91.99.183.160'),
(102423,1,'774f8648-f80a-4048-b99a-1841b2272c4c','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-19 19:40:45','00000',237,'de',NULL,2,0,'\0','2026-04-19 19:38:09','2026-04-19 19:40:45',3,NULL,NULL,NULL,NULL,'!CHLKUMBbjXRAhDczFz:91.99.183.160'),
(102424,1,'67b0a687-354c-4d7b-83e1-54c820858b66',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-19 20:17:36','2026-04-19 20:17:37',3,NULL,NULL,NULL,NULL,'!zlDFfozBSROipZvRhj:91.99.183.160'),
(102425,1,'023ee47f-190c-4087-ba36-0b5f89a4c517','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 11:15:47','00000',237,'de',NULL,2,0,'\0','2026-04-20 06:11:29','2026-04-20 11:15:47',3,NULL,NULL,NULL,NULL,'!XGjJgVvqbDSKpSwIDi:91.99.183.160'),
(102426,1,'176c42f5-2262-4baa-8ee3-c11c27461d6a','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 06:19:06','00000',237,'de',NULL,2,0,'\0','2026-04-20 06:16:11','2026-04-20 06:19:06',3,NULL,NULL,NULL,NULL,'!vXgOfVtMeyHOFtZCRi:91.99.183.160'),
(102427,1,'5e8b987d-ac54-42da-a11b-15c84c4e1fee','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 06:48:38','00000',237,'de',NULL,2,0,'\0','2026-04-20 06:45:09','2026-04-20 06:48:38',3,NULL,NULL,NULL,NULL,'!lRqMPRSAfBqVvPPjjP:91.99.183.160'),
(102428,1,'e24bf81a-8f22-40ca-a7d6-1f2852daabb3','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 06:52:07','00000',237,'de',NULL,2,0,'\0','2026-04-20 06:50:42','2026-04-20 06:52:07',3,NULL,NULL,NULL,NULL,'!SLlhnMCLpsKucDiMax:91.99.183.160'),
(102429,1,'aed6626d-4ba1-4b59-99a6-284e59de1664',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-20 06:55:33','2026-04-20 06:55:34',3,NULL,NULL,NULL,NULL,'!weZVMvmgVrDLfUmyYz:91.99.183.160'),
(102430,1,'f13085a2-2d0a-428e-af71-3001ff20b61f','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 06:58:47','00000',237,'de',NULL,2,0,'\0','2026-04-20 06:57:50','2026-04-20 06:58:47',3,NULL,NULL,NULL,NULL,'!KWlQfQQaFNmFEEZGqp:91.99.183.160'),
(102431,21,'88a36613-031b-403d-aba8-2db9a7ba218a',NULL,1,'REGISTERED',NULL,NULL,'00000',246,'de',NULL,1,0,'\0','2026-04-20 10:28:22','2026-04-20 10:28:23',1,NULL,NULL,NULL,NULL,'!hCDdcJWJeTXQXztkhE:91.99.183.160'),
(102432,1,'224bca0a-ff1e-4420-bdd9-b8a4da08775b',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-20 11:10:13','2026-04-20 11:10:14',1,NULL,NULL,NULL,NULL,'!YkrkWzuziHOscNLUUW:91.99.183.160'),
(102433,21,'f8413e81-e6d5-4bbc-b058-59111708b4a5',NULL,1,'REGISTERED',NULL,NULL,'00000',245,'de',NULL,1,0,'\0','2026-04-20 11:27:05','2026-04-20 11:27:06',3,NULL,NULL,NULL,NULL,'!CocszFLEyVfxQYpLGd:91.99.183.160'),
(102434,1,'bbd4ed48-0d74-413a-9748-4b35dea03df8',NULL,1,'REGISTERED',NULL,NULL,'00000',238,'de',NULL,1,0,'\0','2026-04-20 11:33:04','2026-04-20 11:33:05',1,NULL,NULL,NULL,NULL,'!RuSIVNhOLFcbWGnZKt:91.99.183.160'),
(102435,1,'242aff82-4a43-4fdb-89ae-f7271c70b446',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-20 14:40:57','2026-04-20 14:40:57',3,NULL,NULL,NULL,NULL,'!CCoJUtHBhlNmJSblAf:91.99.183.160'),
(102436,21,'314e674c-697e-4ef9-a958-e91fb958d770',NULL,1,'REGISTERED',NULL,NULL,'00000',245,'de',NULL,1,0,'\0','2026-04-20 16:10:43','2026-04-20 16:10:43',3,NULL,NULL,NULL,NULL,'!CfKYZFrpYfdMfFCqXN:91.99.183.160'),
(102437,1,'2b09f883-10c0-4736-8ee2-4740fc02aad1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-20 16:16:18','00000',237,'de',NULL,2,0,'\0','2026-04-20 16:15:39','2026-04-20 16:16:18',3,NULL,NULL,NULL,NULL,'!gehblbffoPDcWPdIrm:91.99.183.160'),
(102438,1,'3f3979d1-12ec-4985-a334-95abb84cdf07',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-20 18:00:25','2026-04-20 18:00:25',3,NULL,NULL,NULL,NULL,'!hdmLMKCVdyepdQQsOe:91.99.183.160'),
(102439,1,'32cb2a64-2bff-420d-aba9-63a10d9abb66',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-21 05:46:26','2026-04-21 05:46:26',3,NULL,NULL,NULL,NULL,'!FJsgqFXzGLbJIWeAqm:91.99.183.160'),
(102440,1,'f1306bed-6325-4bdd-bcda-fa53df72ef33','45065014-46dc-45bd-b0a9-4a40a6e483ae',1,'REGISTERED',NULL,'2026-04-22 04:41:31','00000',237,'de',NULL,2,0,'\0','2026-04-21 07:29:27','2026-04-22 04:41:31',3,NULL,NULL,NULL,NULL,'!mNZrDoFZKJPyCcDIxk:91.99.183.160'),
(102441,1,'group-chat-system-1','45065014-46dc-45bd-b0a9-4a40a6e483ae',1,'REGISTERED',NULL,NULL,'00000',237,'de','!uhFlPcMrDBXudeMlwj:91.99.183.160',2,1,'\0','2026-04-22 04:38:51','2026-04-22 04:38:51',NULL,NULL,NULL,NULL,NULL,'!uhFlPcMrDBXudeMlwj:91.99.183.160'),
(102442,1,'1c11133b-21b1-4ab4-9500-52b89ac01aea','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-22 06:18:14','00000',237,'de',NULL,2,0,'\0','2026-04-22 04:49:04','2026-04-22 06:18:14',NULL,NULL,NULL,NULL,NULL,'!ZxLWnLhXGclKNxtpRv:91.99.183.160'),
(102443,1,'bc2fb63f-0899-49ec-bbda-c1ef46f23c44',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 04:50:06','2026-04-22 04:50:07',NULL,NULL,NULL,NULL,NULL,'!AvyvIdwyyOuOFocTUq:91.99.183.160'),
(102444,1,'539e1b9f-fc7b-429d-8794-d0107fc8e74c',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 04:54:03','2026-04-22 04:54:03',NULL,NULL,NULL,NULL,NULL,'!bizNvyQbLtmkfAwVym:91.99.183.160'),
(102445,1,'21e679e4-8dfd-4a3c-8b0e-b98fb21deec5',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 05:08:38','2026-04-22 05:08:38',NULL,NULL,NULL,NULL,NULL,'!HSPycXfaHCuXlQiGMC:91.99.183.160'),
(102446,1,'1022b3f2-39bf-4fd0-8c3e-9e93f4fc53c7',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 05:08:56','2026-04-22 05:08:56',NULL,NULL,NULL,NULL,NULL,'!ADSChUfYaoDaGAlumm:91.99.183.160'),
(102447,1,'e4e6b006-b1ef-4a74-8bb6-70183cbff31f','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-22 05:14:42','00000',237,'de',NULL,2,0,'\0','2026-04-22 05:13:14','2026-04-22 05:14:42',NULL,NULL,NULL,NULL,NULL,'!jcqNxjZwevoxlyniHn:91.99.183.160'),
(102448,1,'05b93153-7a81-4cff-81cd-b9f5b47a1152',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 05:21:13','2026-04-22 05:21:13',NULL,NULL,NULL,NULL,NULL,'!dfXAeMQbLTvQJGHCqW:91.99.183.160'),
(102449,1,'bda23150-cc97-4271-afd5-4dc5a10b5970','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-22 05:23:42','00000',237,'de',NULL,2,0,'\0','2026-04-22 05:22:25','2026-04-22 05:23:42',NULL,NULL,NULL,NULL,NULL,'!aPudmawkdNnlhzXLRb:91.99.183.160'),
(102450,1,'a4338933-c3ba-4ac6-8382-d15dd6e491fd',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 05:53:31','2026-04-22 05:53:32',NULL,NULL,NULL,NULL,NULL,'!sjdltCNTKpQRVJavXH:91.99.183.160'),
(102451,1,'fd123f8c-df5b-4661-a5bb-be5ba5cd7be5',NULL,1,'REGISTERED',NULL,NULL,'00000',237,'de',NULL,1,0,'\0','2026-04-22 08:22:50','2026-04-22 08:22:51',NULL,NULL,NULL,NULL,NULL,'!EvhvNmpBDdBmOiBvav:91.99.183.160'),
(102452,1,'b20520e6-827c-431f-8dd1-cf94fe576c1b','200897f5-b32e-4e2e-804e-817a27400e60',1,'REGISTERED',NULL,'2026-04-22 12:50:10','00000',237,'de',NULL,2,0,'\0','2026-04-22 08:23:00','2026-04-22 12:50:10',NULL,NULL,NULL,NULL,NULL,'!qurLLUFUsyZvzvyzYp:91.99.183.160'),
(102453,1,'057b64db-a659-4a42-bc31-fcc63dc37737','200897f5-b32e-4e2e-804e-817a27400e60',1,'REGISTERED',NULL,NULL,'10965',237,'de',NULL,1,0,'','2026-04-22 12:24:48','2026-04-22 12:24:48',3,NULL,NULL,NULL,NULL,NULL),
(102454,1,'ff691d60-b1ad-4d29-955d-118455c10ede','200897f5-b32e-4e2e-804e-817a27400e60',1,'REGISTERED',NULL,NULL,'10965',237,'de',NULL,1,0,'','2026-04-22 12:28:37','2026-04-22 12:28:37',3,NULL,NULL,NULL,NULL,NULL),
(102455,1,'f5634c10-409b-42ae-964f-e6fb61ec005c','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,NULL,'12345',237,'de',NULL,1,0,'','2026-04-22 13:29:43','2026-04-22 13:29:43',3,NULL,NULL,NULL,NULL,NULL),
(102456,1,'45c161e8-96e6-4231-b4e6-26c9ada65352','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-22 14:22:13','20095',237,'de',NULL,2,0,'','2026-04-22 14:22:13','2026-04-22 14:22:14',NULL,NULL,NULL,NULL,NULL,'!SzVPvPHJHNFLGyJaZt:91.99.183.160'),
(102457,1,'97b0bea3-55a6-4d90-8664-dd909dd78ae6','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-22 14:28:56','12345',237,'de',NULL,2,0,'','2026-04-22 14:28:56','2026-04-22 14:28:56',3,NULL,NULL,NULL,NULL,'!zFjJEuiiIpahpLUkTt:91.99.183.160'),
(102458,1,'d5f3c9f0-7757-474a-af2f-42797c464ce8',NULL,1,'REGISTERED',NULL,NULL,'20095',237,'de',NULL,1,0,'\0','2026-04-23 09:44:42','2026-04-23 09:44:43',3,NULL,NULL,NULL,NULL,'!ycrBWBpoSkFjKKgOBx:91.99.183.160'),
(102459,1,'1fc79f2a-491a-4543-b5f8-0e4b95e223bf',NULL,1,'REGISTERED',NULL,NULL,'20095',237,'de',NULL,1,0,'\0','2026-04-23 09:45:31','2026-04-23 09:45:32',3,NULL,NULL,NULL,NULL,'!QNcMXdjRAfuhxxAGgX:91.99.183.160'),
(102460,1,'1fc79f2a-491a-4543-b5f8-0e4b95e223bf',NULL,1,'REGISTERED',NULL,NULL,'20095',237,'de',NULL,1,0,'\0','2026-04-23 09:45:33','2026-04-23 09:45:34',3,NULL,NULL,NULL,NULL,'!HWqpwZoDYfEcDqbJKT:91.99.183.160'),
(102462,1,'ee363dea-60c2-4bb6-bd28-a590e146832c',NULL,1,'REGISTERED',NULL,NULL,'20095',237,'de',NULL,1,0,'\0','2026-04-23 09:56:29','2026-04-23 09:56:30',3,NULL,NULL,NULL,NULL,'!NWYOQABrwkuldqvQsj:91.99.183.160'),
(102463,1,'ee363dea-60c2-4bb6-bd28-a590e146832c','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-23 09:56:31','20095',237,'de',NULL,2,0,'\0','2026-04-23 09:56:31','2026-04-23 09:56:32',3,NULL,NULL,NULL,NULL,'!ujtweQBWguJdbDQepn:91.99.183.160'),
(102464,1,'cf00d047-7582-4635-a75b-97a5f30c0ef6',NULL,1,'REGISTERED',NULL,NULL,'20095',237,'de',NULL,1,0,'\0','2026-04-23 10:11:49','2026-04-23 10:11:50',3,NULL,NULL,NULL,NULL,'!pjtqPuOfGygROpRuLt:91.99.183.160'),
(102465,1,'cf00d047-7582-4635-a75b-97a5f30c0ef6',NULL,1,'REGISTERED',NULL,NULL,'20095',237,'de',NULL,1,0,'\0','2026-04-23 10:11:52','2026-04-23 10:11:52',3,NULL,NULL,NULL,NULL,'!aDBxVPljbDuTEYCbuO:91.99.183.160'),
(102466,1,'2e2f6192-8c5f-4fe4-8463-69e585b35e35','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-23 10:12:03','20095',237,'de',NULL,2,0,'','2026-04-23 10:12:03','2026-04-23 10:12:04',3,NULL,NULL,NULL,NULL,'!lzGhpWQOofGoWwileM:91.99.183.160'),
(102467,1,'3ad3bed0-0c07-4862-b158-ebcd031979a1','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b',1,'REGISTERED',NULL,'2026-04-23 10:15:31','12345',237,'de',NULL,2,0,'\0','2026-04-23 10:15:04','2026-04-23 10:15:31',3,NULL,NULL,NULL,NULL,'!RZSiHWtfoKqgGZpEfB:91.99.183.160'),
(102468,1,'3ad3bed0-0c07-4862-b158-ebcd031979a1',NULL,1,'REGISTERED',NULL,NULL,'12345',237,'de',NULL,1,0,'\0','2026-04-23 10:15:58','2026-04-23 10:15:59',3,NULL,NULL,NULL,NULL,'!zLJRiMeCuMNkPzdgzA:91.99.183.160'),
(102469,1,'463f2bbc-ed6d-474d-9e4f-5c723452e01d',NULL,1,'REGISTERED',NULL,NULL,'12345',237,'de',NULL,1,0,'\0','2026-04-23 10:22:09','2026-04-23 10:22:09',3,NULL,NULL,NULL,NULL,'!hovHYfjiGhOxXkImGd:91.99.183.160'),
(102470,1,'3ad3bed0-0c07-4862-b158-ebcd031979a1',NULL,1,'REGISTERED',NULL,NULL,'12329',237,'de',NULL,1,0,'\0','2026-04-23 10:27:03','2026-04-23 10:27:04',3,NULL,NULL,NULL,NULL,'!hWVWznZororvniKzeA:91.99.183.160'),
(102471,21,'50c78e23-393c-47ae-a044-c810a18b3470',NULL,1,'REGISTERED',NULL,NULL,'12345',246,'de',NULL,1,0,'\0','2026-04-23 14:27:26','2026-04-23 14:27:27',1,NULL,NULL,NULL,NULL,'!rkbawUXAeLnycNEDzg:91.99.183.160'),
(102472,21,'50c78e23-393c-47ae-a044-c810a18b3470',NULL,1,'REGISTERED',NULL,NULL,'12345',246,'de',NULL,1,0,'\0','2026-04-23 14:34:23','2026-04-23 14:34:24',1,NULL,NULL,NULL,NULL,'!attqeZkFpOxFPzAAay:91.99.183.160');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`session_update` BEFORE UPDATE ON `userservice`.`session` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
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
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`assign_date_update` BEFORE UPDATE ON `userservice`.`session` FOR EACH ROW BEGIN
    IF OLD.assign_date IS NULL AND OLD.status = 1 AND NEW.status = 2 THEN
        SET NEW.assign_date=utc_timestamp();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `session_data`
--

DROP TABLE IF EXISTS `session_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_data` (
  `id` bigint(21) unsigned NOT NULL,
  `session_id` bigint(21) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL,
  `key_name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_type_key_name` (`session_id`,`type`,`key_name`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `session_data_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_data`
--

LOCK TABLES `session_data` WRITE;
/*!40000 ALTER TABLE `session_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_data` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`session_data_update` BEFORE UPDATE ON `userservice`.`session_data` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `session_supervisor`
--

DROP TABLE IF EXISTS `session_supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_supervisor` (
  `id` bigint(21) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` bigint(21) unsigned NOT NULL,
  `supervisor_consultant_id` varchar(36) NOT NULL,
  `added_by_consultant_id` varchar(36) NOT NULL,
  `added_date` datetime NOT NULL DEFAULT current_timestamp(),
  `removed_date` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `matrix_room_id` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_session_active` (`session_id`,`is_active`),
  KEY `idx_supervisor_active` (`supervisor_consultant_id`,`is_active`),
  KEY `idx_added_by` (`added_by_consultant_id`),
  CONSTRAINT `session_supervisor_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `session_supervisor_ibfk_2` FOREIGN KEY (`supervisor_consultant_id`) REFERENCES `consultant` (`consultant_id`) ON UPDATE CASCADE,
  CONSTRAINT `session_supervisor_ibfk_3` FOREIGN KEY (`added_by_consultant_id`) REFERENCES `consultant` (`consultant_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_supervisor`
--

LOCK TABLES `session_supervisor` WRITE;
/*!40000 ALTER TABLE `session_supervisor` DISABLE KEYS */;
INSERT INTO `session_supervisor` VALUES
(29,102318,'200897f5-b32e-4e2e-804e-817a27400e60','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-03-17 13:08:28','2026-04-04 20:13:30',0,'!EayEdVfEprTxtpHaYN:91.99.183.160','Supervise the chat.'),
(30,102328,'200897f5-b32e-4e2e-804e-817a27400e60','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-02 20:53:06',NULL,1,'!mGxGwJngSHbRBMogAc:91.99.183.160','xyz'),
(31,102360,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','200897f5-b32e-4e2e-804e-817a27400e60','2026-04-02 22:32:48',NULL,1,'!EsIbckrKAcQhSwTzDM:91.99.183.160','Supervise this user.'),
(32,102382,'200897f5-b32e-4e2e-804e-817a27400e60','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-03 21:15:31',NULL,1,'!lyzADHTpHrlpOJjTYN:91.99.183.160','hello'),
(33,102316,'200897f5-b32e-4e2e-804e-817a27400e60','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-05 12:20:23','2026-04-10 22:15:23',0,'!pbZoWgAXTTZjxASxuy:91.99.183.160','kjnkj'),
(34,102316,'b82e4417-a6c3-466e-ac71-355f8d26c4b2','bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','2026-04-09 11:22:18','2026-04-10 22:15:32',0,'!pbZoWgAXTTZjxASxuy:91.99.183.160','Supervise please.'),
(35,102440,'bbbbcfb6-58ea-40a7-a5ab-9d9e88e9673b','45065014-46dc-45bd-b0a9-4a40a6e483ae','2026-04-23 14:37:51',NULL,1,'!mNZrDoFZKJPyCcDIxk:91.99.183.160','hi');
/*!40000 ALTER TABLE `session_supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_topic`
--

DROP TABLE IF EXISTS `session_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_topic` (
  `id` bigint(21) NOT NULL,
  `session_id` bigint(21) unsigned NOT NULL,
  `topic_id` bigint(21) unsigned NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `session_topic_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_topic`
--

LOCK TABLES `session_topic` WRITE;
/*!40000 ALTER TABLE `session_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(36) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `id_old` bigint(21) unsigned DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rc_user_id` varchar(255) DEFAULT NULL,
  `matrix_user_id` varchar(255) DEFAULT NULL,
  `language_formal` tinyint(4) NOT NULL DEFAULT 0,
  `data_privacy_confirmation` datetime DEFAULT NULL,
  `terms_and_conditions_confirmation` datetime DEFAULT NULL,
  `language_code` varchar(2) NOT NULL DEFAULT 'de',
  `encourage_2fa` bit(1) NOT NULL DEFAULT b'1',
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `mobile_token` longtext DEFAULT NULL,
  `notifications_enabled` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `notifications_settings` varchar(4000) DEFAULT '',
  `matrix_password` varchar(255) DEFAULT NULL,
  `magic_link_login_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `deletion_lifecycle_state` varchar(32) DEFAULT NULL,
  `deletion_read_only_until` datetime DEFAULT NULL,
  `deletion_paused_until` datetime DEFAULT NULL,
  `deletion_pause_reason` varchar(512) DEFAULT NULL,
  `deletion_paused_by` varchar(64) DEFAULT NULL,
  `deletion_pause_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('00534109-35aa-43f9-a225-d9c605fe5153',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBVGUYTKOJVG43DM...','00534109-35aa-43f9-a225-d9c605fe5153@beratungcaritas.de',NULL,'@anonymous-1774551595766:91.99.183.160',1,'2026-03-26 19:00:00','2026-03-26 19:00:00','de','','2026-03-26 19:00:01','2026-03-26 19:35:59',NULL,0,NULL,'H9H1fl86',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('00ccec31-fca9-4b4e-b7ed-55c56b60280c',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZYHAYDKMJWGA2DG...','00ccec31-fca9-4b4e-b7ed-55c56b60280c@beratungcaritas.de',NULL,'@anonymous-1773880516043:91.99.183.160',1,'2026-03-19 00:35:20','2026-03-19 00:35:20','de','','2026-03-19 00:35:20','2026-03-26 19:35:59',NULL,0,NULL,'UwtTfJSi',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('0218eb0d-42b5-4451-b60b-ba4dbaf3c1da',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJUG42DIMJSHA3TC...','0218eb0d-42b5-4451-b60b-ba4dbaf3c1da@beratungcaritas.de',NULL,'@anonymous-1775474412871:91.99.183.160',1,'2026-04-06 11:20:25','2026-04-06 11:20:25','de','','2026-04-06 11:20:19','2026-04-06 11:20:25',NULL,0,NULL,'AWYWsTA3',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('023ee47f-190c-4087-ba36-0b5f89a4c517',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGY2TINZUHE2TE...','023ee47f-190c-4087-ba36-0b5f89a4c517@beratungcaritas.de',NULL,'@anonymous-1776665474952:91.99.183.160',1,'2026-04-20 06:12:18','2026-04-20 06:12:18','de','','2026-04-20 06:11:29','2026-04-20 06:12:18',NULL,0,NULL,'xo1Bvv42',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('02cd9a22-11e5-4e5f-9d99-381f3ec809c9',1,NULL,'2026-03-26 20:38:39','enc.ONSWGMBVMFZWWZLSMMZTMMRZHAZTA...','sec05askerc3629830@example.com',NULL,'@sec05askerc3629830:91.99.183.160',1,'2026-03-26 20:35:55','2026-03-26 20:35:55','de','','2026-03-26 20:35:55','2026-03-26 20:38:56',NULL,0,NULL,'Sec05!9bdf48beA1',0,'READ_ONLY_SAFEGUARD','2026-03-28 20:38:39','2026-05-26 20:38:56','legal hold test','b0ee2630-6b0a-4ebb-ac8d-e716741a6c0f','2026-03-26 20:38:56'),
('04d6f440-7f1f-41a2-b7d5-b37ac3282a5e',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZYGMYDOMBVGIZTI...','04d6f440-7f1f-41a2-b7d5-b37ac3282a5e@beratungcaritas.de',NULL,'@anonymous-1773830705234:91.99.183.160',1,'2026-03-18 10:45:09','2026-03-18 10:45:09','en','','2026-03-18 10:45:09','2026-03-26 19:35:59',NULL,0,NULL,'BsdSqF56',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('057b64db-a659-4a42-bc31-fcc63dc37737',1,NULL,NULL,'enc.OFZGG33EMUYQ....','057b64db-a659-4a42-bc31-fcc63dc37737@beratungcaritas.de',NULL,'@qrcode1:91.99.183.160',1,'2026-04-22 12:24:48','2026-04-22 12:24:48','en','','2026-04-22 12:24:48','2026-04-22 12:24:48',NULL,0,NULL,'@Consultant12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('05b93153-7a81-4cff-81cd-b9f5b47a1152',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRYGM2TENZSHE4DE...','05b93153-7a81-4cff-81cd-b9f5b47a1152@beratungcaritas.de',NULL,'@anonymous-1776835272982:91.99.183.160',1,NULL,NULL,'de','','2026-04-22 05:21:13','2026-04-22 05:21:13',NULL,0,NULL,'Er9Lfbos',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('066bdcca-0d2d-4175-90a7-7a4b40c6b377',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHA4DANBSHA4TS...','066bdcca-0d2d-4175-90a7-7a4b40c6b377@beratungcaritas.de',NULL,'@anonymous-1776588042899:91.99.183.160',1,'2026-04-19 08:40:57','2026-04-19 08:40:57','de','','2026-04-19 08:40:48','2026-04-19 08:40:57',NULL,0,NULL,'WhkPTeBs',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('085b09b2-4dcb-4050-b069-65df80f2d97b',22,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRGU2TCNRQHAYTQ...','085b09b2-4dcb-4050-b069-65df80f2d97b@beratungcaritas.de',NULL,'@anonymous-1776155160818:91.99.183.160',1,'2026-04-14 09:33:26','2026-04-14 09:33:26','de','','2026-04-14 09:33:21','2026-04-14 09:33:26',NULL,0,NULL,'2IdmbIws',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('088cf79e-98d8-47c7-951c-c173b18e3623',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJUG42TSNRVHA4TC...','088cf79e-98d8-47c7-951c-c173b18e3623@beratungcaritas.de',NULL,'@anonymous-1775475965891:91.99.183.160',1,'2026-04-06 11:47:45','2026-04-06 11:47:45','en','','2026-04-06 11:47:38','2026-04-06 11:47:45',NULL,0,NULL,'hc3Gz74Y',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('0a77071e-d56d-475c-b5bb-23274cc2656d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBSGA3DMNBUGY3DK...','0a77071e-d56d-475c-b5bb-23274cc2656d@beratungcaritas.de',NULL,'@anonymous-1774206644665:91.99.183.160',1,'2026-03-22 19:10:50','2026-03-22 19:10:50','en','','2026-03-22 19:10:50','2026-03-26 19:35:59',NULL,0,NULL,'slpnIN1k',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('0ac1417a-0f1b-4845-b903-e06f40e0dad7',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQGI2TQOJRGIZDS...','0ac1417a-0f1b-4845-b903-e06f40e0dad7@beratungcaritas.de',NULL,'@anonymous-1774025891229:91.99.183.160',1,'2026-03-20 16:58:16','2026-03-20 16:58:16','ru','','2026-03-20 16:58:16','2026-03-26 19:35:59',NULL,0,NULL,'nRIA5kH5',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('0ad2a120-e6f4-4d72-a0b8-7e9a1dc10ad1',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBSHAZDQNJWGA3TS...','0ad2a120-e6f4-4d72-a0b8-7e9a1dc10ad1@beratungcaritas.de',NULL,'@anonymous-1774282856079:91.99.183.160',1,'2026-03-23 16:21:02','2026-03-23 16:21:02','en','','2026-03-23 16:21:02','2026-03-26 19:35:59',NULL,0,NULL,'OaxbCRhb',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('0c62b6d8-5cae-47e7-912c-b334d52fcf06',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQGQ2DSMRRGYZDQ...','0c62b6d8-5cae-47e7-912c-b334d52fcf06@beratungcaritas.de',NULL,'@anonymous-1774044921628:91.99.183.160',1,'2026-03-20 22:15:26','2026-03-20 22:15:26','en','','2026-03-20 22:15:26','2026-03-26 19:35:59',NULL,0,NULL,'iPFiktbg',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1022b3f2-39bf-4fd0-8c3e-9e93f4fc53c7',1,NULL,NULL,'enc.M52WK43UL4YTONZWHAZTIOBQGA......','1022b3f2-39bf-4fd0-8c3e-9e93f4fc53c7@beratungcaritas.de',NULL,'@guest_1776834800:91.99.183.160',1,NULL,NULL,'de','','2026-04-22 05:08:56','2026-04-22 05:08:56',NULL,0,NULL,'TestA1!qwerty77',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1027e24a-ffd7-4d67-8372-c6da26fba9c6',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZUGMYTQMRUG4YDS...','1027e24a-ffd7-4d67-8372-c6da26fba9c6@beratungcaritas.de',NULL,'@anonymous-1773431824709:91.99.183.160',1,'2026-03-13 19:57:09','2026-03-13 19:57:09','de','','2026-03-13 19:57:09','2026-03-26 19:35:59',NULL,0,NULL,'rXeP2RdJ',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('17243509-f18b-492e-b87d-ce24055f3d11',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJZGA4DKMBQGY3TK...','17243509-f18b-492e-b87d-ce24055f3d11@beratungcaritas.de',NULL,'@anonymous-1775908500675:91.99.183.160',1,'2026-04-11 11:56:52','2026-04-11 11:56:52','en','','2026-04-11 11:56:46','2026-04-11 11:56:52',NULL,0,NULL,'Eoa4kkap',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('176c42f5-2262-4baa-8ee3-c11c27461d6a',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGY2TONRUGI2TS...','176c42f5-2262-4baa-8ee3-c11c27461d6a@beratungcaritas.de',NULL,'@anonymous-1776665764259:91.99.183.160',1,'2026-04-20 06:16:41','2026-04-20 06:16:41','de','','2026-04-20 06:16:10','2026-04-20 06:16:41',NULL,0,NULL,'AgBzAo4j',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1a576539-af4b-4894-8404-b678441a6477',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHA4TMNBSHE2TK...','1a576539-af4b-4894-8404-b678441a6477@beratungcaritas.de',NULL,'@anonymous-1776589642955:91.99.183.160',1,'2026-04-19 09:07:41','2026-04-19 09:07:41','de','','2026-04-19 09:07:30','2026-04-19 09:07:41',NULL,0,NULL,'n1RMLOID',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1c11133b-21b1-4ab4-9500-52b89ac01aea',1,NULL,NULL,'enc.M52WK43UL5YHA5BZOZVGC53QGIYWQ...','1c11133b-21b1-4ab4-9500-52b89ac01aea@beratungcaritas.de',NULL,'@guest_ppt9vjawp21h:91.99.183.160',1,'2026-04-22 04:49:14','2026-04-22 04:49:14','de','','2026-04-22 04:49:04','2026-04-22 04:49:14',NULL,0,NULL,'n23L9APKBFG9Aa1!',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1c62e730-52df-4782-8548-4bb96a5b5bcb',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBSGA2DCOBXHE2TI...','1c62e730-52df-4782-8548-4bb96a5b5bcb@beratungcaritas.de',NULL,'@anonymous-1774204187954:91.99.183.160',1,'2026-03-22 18:29:53','2026-03-22 18:29:53','en','','2026-03-22 18:29:53','2026-03-26 19:35:59',NULL,0,NULL,'YOlUbVG3',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1ee2a6ec-f914-4246-bc0c-80e5ad27d7bd',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGAYDEMZXGM2TE...','1ee2a6ec-f914-4246-bc0c-80e5ad27d7bd@beratungcaritas.de',NULL,'@anonymous-1775200237352:91.99.183.160',1,'2026-04-03 07:10:44','2026-04-03 07:10:44','de','','2026-04-03 07:10:44','2026-04-03 07:10:44',NULL,0,NULL,'n50qbXpY',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('1fc79f2a-491a-4543-b5f8-0e4b95e223bf',1,NULL,NULL,'enc.MFSGI5DFON2DCNZXGY4TGNZVGMYQ....','1fc79f2a-491a-4543-b5f8-0e4b95e223bf@beratungcaritas.de',NULL,'@addtest1776937531:91.99.183.160',1,'2026-04-23 09:45:31','2026-04-23 09:45:31','de','','2026-04-23 09:45:31','2026-04-23 09:45:31',NULL,0,NULL,'Passw0rd!1776937531',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('20155ac6-0d87-438b-9f03-1c8661a89d51',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGA4DMMRYGA4DI...','20155ac6-0d87-438b-9f03-1c8661a89d51@beratungcaritas.de',NULL,'@anonymous-1775208628084:91.99.183.160',1,'2026-04-03 09:30:35','2026-04-03 09:30:35','de','','2026-04-03 09:30:35','2026-04-03 09:30:35',NULL,0,NULL,'oFk2BEb5',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('21e679e4-8dfd-4a3c-8b0e-b98fb21deec5',1,NULL,NULL,'enc.M52WK43UL4YTONZWHAZTINJRG4......','21e679e4-8dfd-4a3c-8b0e-b98fb21deec5@beratungcaritas.de',NULL,'@guest_1776834517:91.99.183.160',1,NULL,NULL,'de','','2026-04-22 05:08:37','2026-04-22 05:08:38',NULL,0,NULL,'TestA1!qwerty99',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('224bca0a-ff1e-4420-bdd9-b8a4da08775b',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWHAZTIMBSGE2DE...','224bca0a-ff1e-4420-bdd9-b8a4da08775b@beratungcaritas.de',NULL,'@anonymous-1776683402142:91.99.183.160',1,'2026-04-20 11:10:58','2026-04-20 11:10:58','en','','2026-04-20 11:10:13','2026-04-20 11:10:58',NULL,0,NULL,'xZFAjcF2',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('242aff82-4a43-4fdb-89ae-f7271c70b446',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWHE3DANBQGE4TG...','242aff82-4a43-4fdb-89ae-f7271c70b446@beratungcaritas.de',NULL,'@anonymous-1776696040193:91.99.183.160',1,NULL,NULL,'de','','2026-04-20 14:40:56','2026-04-20 14:40:57',NULL,0,NULL,'34Xd53Hx',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('25680a88-64c2-4cad-b3df-e2f312fbdd99',22,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRGQ4TMNJRG44TS...','25680a88-64c2-4cad-b3df-e2f312fbdd99@beratungcaritas.de',NULL,'@anonymous-1776149651799:91.99.183.160',1,'2026-04-14 06:54:22','2026-04-14 06:54:22','de','','2026-04-14 06:54:17','2026-04-14 06:54:22',NULL,0,NULL,'kKNNTPiO',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('26dc580b-0230-4a4b-b98f-1f23e0d6b06a',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBSGE4TCMZRGQ2TG...','26dc580b-0230-4a4b-b98f-1f23e0d6b06a@beratungcaritas.de',NULL,'@anonymous-1774219131453:91.99.183.160',1,'2026-03-22 22:38:57','2026-03-22 22:38:57','en','','2026-03-22 22:38:57','2026-03-26 19:35:59',NULL,0,NULL,'BS4kCt0r',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('2916c0c4-d07e-43d9-afd7-42f10c2df528',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJRHE4DIOBXGMZDI...','2916c0c4-d07e-43d9-afd7-42f10c2df528@beratungcaritas.de',NULL,'@anonymous-1775198487324:91.99.183.160',1,'2026-04-03 06:41:33','2026-04-03 06:41:33','de','','2026-04-03 06:41:33','2026-04-03 06:41:34',NULL,0,NULL,'nsBZzvUW',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('2b09f883-10c0-4736-8ee2-4740fc02aad1',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRXGAYTOMBXG42DC...','2b09f883-10c0-4736-8ee2-4740fc02aad1@beratungcaritas.de',NULL,'@anonymous-1776701707741:91.99.183.160',1,'2026-04-20 16:15:42','2026-04-20 16:15:42','en','','2026-04-20 16:15:38','2026-04-20 16:15:42',NULL,0,NULL,'ZLsiATqZ',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('2b134e9f-8397-4910-be3d-91e727d4972d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZZGU2TSMJWHA3TC...','2b134e9f-8397-4910-be3d-91e727d4972d@beratungcaritas.de',NULL,'@anonymous-1773955916871:91.99.183.160',1,'2026-03-19 21:32:21','2026-03-19 21:32:21','ru','','2026-03-19 21:32:21','2026-03-26 19:35:59',NULL,0,NULL,'iK5UAJPv',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('2e2f6192-8c5f-4fe4-8463-69e585b35e35',1,NULL,NULL,'enc.MNUWI5DFON2DCNZXGY4TGOJRGIZA....','2e2f6192-8c5f-4fe4-8463-69e585b35e35@beratungcaritas.de',NULL,'@cidtest1776939122:91.99.183.160',1,'2026-04-23 10:12:03','2026-04-23 10:12:03','de','','2026-04-23 10:12:03','2026-04-23 10:12:03',NULL,0,NULL,'Passw0rd!1776939122',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('30b6e1e6-6b8a-4142-9db4-1cab4cef43e9',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJUG43DGMRVHA3DE...','30b6e1e6-6b8a-4142-9db4-1cab4cef43e9@beratungcaritas.de',NULL,'@anonymous-1775476325862:91.99.183.160',1,'2026-04-06 11:52:14','2026-04-06 11:52:14','en','','2026-04-06 11:52:09','2026-04-06 11:52:14',NULL,0,NULL,'ybaXlfb5',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('314e674c-697e-4ef9-a958-e91fb958d770',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRXGAYTIMRXGA4DS...','314e674c-697e-4ef9-a958-e91fb958d770@beratungcaritas.de',NULL,'@anonymous-1776701427089:91.99.183.160',1,'2026-04-20 16:10:47','2026-04-20 16:10:47','en','','2026-04-20 16:10:42','2026-04-20 16:10:47',NULL,0,NULL,'6wAS37zI',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('32cb2a64-2bff-420d-aba9-63a10d9abb66',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRXGUYDGNRSGE4TS...','32cb2a64-2bff-420d-aba9-63a10d9abb66@beratungcaritas.de',NULL,'@anonymous-1776750362199:91.99.183.160',1,'2026-04-21 05:47:24','2026-04-21 05:47:24','en','','2026-04-21 05:46:25','2026-04-21 05:47:24',NULL,0,NULL,'ogefBYFL',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3341641d-365f-4061-9bd1-ac506ec962a2',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJYHE2DANJRG4YDC...','3341641d-365f-4061-9bd1-ac506ec962a2@beratungcaritas.de',NULL,'@anonymous-1775894051701:91.99.183.160',1,NULL,NULL,'en','','2026-04-11 07:54:19','2026-04-11 07:54:20',NULL,0,NULL,'TwNXOxsz',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3ad3bed0-0c07-4862-b158-ebcd031979a1',1,NULL,NULL,'enc.MZ2W4Y3UNFXW4YLMORSXG5DJNZTTC...','3ad3bed0-0c07-4862-b158-ebcd031979a1@beratungcaritas.de',NULL,'@functionaltesting1:91.99.183.160',1,'2026-04-23 10:15:04','2026-04-23 10:15:04','en','','2026-04-23 10:15:04','2026-04-23 10:15:04',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3bddde71-985d-4264-94d8-074290571b66',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZZGAZDMMRQGMYDE...','3bddde71-985d-4264-94d8-074290571b66@beratungcaritas.de',NULL,'@anonymous-1773902620302:91.99.183.160',1,'2026-03-19 06:43:45','2026-03-19 06:43:45','de','','2026-03-19 06:43:45','2026-03-26 19:35:59',NULL,0,NULL,'CoMvWBQN',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3c170abd-e072-4e87-91f3-99935c2c0da5',NULL,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZUGIYTINBWGA3TK...','3c170abd-e072-4e87-91f3-99935c2c0da5@beratungcaritas.de',NULL,'@anonymous-1773421446075:91.99.183.160',1,'2026-03-13 17:04:11','2026-03-13 17:04:11','de','','2026-03-13 17:04:11','2026-03-26 19:35:59',NULL,0,NULL,'z9OpwXsc',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3ccc6990-792e-479c-93b0-ea344785c8b5',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJRHE4TKMRRGQ3DG...','3ccc6990-792e-479c-93b0-ea344785c8b5@beratungcaritas.de',NULL,'@anonymous-1775199521463:91.99.183.160',1,'2026-04-03 06:58:48','2026-04-03 06:58:48','de','','2026-04-03 06:58:48','2026-04-03 06:58:48',NULL,0,NULL,'k1diHV04',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3d8b5ea3-5efc-4511-b4f9-eddd7f688f3b',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGA3TMNBXGQZDA...','3d8b5ea3-5efc-4511-b4f9-eddd7f688f3b@beratungcaritas.de',NULL,'@anonymous-1775207647420:91.99.183.160',1,'2026-04-03 09:14:13','2026-04-03 09:14:13','de','','2026-04-03 09:14:13','2026-04-03 09:14:14',NULL,0,NULL,'sdpfkKQ4',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3e2fc20d-54d6-48e0-9cad-0aabf29e076a',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRG4YDQOBSGQ3TK...','3e2fc20d-54d6-48e0-9cad-0aabf29e076a@beratungcaritas.de',NULL,'@anonymous-1776170882475:91.99.183.160',1,NULL,NULL,'de','','2026-04-14 12:48:10','2026-04-14 12:48:10',NULL,0,NULL,'0FhWmynt',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3ef41468-5b77-489e-a837-708ac79b7c7d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJZGEZTOOBZG4ZTC...','3ef41468-5b77-489e-a837-708ac79b7c7d@beratungcaritas.de',NULL,'@anonymous-1775913789731:91.99.183.160',1,'2026-04-11 13:23:22','2026-04-11 13:23:22','de','','2026-04-11 13:23:14','2026-04-11 13:23:22',NULL,0,NULL,'SDCIU20O',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('3f3979d1-12ec-4985-a334-95abb84cdf07',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRXGA3TSOJXGQ4DA...','3f3979d1-12ec-4985-a334-95abb84cdf07@beratungcaritas.de',NULL,'@anonymous-1776707997480:91.99.183.160',1,'2026-04-20 18:14:39','2026-04-20 18:14:39','en','','2026-04-20 18:00:24','2026-04-20 18:14:39',NULL,0,NULL,'oJRXHJ8T',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('4449fb58-fa84-4c9a-8da5-814e24c5505e',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZZGE4TOMRWGM4DC...','4449fb58-fa84-4c9a-8da5-814e24c5505e@beratungcaritas.de',NULL,'@anonymous-1773919726381:91.99.183.160',1,'2026-03-19 11:29:38','2026-03-19 11:29:38','de','','2026-03-19 11:29:38','2026-04-13 09:14:56',NULL,0,NULL,'s7rvroyU',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('45c161e8-96e6-4231-b4e6-26c9ada65352',1,NULL,NULL,'enc.ORSXG5DENFZGKY3UGE3TONRYGY3TOMZS','45c161e8-96e6-4231-b4e6-26c9ada65352@beratungcaritas.de',NULL,'@testdirect1776867732:91.99.183.160',1,'2026-04-22 14:22:13','2026-04-22 14:22:13','de','','2026-04-22 14:22:13','2026-04-22 14:22:13',NULL,0,NULL,'Passw0rd!1776867732',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('463f2bbc-ed6d-474d-9e4f-5c723452e01d',1,NULL,NULL,'enc.MZ2W4Y3UNFXW4YLMORSXG5DJNZTTE...','463f2bbc-ed6d-474d-9e4f-5c723452e01d@beratungcaritas.de',NULL,'@functionaltesting2:91.99.183.160',1,'2026-04-23 10:22:09','2026-04-23 10:22:09','en','','2026-04-23 10:22:09','2026-04-23 10:22:09',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('500d9ef2-1d5e-4334-966d-0e083c13c339',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJVGY3DSMRWGQ3DC...','500d9ef2-1d5e-4334-966d-0e083c13c339@beratungcaritas.de',NULL,'@anonymous-1775566926461:91.99.183.160',1,'2026-04-07 13:02:34','2026-04-07 13:02:34','en','','2026-04-07 13:02:16','2026-04-07 13:02:34',NULL,0,NULL,'tkZtOte6',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('503bf91b-96a1-4ae5-821c-fb32d67b682a',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYDKNZVGI3TI...','503bf91b-96a1-4ae5-821c-fb32d67b682a@beratungcaritas.de',NULL,'@anonymous-1775210575274:91.99.183.160',1,'2026-04-03 10:04:32','2026-04-03 10:04:32','de','','2026-04-03 10:03:36','2026-04-03 10:04:32',NULL,0,NULL,'q0mSTE7F',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('50c78e23-393c-47ae-a044-c810a18b3470',21,NULL,NULL,'enc.NZUWW5LONJ2XGZLSGE......','50c78e23-393c-47ae-a044-c810a18b3470@beratungcaritas.de',NULL,'@nikunjuser1:91.99.183.160',1,'2026-04-23 14:27:26','2026-04-23 14:27:26','en','','2026-04-23 14:27:26','2026-04-23 14:27:26',NULL,0,NULL,'@Nikunjuser1',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('529cd8c3-4049-47b3-b112-f9a356055786',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZZG43DCOBSG4YDE...','529cd8c3-4049-47b3-b112-f9a356055786@beratungcaritas.de',NULL,'@anonymous-1773976182702:91.99.183.160',1,'2026-03-20 03:09:50','2026-03-20 03:09:50','en','','2026-03-20 03:09:50','2026-03-26 19:35:59',NULL,0,NULL,'JDxWsaKT',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('52d8b1e0-3241-4d55-a5d6-5012e769872d',22,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRGQ4TSNRUHA3DE...','52d8b1e0-3241-4d55-a5d6-5012e769872d@beratungcaritas.de',NULL,'@anonymous-1776149964862:91.99.183.160',1,'2026-04-14 06:59:44','2026-04-14 06:59:44','de','','2026-04-14 06:59:32','2026-04-14 06:59:44',NULL,0,NULL,'LAKr7kr4',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('539e1b9f-fc7b-429d-8794-d0107fc8e74c',1,NULL,NULL,'enc.M52WK43UL5WTKZ3FOJQXI6LWM5UTO...','539e1b9f-fc7b-429d-8794-d0107fc8e74c@beratungcaritas.de',NULL,'@guest_m5geratyvgi7:91.99.183.160',1,NULL,NULL,'de','','2026-04-22 04:54:02','2026-04-22 04:54:03',NULL,0,NULL,'oPepVDr1kGaQAa1!',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('5e3f7380-afd5-40c0-ac33-1624fb1bad12',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJRHE3TINJQG44TC...','5e3f7380-afd5-40c0-ac33-1624fb1bad12@beratungcaritas.de',NULL,'@anonymous-1775197450791:91.99.183.160',1,'2026-04-03 06:24:18','2026-04-03 06:24:18','de','','2026-04-03 06:24:18','2026-04-03 06:24:19',NULL,0,NULL,'1zTqlvff',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('5e8b987d-ac54-42da-a11b-15c84c4e1fee',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGY3TIOJXGE4TE...','5e8b987d-ac54-42da-a11b-15c84c4e1fee@beratungcaritas.de',NULL,'@anonymous-1776667497192:91.99.183.160',1,'2026-04-20 06:45:28','2026-04-20 06:45:28','de','','2026-04-20 06:45:09','2026-04-20 06:45:28',NULL,0,NULL,'gzNiQZwt',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('65968bc8-df77-48da-864c-05f6e23575cf',22,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRSG44TSMZYGQZTC...','65968bc8-df77-48da-864c-05f6e23575cf@beratungcaritas.de',NULL,'@anonymous-1776279938431:91.99.183.160',1,'2026-04-15 19:06:02','2026-04-15 19:06:02','en','','2026-04-15 19:05:53','2026-04-15 19:06:02',NULL,0,NULL,'Ne123T9G',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('67b0a687-354c-4d7b-83e1-54c820858b66',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGI4TQNBVHAZDQ...','67b0a687-354c-4d7b-83e1-54c820858b66@beratungcaritas.de',NULL,'@anonymous-1776629845828:91.99.183.160',1,NULL,NULL,'de','','2026-04-19 20:17:36','2026-04-19 20:17:36',NULL,0,NULL,'ExYRFN8A',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('68768641-5fb4-43ef-afe0-50a4afbe44ef',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGA4TAMRYGYYDK...','68768641-5fb4-43ef-afe0-50a4afbe44ef@beratungcaritas.de',NULL,'@anonymous-1775209028605:91.99.183.160',1,'2026-04-03 09:37:15','2026-04-03 09:37:15','de','','2026-04-03 09:37:15','2026-04-03 09:37:15',NULL,0,NULL,'hDxsikVI',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('6b3d8570-3b9b-49e4-9b2b-2b91e6fccc75',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJZGEZTAOBQGY2DC...','6b3d8570-3b9b-49e4-9b2b-2b91e6fccc75@beratungcaritas.de',NULL,'@anonymous-1775913080641:91.99.183.160',1,'2026-04-11 13:13:07','2026-04-11 13:13:07','de','','2026-04-11 13:11:33','2026-04-11 13:13:07',NULL,0,NULL,'5D7h7Za7',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('6edba0bf-f126-49d8-b00e-ca36a9d4dac0',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYTCNBYGU3TI...','6edba0bf-f126-49d8-b00e-ca36a9d4dac0@beratungcaritas.de',NULL,'@anonymous-1775211148574:91.99.183.160',1,NULL,NULL,'de','','2026-04-03 10:12:46','2026-04-03 10:12:46',NULL,0,NULL,'7c6MAcYi',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('6f9b85b7-796b-488f-b1ab-d121b8db9201',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJRHE2DONZQGIZDM...','6f9b85b7-796b-488f-b1ab-d121b8db9201@beratungcaritas.de',NULL,'@anonymous-1775194770226:91.99.183.160',1,'2026-04-03 05:39:42','2026-04-03 05:39:42','de','','2026-04-03 05:39:42','2026-04-03 05:39:42',NULL,0,NULL,'YLpQyALG',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('71f98872-e0d4-4e74-b521-9e618397cc2c',22,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRGUYTMMZVGE2TQ...','71f98872-e0d4-4e74-b521-9e618397cc2c@beratungcaritas.de',NULL,'@anonymous-1776151635158:91.99.183.160',1,'2026-04-14 07:28:23','2026-04-14 07:28:23','de','','2026-04-14 07:27:48','2026-04-14 07:28:23',NULL,0,NULL,'Z4x2fXym',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('72a86228-36e2-4c9d-9067-091672e9b058',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBUGQ3TOOBQG44TE...','72a86228-36e2-4c9d-9067-091672e9b058@beratungcaritas.de',NULL,'@anonymous-1774447780792:91.99.183.160',1,'2026-03-25 14:09:48','2026-03-25 14:09:48','en','','2026-03-25 14:09:49','2026-03-26 19:35:59',NULL,0,NULL,'pWB2wSEr',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('738c5428-afe5-458e-a0c8-92e960f677a6',NULL,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZUGI2DIMBQHE3TK...','738c5428-afe5-458e-a0c8-92e960f677a6@beratungcaritas.de',NULL,'@anonymous-1773424400975:91.99.183.160',1,'2026-03-13 17:53:35','2026-03-13 17:53:35','de','','2026-03-13 17:53:35','2026-03-26 19:35:59',NULL,0,NULL,'YCtWRqak',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('7598cf93-eaf2-4ad1-bf0e-a124911909c5',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRGUZDQMBUGQYTM...','7598cf93-eaf2-4ad1-bf0e-a124911909c5@beratungcaritas.de',NULL,'@anonymous-1776152804416:91.99.183.160',1,'2026-04-14 07:47:02','2026-04-14 07:47:02','de','','2026-04-14 07:46:52','2026-04-14 07:47:02',NULL,0,NULL,'IRImwAJj',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('774f8648-f80a-4048-b99a-1841b2272c4c',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGI3TIOBRHE4TM...','774f8648-f80a-4048-b99a-1841b2272c4c@beratungcaritas.de',NULL,'@anonymous-1776627481996:91.99.183.160',1,'2026-04-19 19:38:44','2026-04-19 19:38:44','de','','2026-04-19 19:38:09','2026-04-19 19:38:44',NULL,0,NULL,'heZvpVuF',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('7ac80fc2-8790-4f8b-845e-4404a78b5251',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGA4DGMRXHAZDM...','7ac80fc2-8790-4f8b-845e-4404a78b5251@beratungcaritas.de',NULL,'@anonymous-1775208327826:91.99.183.160',1,'2026-04-03 09:26:36','2026-04-03 09:26:36','de','','2026-04-03 09:26:37','2026-04-03 09:26:37',NULL,0,NULL,'ETP6Adeu',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('7afae28b-9e11-47a9-8311-455bec33a748',1,NULL,NULL,'enc.ONUGC6TJMF2XGZLSME......','7afae28b-9e11-47a9-8311-455bec33a748@beratungcaritas.de',NULL,'@shaziausera:91.99.183.160',1,'2026-03-21 11:22:02','2026-03-21 11:22:02','ru','','2026-03-21 11:22:02','2026-03-26 19:35:59',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('81b00232-70d8-4abb-bf3e-4160033aa4b1',1,NULL,NULL,'enc.OVZWK4TBMZ2GK4TSMVSGK4DMN54Q....','81b00232-70d8-4abb-bf3e-4160033aa4b1@beratungcaritas.de',NULL,'@userafterredeploy:91.99.183.160',1,'2026-03-25 14:55:12','2026-03-25 14:55:12','en','','2026-03-25 14:55:12','2026-03-26 19:35:59',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('844f6358-e287-4308-aebc-a4a63f67fb3d',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYDIMRXHEZDA...','844f6358-e287-4308-aebc-a4a63f67fb3d@beratungcaritas.de',NULL,'@anonymous-1775210427920:91.99.183.160',1,NULL,NULL,'de','','2026-04-03 10:00:59','2026-04-03 10:01:00',NULL,0,NULL,'Xn5HrUuT',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('8757b99c-179d-42a5-8d5a-1385aa131b92',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGA2DMNBTGQYDA...','8757b99c-179d-42a5-8d5a-1385aa131b92@beratungcaritas.de',NULL,'@anonymous-1775204643400:91.99.183.160',1,'2026-04-03 08:24:32','2026-04-03 08:24:32','de','','2026-04-03 08:24:10','2026-04-03 08:24:32',NULL,0,NULL,'owIeitms',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('88a36613-031b-403d-aba8-2db9a7ba218a',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWHAYDKOJRHE3TS...','88a36613-031b-403d-aba8-2db9a7ba218a@beratungcaritas.de',NULL,'@anonymous-1776680591979:91.99.183.160',1,'2026-04-20 10:32:19','2026-04-20 10:32:19','en','','2026-04-20 10:28:22','2026-04-20 10:32:19',NULL,0,NULL,'bNLKpwUn',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('88e637a3-2e35-450f-adb8-5b38969e204b',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJUG42DGMRWGEYDI...','88e637a3-2e35-450f-adb8-5b38969e204b@beratungcaritas.de',NULL,'@anonymous-1775474326104:91.99.183.160',1,'2026-04-06 11:36:02','2026-04-06 11:36:02','en','','2026-04-06 11:35:57','2026-04-06 11:36:02',NULL,0,NULL,'awg78HaD',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('918252cc-fba9-4d69-99eb-386bd888938d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHA3TSMZVGA3TQ...','918252cc-fba9-4d69-99eb-386bd888938d@beratungcaritas.de',NULL,'@anonymous-1776587935078:91.99.183.160',1,NULL,NULL,'de','','2026-04-19 08:39:31','2026-04-19 08:39:31',NULL,0,NULL,'AlXtMx9t',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2',1,NULL,NULL,'enc.ONUGC6TJMF2XGZLS','92cc06fd-0bb6-4008-a2e9-b2d994e5e7c2@beratungcaritas.de',NULL,'@shaziauser:91.99.183.160',1,'2026-03-13 17:30:32','2026-03-13 17:30:32','de','','2026-03-13 17:30:32','2026-04-05 12:12:02',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('93be7aef-db00-466d-a1ee-930948adaae9',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRRGQ4DQNBYHA2DA...','93be7aef-db00-466d-a1ee-930948adaae9@beratungcaritas.de',NULL,'@anonymous-1776148848840:91.99.183.160',1,'2026-04-14 06:40:59','2026-04-14 06:40:59','de','','2026-04-14 06:40:53','2026-04-14 06:40:59',NULL,0,NULL,'PEfz98Vj',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('9602ea11-62ce-462d-b62e-bc311c03a54e',NULL,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZUGMYTQOBUHA2DE...','9602ea11-62ce-462d-b62e-bc311c03a54e@beratungcaritas.de',NULL,'@anonymous-1773431884842:91.99.183.160',1,'2026-03-13 19:58:13','2026-03-13 19:58:13','de','','2026-03-13 19:58:13','2026-03-26 19:35:59',NULL,0,NULL,'7dyl9SVh',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('97b0bea3-55a6-4d90-8664-dd909dd78ae6',1,NULL,NULL,'enc.OFZGG33EMV2XGZLSGI......','97b0bea3-55a6-4d90-8664-dd909dd78ae6@beratungcaritas.de',NULL,'@qrcodeuser2:91.99.183.160',1,'2026-04-22 14:28:55','2026-04-22 14:28:55','en','','2026-04-22 14:28:55','2026-04-22 14:28:56',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('97fe2c40-5ae4-4680-a81d-5a5f9e825d99',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVG43DGNZSGI3DG...','97fe2c40-5ae4-4680-a81d-5a5f9e825d99@beratungcaritas.de',NULL,'@anonymous-1776576372263:91.99.183.160',1,'2026-04-19 05:26:40','2026-04-19 05:26:40','de','','2026-04-19 05:26:23','2026-04-19 05:26:40',NULL,0,NULL,'e3FHZWvA',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('9958b336-a315-4b9c-be6f-dafed64e86c3',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZXGU3DKNBSHE4TI...','9958b336-a315-4b9c-be6f-dafed64e86c3@beratungcaritas.de',NULL,'@anonymous-1773756542994:91.99.183.160',1,'2026-03-17 14:10:39','2026-03-17 14:10:39','en','','2026-03-17 14:10:39','2026-03-26 19:35:59',NULL,0,NULL,'5cY5KB0Y',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('99f18b34-24d6-467f-a775-d36545dda70e',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYTKNBSG4YTC...','99f18b34-24d6-467f-a775-d36545dda70e@beratungcaritas.de',NULL,'@anonymous-1775211542711:91.99.183.160',1,'2026-04-03 10:19:29','2026-04-03 10:19:29','de','','2026-04-03 10:19:09','2026-04-03 10:19:29',NULL,0,NULL,'JfjLSnru',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('9c5eb650-9cfe-4d8d-b530-ecc3ad54b102',NULL,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZUGIZTONJRGQYDO...','9c5eb650-9cfe-4d8d-b530-ecc3ad54b102@beratungcaritas.de',NULL,'@anonymous-1773423751407:91.99.183.160',1,'2026-03-13 17:42:35','2026-03-13 17:42:35','de','','2026-03-13 17:42:35','2026-03-26 19:35:59',NULL,0,NULL,'PfFus2Rd',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('9e62108f-0ebe-4799-bee4-2d5c67e5985b',1,NULL,NULL,'enc.ONUGC6TJME......','9e62108f-0ebe-4799-bee4-2d5c67e5985b@beratungcaritas.de',NULL,'@shazia:91.99.183.160',1,'2026-04-03 11:04:38','2026-04-03 11:04:38','de','','2026-04-03 11:04:38','2026-04-03 11:07:58',NULL,0,NULL,'Shazia@123',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('a082ca31-30f7-489d-afcc-92d2dc5ebb52',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYTCNRVG44DI...','a082ca31-30f7-489d-afcc-92d2dc5ebb52@beratungcaritas.de',NULL,'@anonymous-1775211165784:91.99.183.160',1,'2026-04-03 10:13:15','2026-04-03 10:13:15','de','','2026-04-03 10:12:55','2026-04-03 10:13:15',NULL,0,NULL,'Q1GCEmWB',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('a4338933-c3ba-4ac6-8382-d15dd6e491fd',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRYGM3TEMJQHEYTG...','a4338933-c3ba-4ac6-8382-d15dd6e491fd@beratungcaritas.de',NULL,'@anonymous-1776837210913:91.99.183.160',1,'2026-04-22 06:51:59','2026-04-22 06:51:59','de','','2026-04-22 05:53:31','2026-04-22 06:51:59',NULL,0,NULL,'0lfyR3ZO',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('a525c60f-453e-4f5d-a492-fad015582c6b',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJZGQYDSNBRGA3DA...','a525c60f-453e-4f5d-a492-fad015582c6b@beratungcaritas.de',NULL,'@anonymous-1775940941060:91.99.183.160',1,'2026-04-11 20:56:01','2026-04-11 20:56:01','en','','2026-04-11 20:55:42','2026-04-11 20:56:01',NULL,0,NULL,'Ps5G0y7D',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('a8e20c59-a046-43e6-90fe-307e7733499d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHA3TCMBYGEZDI...','a8e20c59-a046-43e6-90fe-307e7733499d@beratungcaritas.de',NULL,'@anonymous-1776587108124:91.99.183.160',1,'2026-04-19 08:25:35','2026-04-19 08:25:35','de','','2026-04-19 08:25:21','2026-04-19 08:25:35',NULL,0,NULL,'LrWuwudl',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ac5b5c51-2059-4e25-b800-ecf2c1c05ae3',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYDCMRVGI4TQ...','ac5b5c51-2059-4e25-b800-ecf2c1c05ae3@beratungcaritas.de',NULL,'@anonymous-1775210125298:91.99.183.160',1,'2026-04-03 09:55:33','2026-04-03 09:55:33','de','','2026-04-03 09:55:33','2026-04-03 09:55:33',NULL,0,NULL,'RuCpd6My',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ac6a6c53-6c4f-4964-a766-f28575a8dd8b',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQHA4DGNZUGU4DQ...','ac6a6c53-6c4f-4964-a766-f28575a8dd8b@beratungcaritas.de',NULL,'@anonymous-1774088374588:91.99.183.160',1,'2026-03-21 10:19:39','2026-03-21 10:19:39','ru','','2026-03-21 10:19:39','2026-03-26 19:35:59',NULL,0,NULL,'XnPCRc61',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('acf2bba0-308e-4f12-b362-0e584b0ba5ba',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBZGU4DGMRTGM2DG...','acf2bba0-308e-4f12-b362-0e584b0ba5ba@beratungcaritas.de',NULL,'@anonymous-1774958323343:91.99.183.160',1,'2026-03-31 11:58:57','2026-03-31 11:58:57','de','','2026-03-31 11:58:57','2026-03-31 11:58:57',NULL,0,NULL,'2GXSn2zf',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ae07bffd-0a9f-40e9-a843-af1677e9f0e9',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGEYDOMJVHEZTO...','ae07bffd-0a9f-40e9-a843-af1677e9f0e9@beratungcaritas.de',NULL,'@anonymous-1775210715937:91.99.183.160',1,NULL,NULL,'de','','2026-04-03 10:05:24','2026-04-03 10:05:24',NULL,0,NULL,'6ipHB9v3',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('aed6626d-4ba1-4b59-99a6-284e59de1664',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGY4DCMBYHEYTK...','aed6626d-4ba1-4b59-99a6-284e59de1664@beratungcaritas.de',NULL,'@anonymous-1776668108915:91.99.183.160',1,NULL,NULL,'de','','2026-04-20 06:55:33','2026-04-20 06:55:33',NULL,0,NULL,'bZfkr8rh',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('b14b7574-0aab-4b7e-97c0-6e7bf87b64b4',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBUGYYTINZXHE3DQ...','b14b7574-0aab-4b7e-97c0-6e7bf87b64b4@beratungcaritas.de',NULL,'@anonymous-1774461477968:91.99.183.160',1,'2026-03-25 17:58:05','2026-03-25 17:58:05','en','','2026-03-25 17:58:05','2026-03-26 19:35:59',NULL,0,NULL,'gxZAflEs',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('b20520e6-827c-431f-8dd1-cf94fe576c1b',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRYGQ3DCOBQGQ2TC...','b20520e6-827c-431f-8dd1-cf94fe576c1b@beratungcaritas.de',NULL,'@anonymous-1776846180451:91.99.183.160',1,'2026-04-22 08:27:21','2026-04-22 08:27:21','en','','2026-04-22 08:23:00','2026-04-22 08:27:30',NULL,0,NULL,'91JKLSMX',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('b2dbe7fc-125e-4625-ab27-ae68504bcf6c',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJXGE4TCNJQHAZTO...','b2dbe7fc-125e-4625-ab27-ae68504bcf6c@beratungcaritas.de',NULL,'@anonymous-1775719150837:91.99.183.160',1,'2026-04-09 07:19:28','2026-04-09 07:19:28','de','','2026-04-09 07:19:22','2026-04-09 07:19:28',NULL,0,NULL,'3NyBXY4i',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('b3b34f87-963f-4103-8e5e-8e4895ca4fe7',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJUG42TAMJUGU2DQ...','b3b34f87-963f-4103-8e5e-8e4895ca4fe7@beratungcaritas.de',NULL,'@anonymous-1775475014548:91.99.183.160',1,'2026-04-06 11:30:56','2026-04-06 11:30:56','en','','2026-04-06 11:30:49','2026-04-06 11:30:56',NULL,0,NULL,'R8creMUE',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('b916a4b4-4df3-4eb2-84ee-2819cfcf4779',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZZGUZTCNBYGU2DK...','b916a4b4-4df3-4eb2-84ee-2819cfcf4779@beratungcaritas.de',NULL,'@anonymous-1773953148545:91.99.183.160',1,'2026-03-19 20:45:57','2026-03-19 20:45:57','en','','2026-03-19 20:45:57','2026-03-26 19:35:59',NULL,0,NULL,'1c2l7mPD',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('bbd4ed48-0d74-413a-9748-4b35dea03df8',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWHA2DMOBZGQZDQ...','bbd4ed48-0d74-413a-9748-4b35dea03df8@beratungcaritas.de',NULL,'@anonymous-1776684689428:91.99.183.160',1,'2026-04-20 11:33:10','2026-04-20 11:33:10','en','','2026-04-20 11:33:04','2026-04-20 11:33:10',NULL,0,NULL,'0mGLZ1CS',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('bc2fb63f-0899-49ec-bbda-c1ef46f23c44',1,NULL,NULL,'enc.M52WK43UL4YTONZWHAZTGNBQGZPWKNBWG4ZGC...','bc2fb63f-0899-49ec-bbda-c1ef46f23c44@beratungcaritas.de',NULL,'@guest_1776833406_e4672a:91.99.183.160',1,NULL,NULL,'de','','2026-04-22 04:50:06','2026-04-22 04:50:06',NULL,0,NULL,'Auto-gen-5079e594273c7964!A1',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('bda23150-cc97-4271-afd5-4dc5a10b5970',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRYGM2TGNBUGU4DS...','bda23150-cc97-4271-afd5-4dc5a10b5970@beratungcaritas.de',NULL,'@anonymous-1776835344589:91.99.183.160',1,'2026-04-22 05:22:35','2026-04-22 05:22:35','de','','2026-04-22 05:22:24','2026-04-22 05:22:35',NULL,0,NULL,'YL0DwQrd',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('be0064d7-01c6-4ebc-8c17-2c84073013ed',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSG44TONJYGYZDE...','be0064d7-01c6-4ebc-8c17-2c84073013ed@beratungcaritas.de',NULL,'@anonymous-1775279758622:91.99.183.160',1,'2026-04-04 05:16:48','2026-04-04 05:16:48','de','','2026-04-04 05:16:37','2026-04-04 05:16:48',NULL,0,NULL,'zSSJ4IZz',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('bed9933c-58be-41b5-8848-3dde2ad3150d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZYGA4TCMZRGA3TM...','bed9933c-58be-41b5-8848-3dde2ad3150d@beratungcaritas.de',NULL,'@anonymous-1773809131076:91.99.183.160',1,'2026-03-18 04:45:48','2026-03-18 04:45:48','en','','2026-03-18 04:45:48','2026-03-26 19:35:59',NULL,0,NULL,'7hKKuiur',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('c60539c2-ce39-4197-8b18-21dfaaecf157',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJYGYYDAOBWGQ4DI...','c60539c2-ce39-4197-8b18-21dfaaecf157@beratungcaritas.de',NULL,'@anonymous-1775860086484:91.99.183.160',1,'2026-04-10 22:28:28','2026-04-10 22:28:28','en','','2026-04-10 22:28:23','2026-04-10 22:28:28',NULL,0,NULL,'x0SlltFJ',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('c8189789-b4a9-4a91-abc1-47ebb9c68cd1',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGAZTMOBVG43TA...','c8189789-b4a9-4a91-abc1-47ebb9c68cd1@beratungcaritas.de',NULL,'@anonymous-1775203685770:91.99.183.160',1,'2026-04-03 08:08:21','2026-04-03 08:08:21','de','','2026-04-03 08:08:21','2026-04-03 08:08:22',NULL,0,NULL,'muzvRsSn',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ca2a5bfe-6ff7-4eeb-ab39-fc0ffd35a87e',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBRGA3TQNRYGQYDG...','ca2a5bfe-6ff7-4eeb-ab39-fc0ffd35a87e@beratungcaritas.de',NULL,'@anonymous-1774107868403:91.99.183.160',1,'2026-03-21 15:44:37','2026-03-21 15:44:37','en','','2026-03-21 15:44:37','2026-03-26 19:35:59',NULL,0,NULL,'frxGWW6t',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('caa721b6-4bf0-4388-833c-9f08f431dcbc',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJVGY2TSNBWHAZTS...','caa721b6-4bf0-4388-833c-9f08f431dcbc@beratungcaritas.de',NULL,'@anonymous-1775565946839:91.99.183.160',1,'2026-04-07 12:46:10','2026-04-07 12:46:10','en','','2026-04-07 12:45:58','2026-04-07 12:46:10',NULL,0,NULL,'26e0vzE7',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('caritas_admin',NULL,NULL,NULL,'caritas_admin','caritas_admin@caritas.local',NULL,'@caritas_admin:91.99.183.160',0,NULL,NULL,'de','','2025-12-27 08:33:16','2026-03-26 19:35:59',NULL,0,'','@CaritasAdmin2025!',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ce501717-d465-4ac4-a2cf-ae1841655c08',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHEZDONRUGA2DQ...','ce501717-d465-4ac4-a2cf-ae1841655c08@beratungcaritas.de',NULL,'@anonymous-1776592764048:91.99.183.160',1,'2026-04-19 10:45:42','2026-04-19 10:45:42','de','','2026-04-19 09:59:31','2026-04-19 10:45:42',NULL,0,NULL,'Xxii6d9m',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('cf00d047-7582-4635-a75b-97a5f30c0ef6',1,NULL,NULL,'enc.MFSGI5DFON2DCNZXGY4TGOJRGA4A....','cf00d047-7582-4635-a75b-97a5f30c0ef6@beratungcaritas.de',NULL,'@addtest1776939108:91.99.183.160',1,'2026-04-23 10:11:49','2026-04-23 10:11:49','de','','2026-04-23 10:11:49','2026-04-23 10:11:49',NULL,0,NULL,'Passw0rd!1776939108',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('cf319751-dd11-48cc-b8d3-380ee685ce6f',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJRHE2DQNRQG4YTA...','cf319751-dd11-48cc-b8d3-380ee685ce6f@beratungcaritas.de',NULL,'@anonymous-1775194860710:91.99.183.160',1,'2026-04-03 05:41:08','2026-04-03 05:41:08','de','','2026-04-03 05:41:08','2026-04-03 05:41:09',NULL,0,NULL,'TpZiruvC',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('d5f3c9f0-7757-474a-af2f-42797c464ce8',1,NULL,NULL,'enc.MFSGI5DFON2DCNZXGY4TGNZUHAYA....','d5f3c9f0-7757-474a-af2f-42797c464ce8@beratungcaritas.de',NULL,'@addtest1776937480:91.99.183.160',1,'2026-04-23 09:44:41','2026-04-23 09:44:41','de','','2026-04-23 09:44:41','2026-04-23 09:44:42',NULL,0,NULL,'Passw0rd!1776937480',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('d693b4fb-0058-42d5-970f-d402ebc92be0',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQHE2DGMJTHAZTM...','d693b4fb-0058-42d5-970f-d402ebc92be0@beratungcaritas.de',NULL,'@anonymous-1774094313836:91.99.183.160',1,'2026-03-21 11:58:40','2026-03-21 11:58:40','en','','2026-03-21 11:58:40','2026-03-26 19:35:59',NULL,0,NULL,'qCSa8zXk',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('d92012ea-1455-47c2-bcf2-5a03355701e0',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJRHE4TIOJRGQ4DQ...','d92012ea-1455-47c2-bcf2-5a03355701e0@beratungcaritas.de',NULL,'@anonymous-1775199491488:91.99.183.160',1,'2026-04-03 06:58:18','2026-04-03 06:58:18','de','','2026-04-03 06:58:18','2026-04-03 06:58:18',NULL,0,NULL,'gipIbC3K',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('d996f341-ef1e-48ad-8ac9-786196d8cd21',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQHE4DQNZSGU3DK...','d996f341-ef1e-48ad-8ac9-786196d8cd21@beratungcaritas.de',NULL,'@anonymous-1774098872565:91.99.183.160',1,'2026-03-21 13:14:38','2026-03-21 13:14:38','en','','2026-03-21 13:14:38','2026-03-26 19:35:59',NULL,0,NULL,'lltSs2D2',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('dd126e91-306f-4d3a-bf43-252495b2075f',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHAYTKMRRG43DG...','dd126e91-306f-4d3a-bf43-252495b2075f@beratungcaritas.de',NULL,'@anonymous-1776581521763:91.99.183.160',1,'2026-04-19 07:31:26','2026-04-19 07:31:26','de','','2026-04-19 06:52:18','2026-04-19 07:31:26',NULL,0,NULL,'A4n5SxRu',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('de7613d4-b0d5-4366-bc54-983772703068',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZZGQ4TQNZRGY2TM...','de7613d4-b0d5-4366-bc54-983772703068@beratungcaritas.de',NULL,'@anonymous-1773949871656:91.99.183.160',1,'2026-03-19 19:51:19','2026-03-19 19:51:19','de','','2026-03-19 19:51:19','2026-03-26 19:35:59',NULL,0,NULL,'nMeeiW6y',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('e24bf81a-8f22-40ca-a7d6-1f2852daabb3',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGY3TQMZXGU3TQ...','e24bf81a-8f22-40ca-a7d6-1f2852daabb3@beratungcaritas.de',NULL,'@anonymous-1776667837578:91.99.183.160',1,'2026-04-20 06:51:05','2026-04-20 06:51:05','de','','2026-04-20 06:50:42','2026-04-20 06:51:05',NULL,0,NULL,'4MZZIIXH',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('e4e6b006-b1ef-4a74-8bb6-70183cbff31f',1,NULL,NULL,'enc.M52WK43UL5QW6YLZOFTGI2DLGVSGU...','e4e6b006-b1ef-4a74-8bb6-70183cbff31f@beratungcaritas.de',NULL,'@guest_aoayqfdhk5dj:91.99.183.160',1,'2026-04-22 05:13:47','2026-04-22 05:13:47','de','','2026-04-22 05:13:14','2026-04-22 05:13:47',NULL,0,NULL,'Hc8bmlX4QGoRAa1!',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('e4ff3273-106c-4df9-b062-09e341ce7c3d',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQGUYDKNBZGQZDS...','e4ff3273-106c-4df9-b062-09e341ce7c3d@beratungcaritas.de',NULL,'@anonymous-1774050549429:91.99.183.160',1,'2026-03-20 23:49:15','2026-03-20 23:49:15','de','','2026-03-20 23:49:15','2026-03-26 19:35:59',NULL,0,NULL,'lkBR8UJK',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('e6bb27b0-f66c-41a7-af1e-da686c0da328',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONBQGA2DAMZSG44TA...','e6bb27b0-f66c-41a7-af1e-da686c0da328@beratungcaritas.de',NULL,'@anonymous-1774004032790:91.99.183.160',1,'2026-03-20 10:53:58','2026-03-20 10:53:58','en','','2026-03-20 10:53:58','2026-03-26 19:35:59',NULL,0,NULL,'F4Al3t1F',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('eb1769d5-0517-429d-8ea5-8a369aeeb0d8',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZYGMYTKMBWGI3DC...','eb1769d5-0517-429d-8ea5-8a369aeeb0d8@beratungcaritas.de',NULL,'@anonymous-1773831506261:91.99.183.160',1,'2026-03-18 10:58:42','2026-03-18 10:58:42','de','','2026-03-18 10:58:42','2026-04-13 09:14:56',NULL,0,NULL,'gMNZZmzv',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ec2142c9-c7f4-4e16-8657-a0030a33aaa1',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJZGEZTGNZUGAYDQ...','ec2142c9-c7f4-4e16-8657-a0030a33aaa1@beratungcaritas.de',NULL,'@anonymous-1775913374008:91.99.183.160',1,'2026-04-11 13:16:45','2026-04-11 13:16:45','de','','2026-04-11 13:16:25','2026-04-11 13:16:45',NULL,0,NULL,'81GRMbUf',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ee363dea-60c2-4bb6-bd28-a590e146832c',1,NULL,NULL,'enc.MFSGI5DFON2DCNZXGY4TGOBRHA4A....','ee363dea-60c2-4bb6-bd28-a590e146832c@beratungcaritas.de',NULL,'@addtest1776938188:91.99.183.160',1,'2026-04-23 09:56:28','2026-04-23 09:56:28','de','','2026-04-23 09:56:29','2026-04-23 09:56:29',NULL,0,NULL,'Passw0rd!1776938188',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('efb28176-89c4-48e6-830e-5859f6293376',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSHAYDMNRTGMZTC...','efb28176-89c4-48e6-830e-5859f6293376@beratungcaritas.de',NULL,'@anonymous-1775280663331:91.99.183.160',1,'2026-04-04 05:31:16','2026-04-04 05:31:16','de','','2026-04-04 05:31:08','2026-04-04 05:31:16',NULL,0,NULL,'ZJ2wqUHD',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f1306bed-6325-4bdd-bcda-fa53df72ef33',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRXGU3DKNRQGY3TC...','f1306bed-6325-4bdd-bcda-fa53df72ef33@beratungcaritas.de',NULL,'@anonymous-1776756560671:91.99.183.160',1,'2026-04-21 07:34:39','2026-04-21 07:34:39','en','','2026-04-21 07:29:27','2026-04-21 07:34:39',NULL,0,NULL,'A9EnnmXE',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f13085a2-2d0a-428e-af71-3001ff20b61f',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWGY4DENRUG43TI...','f13085a2-2d0a-428e-af71-3001ff20b61f@beratungcaritas.de',NULL,'@anonymous-1776668264774:91.99.183.160',1,'2026-04-20 06:58:06','2026-04-20 06:58:06','de','','2026-04-20 06:57:50','2026-04-20 06:58:06',NULL,0,NULL,'E9Axu5yD',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f425c72c-f215-4b74-9343-cc1f91c8c074',22,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRUGA3TGNJYGYZDM...','f425c72c-f215-4b74-9343-cc1f91c8c074@beratungcaritas.de',NULL,'@anonymous-1776407358626:91.99.183.160',1,NULL,NULL,'en','','2026-04-17 06:29:26','2026-04-17 06:29:26',NULL,0,NULL,'7sjjirOd',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f4cca44f-60f8-43dd-bc0f-90219b898d69',1,NULL,NULL,'enc.ONUGC6TJOVZWK4TT','f4cca44f-60f8-43dd-bc0f-90219b898d69@beratungcaritas.de',NULL,'@shaziusers:91.99.183.160',1,'2026-04-02 22:31:13','2026-04-02 22:31:13','de','','2026-04-02 22:31:13','2026-04-02 22:31:13',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f5634c10-409b-42ae-964f-e6fb61ec005c',1,NULL,NULL,'enc.OFZGG33EMV2XGZLSGE......','f5634c10-409b-42ae-964f-e6fb61ec005c@beratungcaritas.de',NULL,'@qrcodeuser1:91.99.183.160',1,'2026-04-22 13:29:43','2026-04-22 13:29:43','en','','2026-04-22 13:29:43','2026-04-22 13:29:43',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f688cc36-dab9-4da1-a354-46914088190f',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRVHA3DCNJWG43DI...','f688cc36-dab9-4da1-a354-46914088190f@beratungcaritas.de',NULL,'@anonymous-1776586156764:91.99.183.160',1,'2026-04-19 08:09:37','2026-04-19 08:09:37','de','','2026-04-19 08:09:25','2026-04-19 08:09:37',NULL,0,NULL,'4PPYmQjd',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f79b9384-3a8d-43a3-bf84-c7281f2af9b7',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TOMZXG42TSNBSGM4TI...','f79b9384-3a8d-43a3-bf84-c7281f2af9b7@beratungcaritas.de',NULL,'@anonymous-1773775942394:91.99.183.160',1,'2026-03-17 19:32:37','2026-03-17 19:32:37','de','','2026-03-17 19:32:37','2026-03-26 19:35:59',NULL,0,NULL,'zBfqRfsW',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f82c7a88-66c9-4aae-9f1d-4b2ce760580b',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJSGAYDQNBUGMYDA...','f82c7a88-66c9-4aae-9f1d-4b2ce760580b@beratungcaritas.de',NULL,'@anonymous-1775200844300:91.99.183.160',1,'2026-04-03 07:20:51','2026-04-03 07:20:51','de','','2026-04-03 07:20:51','2026-04-03 07:20:51',NULL,0,NULL,'Wcdu9G9i',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('f8413e81-e6d5-4bbc-b058-59111708b4a5',21,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRWHA2DIMJQGA2TK...','f8413e81-e6d5-4bbc-b058-59111708b4a5@beratungcaritas.de',NULL,'@anonymous-1776684410055:91.99.183.160',1,'2026-04-20 11:29:25','2026-04-20 11:29:25','en','','2026-04-20 11:27:04','2026-04-20 11:29:25',NULL,0,NULL,'nrJrfJh1',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('fbcd6f57-ff53-4533-b26e-97a89c380855',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONJYGU4TSOJYGQ4TA...','fbcd6f57-ff53-4533-b26e-97a89c380855@beratungcaritas.de',NULL,'@anonymous-1775859998490:91.99.183.160',1,'2026-04-10 22:27:48','2026-04-10 22:27:48','en','','2026-04-10 22:26:57','2026-04-10 22:27:48',NULL,0,NULL,'hbVdKt4V',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('fd123f8c-df5b-4661-a5bb-be5ba5cd7be5',1,NULL,NULL,'enc.IFXG63TZNVXXK4ZNGE3TONRYGQ3DCNZQGE2TE...','fd123f8c-df5b-4661-a5bb-be5ba5cd7be5@beratungcaritas.de',NULL,'@anonymous-1776846170152:91.99.183.160',1,NULL,NULL,'de','','2026-04-22 08:22:50','2026-04-22 08:22:50',NULL,0,NULL,'dga7EFqZ',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('fe0d0f30-5f17-4a2f-9964-6517a8d96cb3',1,NULL,NULL,'enc.ONUGC6TJMF2XGZLSGE......','fe0d0f30-5f17-4a2f-9964-6517a8d96cb3@beratungcaritas.de',NULL,'@shaziauser1:91.99.183.160',1,'2026-03-13 17:46:37','2026-03-13 17:46:37','en','','2026-03-13 17:46:37','2026-04-22 22:11:07',NULL,0,NULL,'@User12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('ff691d60-b1ad-4d29-955d-118455c10ede',1,NULL,NULL,'enc.NFXHM2LUMVWGS3TLORSXG5DFOIZA....','ff691d60-b1ad-4d29-955d-118455c10ede@beratungcaritas.de',NULL,'@invitelinktester2:91.99.183.160',1,'2026-04-22 12:28:36','2026-04-22 12:28:36','de','','2026-04-22 12:28:36','2026-04-22 12:28:37',NULL,0,NULL,'@Consultant12345',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('group-chat-system',1,NULL,NULL,'group-chat-system','group-chat-system@caritas.local',NULL,'@group-chat-system:91.99.183.160',0,NULL,NULL,'de','','2025-12-27 08:33:16','2026-03-28 01:12:24',NULL,0,'','@GroupChatSystem2025!',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('group-chat-system-1',1,NULL,NULL,'group-chat-system-1','group-chat-system-1@oriso.local',NULL,NULL,1,'2026-03-25 14:56:23','2026-03-25 14:56:23','de','','2026-03-25 14:56:23','2026-03-26 19:35:59',NULL,0,NULL,NULL,0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('oriso_call_admin',NULL,NULL,NULL,'oriso_call_admin','oriso_call_admin@caritas.local',NULL,'@oriso_call_admin:91.99.183.160',0,NULL,NULL,'de','','2025-12-27 08:33:16','2026-03-26 19:35:59',NULL,0,'','@OrisoCallAdmin2025!',0,'ACTIVE',NULL,NULL,NULL,NULL,NULL),
('sec6-demo-asker-fresh',1,NULL,NULL,'sec6demoaskerfresh','sec6demoaskerfresh@example.invalid',NULL,NULL,1,NULL,NULL,'de','','2026-02-25 12:47:22','2026-03-17 12:47:22',NULL,0,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
('sec6-demo-asker-old',1,NULL,NULL,'sec6demoaskerold','sec6demoaskerold@example.invalid',NULL,NULL,1,NULL,NULL,'de','','2024-11-12 12:47:22','2025-02-20 12:47:22',NULL,0,'',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`user_update` BEFORE UPDATE ON `userservice`.`user` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_agency`
--

DROP TABLE IF EXISTS `user_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_agency` (
  `id` bigint(21) unsigned NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `agency_id` bigint(21) unsigned NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  KEY `chat_id` (`user_id`),
  CONSTRAINT `user_agency_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_agency`
--

LOCK TABLES `user_agency` WRITE;
/*!40000 ALTER TABLE `user_agency` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_agency` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`user_agency_update` BEFORE UPDATE ON `userservice`.`user_agency` FOR EACH ROW BEGIN
set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_chat`
--

DROP TABLE IF EXISTS `user_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_chat` (
  `id` bigint(21) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `chat_id` bigint(21) unsigned NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueUserAndChat` (`user_id`,`chat_id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `chat_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `chat_user_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_chat`
--

LOCK TABLES `user_chat` WRITE;
/*!40000 ALTER TABLE `user_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mobile_token`
--

DROP TABLE IF EXISTS `user_mobile_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mobile_token` (
  `id` bigint(21) unsigned NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `mobile_app_token` longtext NOT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_app_token` (`mobile_app_token`) USING HASH,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_mobile_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mobile_token`
--

LOCK TABLES `user_mobile_token` WRITE;
/*!40000 ALTER TABLE `user_mobile_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mobile_token` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`userservice`@`%`*/ /*!50003 TRIGGER `userservice`.`user_mobile_token_update`
    BEFORE UPDATE ON `userservice`.`user_mobile_token`
    FOR EACH ROW BEGIN set new.update_date=utc_timestamp();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'userservice'
--

--
-- Dumping routines for database 'userservice'
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
