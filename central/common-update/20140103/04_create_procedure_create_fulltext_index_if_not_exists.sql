DELIMITER $$
 
DROP PROCEDURE IF EXISTS create_fulltext_index_if_not_exists $$
CREATE PROCEDURE create_fulltext_index_if_not_exists(
     IN theIndexName        VARCHAR(128)
    ,IN theTable            VARCHAR(128)
    ,IN theColumnName       VARCHAR(128)
)
BEGIN

    IF((SELECT COUNT(*) AS index_exists FROM information_schema.statistics WHERE TABLE_SCHEMA = DATABASE() and table_name = theTable AND index_name = theIndexName AND index_type = 'FULLTEXT') = 0) THEN
        SET @s = CONCAT('CREATE FULLTEXT INDEX ' , theIndexName , ' ON ' , theTable, ' (', theColumnname,')');
        PREPARE stmt FROM @s;
        EXECUTE stmt;
    END IF;
END $$
 
DELIMITER ;