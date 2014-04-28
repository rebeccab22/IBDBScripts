DELIMITER $$
 
DROP PROCEDURE IF EXISTS create_index_if_not_exists $$
CREATE PROCEDURE create_index_if_not_exists(in theIndexName varchar(128), in theTable varchar(128), in theColumnName varchar(128) )
BEGIN
 IF((SELECT COUNT(*) AS index_exists FROM information_schema.statistics WHERE TABLE_SCHEMA = DATABASE() and table_name =
theTable AND index_name = theIndexName) = 0) THEN
   SET @s = CONCAT('CREATE INDEX ' , theIndexName , ' ON ' , theTable, ' (', theColumnname,')');
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END $$
 
DELIMITER ;