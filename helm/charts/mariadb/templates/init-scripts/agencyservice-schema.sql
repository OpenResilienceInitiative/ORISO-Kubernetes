/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: agencyservice
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-ubu2204

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
-- Sequence structure for `sequence_agency`
--

DROP SEQUENCE IF EXISTS `sequence_agency`;
CREATE SEQUENCE `sequence_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency`, 160, 0);

--
-- Sequence structure for `sequence_agency_postcode_range`
--

DROP SEQUENCE IF EXISTS `sequence_agency_postcode_range`;
CREATE SEQUENCE `sequence_agency_postcode_range` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency_postcode_range`, 130, 0);

--
-- Sequence structure for `sequence_agency_topic`
--

DROP SEQUENCE IF EXISTS `sequence_agency_topic`;
CREATE SEQUENCE `sequence_agency_topic` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency_topic`, 230, 0);

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-28 17:29:07
