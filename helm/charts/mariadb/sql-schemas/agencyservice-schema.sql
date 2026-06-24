DROP SEQUENCE IF EXISTS `sequence_agency`;
CREATE SEQUENCE `sequence_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency`, 270, 0);

DROP SEQUENCE IF EXISTS `sequence_agency_postcode_range`;
CREATE SEQUENCE `sequence_agency_postcode_range` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency_postcode_range`, 280, 0);

DROP SEQUENCE IF EXISTS `sequence_agency_topic`;
CREATE SEQUENCE `sequence_agency_topic` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 10 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_agency_topic`, 400, 0);

DROP SEQUENCE IF EXISTS `sequence_diocese`;
CREATE SEQUENCE `sequence_diocese` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_diocese`, 0, 0);

DROP TABLE IF EXISTS `agency_topic`;
DROP TABLE IF EXISTS `agency_postcode_range`;
DROP TABLE IF EXISTS `agency`;
DROP TABLE IF EXISTS `DATABASECHANGELOG`;
DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
DROP TABLE IF EXISTS `diocese`;

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

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `diocese` (
  `id` bigint(21) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_old` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `agency` (
  `id` bigint(21) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `diocese_id` bigint(21) DEFAULT NULL,
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
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_date` datetime DEFAULT NULL,
  `counselling_relations` varchar(200) DEFAULT NULL,
  `data_protection_responsible_entity` varchar(100) DEFAULT NULL,
  `data_protection_alternative_contact` longtext DEFAULT NULL,
  `data_protection_officer_contact` longtext DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `data_protection_agency_contact` longtext DEFAULT NULL,
  `agency_logo` longtext DEFAULT NULL,
  `matrix_user_id` varchar(255) DEFAULT NULL,
  `matrix_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diocese_id` (`diocese_id`),
  CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`diocese_id`) REFERENCES `diocese` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `agency_postcode_range` (
  `id` bigint(21) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `agency_id` bigint(21) NOT NULL,
  `postcode_from` varchar(5) NOT NULL,
  `postcode_to` varchar(5) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `agency_postcode_range_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `agency_topic` (
  `id` bigint(21) NOT NULL,
  `agency_id` bigint(21) NOT NULL,
  `topic_id` bigint(21) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  CONSTRAINT `agency_topic_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


USE agencyservice;

-- 1. Create a diocese (required by FK constraint)
INSERT INTO diocese (id, name, id_old, create_date, update_date)
VALUES (1, 'Erzbistum Test', 1, NOW(), NOW());

-- 2. Create the agency
INSERT INTO agency (
    id, tenant_id, diocese_id, name, description, postcode, city,
    is_team_agency, consulting_type, is_offline, url, is_external,
    age_from, age_to, genders, create_date, update_date
) VALUES (
             1, 1, 1, 'Test Beratungsstelle', 'Eine Test-Beratungsstelle',
             '12345', 'Berlin', 0, 1, 0, 'https://www.example.com', 0,
             0, 100, 'FEMALE,MALE,DIVERSE', NOW(), NOW()
         );

-- 3. Create postcode range (so it shows up in registration)
INSERT INTO `agency` VALUES
                         (237,1,NULL,'Caritas Agency','Description.','12345','City',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 17:28:02','2026-03-13 17:29:36',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-237-service:caritas.local','NSDta-DETIWNyvb7tzCQo5Gc'),
                         (238,1,NULL,'Caritas Mitte','Description.','12345','Berlin',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 19:43:17','2026-04-10 10:27:06',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-238-service:caritas.local','McgyiNBNsmCb4DoQ43m3_40D'),
                         (239,0,NULL,'Testing Field','description.','12345','CITY',0,1,1,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 20:00:26','2026-03-13 20:00:26',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-239-service:caritas.local','iFxyWrTZonBzP3QnGdU-bLye'),
                         (240,1,NULL,'Testing field 2','description.','12345','city',0,1,1,NULL,0,NULL,NULL,NULL,NULL,'2026-03-13 20:01:54','2026-03-13 20:01:54',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-240-service:caritas.local','zadQ0Y6smDulB7xTL_4H79Qj'),
                         (241,1,NULL,'Beratungsstelle Kreuzberg','Schaun ma wie es jeht - na jut!','10965','Berlin',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-19 13:22:00','2026-03-24 12:51:16',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-241-service:caritas.local','XDmfYtp0RSdDsJrOoElGkV-w'),
                         (243,20,NULL,'Beratungsstelle Kiel','Vorführung Christine ','24103','Kiel',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-30 12:08:37','2026-03-30 12:11:52',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-243-service:caritas.local','aGnSX0Q9zK0oPXMskSEEY65i'),
                         (244,20,NULL,'Beratungstelle U25 ','Peer Beratung für Jugendliche in Schwierigen Situationen','00000','Kiel',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-30 12:11:12','2026-03-30 12:11:46',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-244-service:caritas.local','wvzBZdlCUTc2-tibAnkPIfms'),
                         (245,21,NULL,'Caritas am Meer','','23966','Wismar',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-31 13:52:35','2026-03-31 13:54:02',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-245-service:caritas.local','2xT0ZAg3z8K01CkmH-OIOTE9'),
                         (246,21,NULL,'Caritasverband Wismar ','dfds','23966','Wismar',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-03-31 13:54:41','2026-03-31 13:59:53',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-246-service:caritas.local','LxBq_wZ-CnqKmXBIxFSs6kj_'),
                         (247,1,NULL,'Caritas Neukölln','','12043','Berlin',0,1,1,NULL,0,NULL,NULL,NULL,NULL,'2026-04-10 10:46:47','2026-04-10 10:46:47',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-247-service:caritas.local','eKGF2iAVLWvFWRA7rcnX7-Zs'),
                         (248,22,NULL,'Schwangerschaftberatung Deutschland','Demo 14. April','86161','Augburg',0,1,0,NULL,0,NULL,NULL,NULL,NULL,'2026-04-14 06:51:00','2026-04-14 06:54:06',NULL,'RELATIVE_COUNSELLING,SELF_COUNSELLING,PARENTAL_COUNSELLING',NULL,NULL,NULL,NULL,'','@agency-248-service:caritas.local','Ck38ojHZ0zVrzVCocCOloLuf');



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



CREATE TABLE `agency_admin_control` (
                                        `id` bigint(21) unsigned NOT NULL,
                                        `controls` varchar(4000) NOT NULL,
                                        `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DROP SEQUENCE IF EXISTS `sequence_agency_admin_control`;

CREATE SEQUENCE `sequence_agency_admin_control`
    START WITH 0
    MINVALUE 0
    MAXVALUE 9223372036854775806
    INCREMENT BY 1
    CACHE 10
NOCYCLE
ENGINE=InnoDB;

DO SETVAL(`sequence_agency_admin_control`, 0, 0);