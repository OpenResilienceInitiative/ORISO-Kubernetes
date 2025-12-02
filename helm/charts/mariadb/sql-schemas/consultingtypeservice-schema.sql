--
-- ------------------------------------------------------


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

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
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

--
-- Table structure for table `topic_group`
--

DROP TABLE IF EXISTS `topic_group`;
CREATE TABLE `topic_group` (
  `id` bigint(21) NOT NULL,
  `name` varchar(4092) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Table structure for table `topic_group_x_topic`
--

DROP TABLE IF EXISTS `topic_group_x_topic`;
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


