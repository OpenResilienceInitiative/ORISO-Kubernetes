--
-- ------------------------------------------------------


--
-- Sequence structure for `sequence_tenant`
--

DROP SEQUENCE IF EXISTS `sequence_tenant`;
CREATE SEQUENCE `sequence_tenant` start with 1 minvalue 0 maxvalue 9223372036854775806 increment by 1 nocache nocycle ENGINE=InnoDB;
DO SETVAL(`sequence_tenant`, 1, 0);

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
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
CREATE TABLE `tenant` (
  `id` bigint(21) NOT NULL,
  `name` varchar(40) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `licensing_allowed_users` int(11) DEFAULT NULL,
  `theming_logo` longtext DEFAULT NULL,
  `theming_favicon` longtext DEFAULT NULL,
  `theming_primary_color` varchar(15) DEFAULT NULL,
  `theming_secondary_color` varchar(15) DEFAULT NULL,
  `content_impressum` longtext DEFAULT NULL,
  `content_claim` varchar(1024) DEFAULT NULL,
  `settings` varchar(4000) DEFAULT NULL,
  `content_privacy` longtext DEFAULT NULL,
  `content_termsandconditions` longtext DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `update_date` datetime NOT NULL DEFAULT utc_timestamp(),
  `privacy_activation_date` datetime DEFAULT NULL,
  `termsandconditions_activation_date` datetime DEFAULT NULL,
  `theming_association_logo` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;


