DELIMITER $$

DROP PROCEDURE IF EXISTS drop_fk_if_exists $$
CREATE PROCEDURE drop_fk_if_exists(in theTable varchar(128), in theForeignKey varchar(128) )
BEGIN

 IF((SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS 
    WHERE information_schema.TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'FOREIGN KEY' 
    AND information_schema.TABLE_CONSTRAINTS.TABLE_SCHEMA = DATABASE()
    AND information_schema.TABLE_CONSTRAINTS.TABLE_NAME = theTable
    AND information_schema.TABLE_CONSTRAINTS.CONSTRAINT_NAME = theForeignKey) > 0) THEN
   SET @s = CONCAT('ALTER TABLE ' , theTable , ' DROP FOREIGN KEY ' , theForeignKey);
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END $$

DELIMITER ;