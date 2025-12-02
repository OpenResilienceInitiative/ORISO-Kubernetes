--
-- ------------------------------------------------------


--
-- Sequence structure for `sequence_admin_agency`
--

DROP SEQUENCE IF EXISTS `sequence_admin_agency`;
CREATE SEQUENCE `sequence_admin_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_admin_agency`, 100000, 0);

--
-- Sequence structure for `sequence_chat`
--

DROP SEQUENCE IF EXISTS `sequence_chat`;
CREATE SEQUENCE `sequence_chat` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_chat`, 100, 0);

--
-- Sequence structure for `sequence_chat_agency`
--

DROP SEQUENCE IF EXISTS `sequence_chat_agency`;
CREATE SEQUENCE `sequence_chat_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_chat_agency`, 100, 0);

--
-- Sequence structure for `sequence_consultant_agency`
--

DROP SEQUENCE IF EXISTS `sequence_consultant_agency`;
CREATE SEQUENCE `sequence_consultant_agency` start with 0 minvalue 0 maxvalue 9223372036854775806 increment by 1 cache 100 nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_consultant_agency`, 100300, 0);

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
DO SETVAL(`sequence_session`, 101700, 0);

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
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

--
-- Table structure for table `admin_agency`
--

DROP TABLE IF EXISTS `admin_agency`;
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

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `consultant`;
CREATE TABLE `consultant` (
  `consultant_id` varchar(36) NOT NULL,
  `tenant_id` bigint(21) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_team_consultant` tinyint(4) unsigned NOT NULL DEFAULT 0,
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
  PRIMARY KEY (`consultant_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `idx_first_name_last_name_email_delete_date` (`first_name`,`last_name`,`email`,`delete_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

DROP TABLE IF EXISTS `appointment`;
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

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
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

--
-- Table structure for table `chat_agency`
--

DROP TABLE IF EXISTS `chat_agency`;
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

 
--
-- Table structure for table `consultant_agency`
--

DROP TABLE IF EXISTS `consultant_agency`;
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

--
-- Table structure for table `consultant_mobile_token`
--

DROP TABLE IF EXISTS `consultant_mobile_token`;
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

--
-- Table structure for table `group_chat_participant`
--

DROP TABLE IF EXISTS `group_chat_participant`;
CREATE TABLE `group_chat_participant` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` bigint(20) unsigned NOT NULL,
  `consultant_id` varchar(36) NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_chat_consultant` (`chat_id`,`consultant_id`),
  KEY `idx_consultant` (`consultant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_code` varchar(2) NOT NULL,
  `consultant_id` varchar(36) NOT NULL,
  PRIMARY KEY (`consultant_id`,`language_code`),
  CONSTRAINT `language_id_consultant_constraint` FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Table structure for table `session_data`
--

DROP TABLE IF EXISTS `user`;
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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
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



DROP TABLE IF EXISTS `session_data`;
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

--
-- Table structure for table `session_topic`
--

DROP TABLE IF EXISTS `session_topic`;
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

--
-- Table structure for table `user`
--

--
-- Table structure for table `user_agency`
--

DROP TABLE IF EXISTS `user_agency`;
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

--
-- Table structure for table `user_chat`
--

DROP TABLE IF EXISTS `user_chat`;
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

--
-- Table structure for table `user_mobile_token`
--

DROP TABLE IF EXISTS `user_mobile_token`;
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


