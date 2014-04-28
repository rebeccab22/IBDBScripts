DELIMITER $$
 
DROP PROCEDURE IF EXISTS add_column_if_not_exists $$
CREATE PROCEDURE add_column_if_not_exists(
     IN theTable            VARCHAR(128)
    ,IN theColumnName       VARCHAR(128)
    ,IN theColumnType       VARCHAR(128)
)
BEGIN
    IF((SELECT COUNT(*) AS column_exists FROM information_schema.columns WHERE TABLE_SCHEMA = DATABASE() and table_name = theTable AND column_name = theColumnName) = 0) THEN
        SET @s = CONCAT('ALTER TABLE ', theTable, ' ADD COLUMN( ', theColumnName, ' ', theColumnType, ')');
        PREPARE stmt FROM @s;
        EXECUTE stmt;
    END IF;
END $$
 
DELIMITER ;