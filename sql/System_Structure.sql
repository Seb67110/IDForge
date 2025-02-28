-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: System
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AdminRole`
--

DROP TABLE IF EXISTS `AdminRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdminRole` (
  `id` varchar(36) NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AdminRoleUser`
--

DROP TABLE IF EXISTS `AdminRoleUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AdminRoleUser` (
  `role_id` varchar(36) NOT NULL,
  `user` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`,`user`),
  CONSTRAINT `fk_AdminRoleUser_AdminRole` FOREIGN KEY (`role_id`) REFERENCES `AdminRole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Field`
--

DROP TABLE IF EXISTS `Field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Field` (
  `id` int NOT NULL AUTO_INCREMENT,
  `form_id` int NOT NULL,
  `form_version` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `layout` json DEFAULT NULL,
  `texts` json DEFAULT NULL,
  `enumQuery` text,
  `listQuery` text,
  `readQuery` text,
  `writeQuery` text,
  PRIMARY KEY (`id`,`form_id`,`form_version`),
  KEY `fk_Field_FormVersion_idx` (`form_id`,`form_version`),
  CONSTRAINT `fk_Field_FormVersion` FOREIGN KEY (`form_id`, `form_version`) REFERENCES `FormVersion` (`form_id`, `version`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FieldDescription`
--

DROP TABLE IF EXISTS `FieldDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FieldDescription` (
  `field_id` int NOT NULL,
  `language` varchar(2) NOT NULL,
  `description` text,
  PRIMARY KEY (`field_id`,`language`),
  CONSTRAINT `fk_FieldDescription_Field` FOREIGN KEY (`field_id`) REFERENCES `Field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FieldName`
--

DROP TABLE IF EXISTS `FieldName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FieldName` (
  `field_id` int NOT NULL,
  `language` varchar(2) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`field_id`,`language`),
  CONSTRAINT `fk_FieldName_Field` FOREIGN KEY (`field_id`) REFERENCES `Field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Form`
--

DROP TABLE IF EXISTS `Form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Form` (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FormDescription`
--

DROP TABLE IF EXISTS `FormDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FormDescription` (
  `form_id` int NOT NULL,
  `form_version` int NOT NULL,
  `language` varchar(2) NOT NULL,
  `description` text,
  PRIMARY KEY (`form_id`,`form_version`,`language`),
  KEY `fk_FormDescription_Form_idx` (`form_id`,`form_version`),
  CONSTRAINT `fk_FormDescription_FormVersion` FOREIGN KEY (`form_id`, `form_version`) REFERENCES `FormVersion` (`form_id`, `version`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FormInfo`
--

DROP TABLE IF EXISTS `FormInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FormInfo` (
  `form_id` int NOT NULL,
  `form_version` int NOT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `UpdateRequired` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`form_id`,`form_version`),
  CONSTRAINT `fk_FormInfo_FormVersion` FOREIGN KEY (`form_id`, `form_version`) REFERENCES `FormVersion` (`form_id`, `version`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FormName`
--

DROP TABLE IF EXISTS `FormName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FormName` (
  `form_id` int NOT NULL,
  `form_version` int NOT NULL,
  `language` varchar(2) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`form_id`,`form_version`,`language`),
  CONSTRAINT `fk_FormName_FormVersion` FOREIGN KEY (`form_id`, `form_version`) REFERENCES `FormVersion` (`form_id`, `version`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FormVersion`
--

DROP TABLE IF EXISTS `FormVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FormVersion` (
  `form_id` int NOT NULL,
  `version` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `enumQuery` text NOT NULL,
  PRIMARY KEY (`form_id`,`version`),
  CONSTRAINT `fk_FormVersion_Form` FOREIGN KEY (`form_id`) REFERENCES `Form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ReplicationKey`
--

DROP TABLE IF EXISTS `ReplicationKey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReplicationKey` (
  `moduleGuid` varchar(36) NOT NULL,
  `class` varchar(16) NOT NULL,
  `internalId` int NOT NULL,
  `externalKey` varchar(255) NOT NULL,
  PRIMARY KEY (`moduleGuid`,`class`,`internalId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Session` (
  `user` int NOT NULL,
  `sessionHash` varchar(64) NOT NULL,
  `blurredUser` varchar(36) NOT NULL,
  `openedOn` timestamp NULL DEFAULT NULL,
  `lastUsedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user`,`sessionHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WorkTableDescription`
--

DROP TABLE IF EXISTS `WorkTableDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkTableDescription` (
  `wt_name` varchar(45) NOT NULL,
  `language` varchar(2) NOT NULL,
  `description` text,
  PRIMARY KEY (`wt_name`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WorkTableFieldDescription`
--

DROP TABLE IF EXISTS `WorkTableFieldDescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkTableFieldDescription` (
  `wt_name` varchar(45) NOT NULL,
  `wt_field` varchar(45) NOT NULL,
  `language` varchar(2) NOT NULL,
  `description` text,
  PRIMARY KEY (`wt_name`,`wt_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'System'
--
/*!50003 DROP PROCEDURE IF EXISTS `Field_EnumerateActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Field_EnumerateActive`(
    IN p_formId INT  -- Form ID to filter the fields
)
BEGIN
    -- Fetch the IDs of all fields for the given form_id and its latest form_version
    SELECT 
        Field.id,
        Field.enumQuery
    FROM 
        Field
    WHERE 
        Field.form_id = p_formId
        AND Field.form_version = (
            -- Get the maximum form_version for the given form_id
            SELECT MAX(form_version)
            FROM Field
            WHERE form_id = p_formId
        );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Field_GetDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Field_GetDetails`(
    IN p_fieldId INT,         -- Field ID to retrieve details for
    IN p_language VARCHAR(2)  -- Language parameter for name and description
)
BEGIN
    -- Fetch field details, including name and description in the desired language or fallback to 'en'
    SELECT 
        Field.active,
        Field.layout,
        Field.listQuery,
        Field.readQuery,
        Field.writeQuery,
        FieldName.name AS name,
        FieldDescription.description AS description
    FROM 
        Field
    -- Join FieldName with priority to the input language
    LEFT JOIN FieldName 
        ON Field.id = FieldName.field_id AND FieldName.language = p_language
    -- Fallback join for names in 'en'
    LEFT JOIN FieldName FieldNameFallback
        ON Field.id = FieldNameFallback.field_id AND FieldNameFallback.language = 'en'
    -- Join FieldDescription with priority to the input language
    LEFT JOIN FieldDescription
        ON Field.id = FieldDescription.field_id AND FieldDescription.language = p_language
    -- Fallback join for descriptions in 'en'
    LEFT JOIN FieldDescription FieldDescriptionFallback
        ON Field.id = FieldDescriptionFallback.field_id AND FieldDescriptionFallback.language = 'en'
    WHERE 
        Field.id = p_fieldId; -- Filter by the given field_id
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Field_GetTexts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Field_GetTexts`(
    IN p_fieldId INT,          -- ID of the field to query
    IN p_language VARCHAR(10), -- Target language
    IN p_filter VARCHAR(255)   -- Filter to select specific keys or nodes (e.g., "error" or "error/badformat")
)
BEGIN
    DECLARE fallback JSON;
    DECLARE target JSON;
    DECLARE result JSON;

    -- Variables for key processing
    DECLARE node_path VARCHAR(255);
    DECLARE key_name VARCHAR(255);

    -- Retrieve the fallback and target JSON branches
    SELECT JSON_EXTRACT(texts, '$.en') INTO fallback
    FROM `Field`
    WHERE id = p_fieldId;

    SELECT JSON_EXTRACT(texts, CONCAT('$.', p_language)) INTO target
    FROM `Field`
    WHERE id = p_fieldId;

    -- Handle missing branches
    IF fallback IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fallback branch not found.';
    END IF;

    IF target IS NULL THEN
        SET target = '{}';
    END IF;

    -- Initialize result as an empty JSON object
    SET result = '{}';

    -- Handle case where no filter is provided
    IF p_filter IS NULL OR p_filter = '' THEN
        -- Return the merged fallback and target branches
        SET result = JSON_MERGE_PATCH(fallback, target);
    ELSE
        -- Determine if filter refers to a node or a specific key
        IF LOCATE('/', p_filter) = 0 THEN
            -- Node case: Extract the entire branch
            SET result = JSON_OBJECT(
                p_filter,
                JSON_MERGE_PATCH(
                    JSON_EXTRACT(fallback, CONCAT('$."', p_filter, '"')),
                    JSON_EXTRACT(target, CONCAT('$."', p_filter, '"'))
                )
            );
        ELSE
            -- Key case: Extract specific key from node
            SET node_path = LEFT(p_filter, LOCATE('/', p_filter) - 1);
            SET key_name = SUBSTRING_INDEX(p_filter, '/', -1);

            -- Always return as JSON, even for a single key
            SET result = JSON_OBJECT(
                node_path,
                JSON_OBJECT(
                    key_name,
                    COALESCE(
                        JSON_EXTRACT(target, CONCAT('$."', node_path, '."', key_name, '"')),
                        JSON_EXTRACT(fallback, CONCAT('$."', node_path, '."', key_name, '"'))
                    )
                )
            );
        END IF;
    END IF;

    -- Return the final JSON result encapsulated in a root object
    SELECT result AS Texts;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Form_Activate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Form_Activate`(IN p_formId INT)
BEGIN
    DECLARE v_new_version INT;
    DECLARE v_last_version INT;

    -- Step 1: Retrieve the highest active version for the form
    SELECT IFNULL(MAX(version), -1) INTO v_last_version
    FROM FormVersion
    WHERE form_id = p_formId;

    -- Step 2: Compute the new version number
    SET v_new_version = v_last_version + 1;

    -- Step 3: Promote version 0 to the new active version
    UPDATE FormVersion
    SET version = v_new_version, active = 1
    WHERE form_id = p_formId AND version = 0;

    -- Step 4: Update related tables to reflect the new version
    -- Automatically handled by ON UPDATE CASCADE in foreign keys

    -- Step 5: Deactivate all other active versions
    UPDATE FormVersion
    SET active = 0
    WHERE form_id = p_formId AND version <> v_new_version;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Form_Create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Form_Create`(
    IN p_enumQuery TEXT,
    IN p_name VARCHAR(255),
    IN p_description TEXT,
    IN p_info JSON
)
BEGIN
    DECLARE v_form_id INT;
    DECLARE v_column_name VARCHAR(255);
    DECLARE v_value TEXT;
    DECLARE done INT DEFAULT 0;

    -- Cursor to iterate over JSON keys and values
    DECLARE cur CURSOR FOR 
    SELECT COLUMN_NAME, JSON_UNQUOTE(JSON_EXTRACT(p_info, CONCAT('$.', COLUMN_NAME)))
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'FormInfo' AND COLUMN_NAME NOT IN ('form_id', 'form_version');

    -- Exit handler to close the cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Insert into Form (main form creation)
    INSERT INTO Form() VALUES ();
    SET v_form_id = LAST_INSERT_ID();  -- Get the newly created form ID

    -- Insert into FormVersion (version 0, inactive by default)
    INSERT INTO FormVersion (form_id, version, active, enumQuery)
    VALUES (v_form_id, 0, 0, p_enumQuery);

    -- Insert into FormName (default language 'en')
    INSERT INTO FormName (form_id, form_version, language, name)
    VALUES (v_form_id, 0, 'en', p_name);

    -- Insert into FormDescription (default language 'en')
    INSERT INTO FormDescription (form_id, form_version, language, description)
    VALUES (v_form_id, 0, 'en', p_description);

    -- Open the cursor for JSON iteration
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_column_name, v_value;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Assign local value to a user-defined variable for dynamic query execution
        SET @v_value = v_value;

        -- Prepare and execute dynamic SQL for inserting key-value pairs
        SET @sql = CONCAT(
            'INSERT INTO FormInfo (form_id, form_version, ', v_column_name, ') ',
            'VALUES (', v_form_id, ', 0, ?) ',
            'ON DUPLICATE KEY UPDATE ', v_column_name, ' = VALUES(', v_column_name, ')'
        );

        PREPARE stmt FROM @sql;
        EXECUTE stmt USING @v_value;
        DEALLOCATE PREPARE stmt;

    END LOOP;

    -- Close the cursor
    CLOSE cur;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Form_Enumerate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Form_Enumerate`(IN p_language VARCHAR(10))
BEGIN
    -- Return the list of forms with name and description in the specified language or fallback to 'en'
    SELECT 
        f.id AS id,
        fv.version,
        COALESCE(fn.name, fne.name) AS name,
        COALESCE(fd.description, fde.description) AS description,
        fv.enumQuery
    FROM 
        Form f
    INNER JOIN 
        FormVersion fv ON f.id = fv.form_id
    LEFT JOIN 
        FormName fn ON f.id = fn.form_id AND fv.version = fn.form_version AND fn.language = p_language
    LEFT JOIN 
        FormName fne ON f.id = fne.form_id AND fv.version = fne.form_version AND fne.language = 'en'
    LEFT JOIN 
        FormDescription fd ON f.id = fd.form_id AND fv.version = fd.form_version AND fd.language = p_language
    LEFT JOIN 
        FormDescription fde ON f.id = fde.form_id AND fv.version = fde.form_version AND fde.language = 'en'
    WHERE 
        fv.version = (SELECT MAX(version) FROM FormVersion WHERE form_id = f.id)
        AND fv.active = 1; -- Ensure only the active version is considered
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Form_GetDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sebastien.schnepp`@`%` PROCEDURE `Form_GetDetails`(IN p_formId INT, IN p_formVersion INT)
BEGIN
    DECLARE v_columns TEXT;
    DECLARE v_sql TEXT;

    -- Step 1: Dynamically retrieve all column names except primary keys
    SELECT GROUP_CONCAT(COLUMN_NAME)
    INTO v_columns
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = 'FormInfo'
      AND COLUMN_NAME NOT IN ('form_id', 'form_version');

    -- Step 2: Check if columns were found
    IF v_columns IS NULL OR v_columns = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No columns available to select from FormInfo.';
    END IF;

    -- Step 3: Construct the dynamic SQL to select the desired fields
    SET @v_sql = CONCAT(
        'SELECT ', v_columns, ' ',
        'FROM FormInfo ',
        'WHERE form_id = ', p_formId, ' AND form_version = ', p_formVersion
    );

    -- Step 4: Prepare and execute the dynamic SQL
    PREPARE stmt FROM @v_sql; -- Using local variable v_sql
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-28 23:05:31
