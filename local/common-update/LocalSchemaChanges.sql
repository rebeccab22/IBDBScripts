-- execute in LOCAL database ONLY

-- alter table cvtermprop drop foreign key cvtermprop_ibfk_1;
-- alter table cvtermsynonym drop foreign key cvtermsynonym_fk1; 

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

CALL drop_fk_if_exists('cvtermprop','cvtermprop_ibfk_1');
CALL drop_fk_if_exists('cvtermsynonym','cvtermsynonym_fk1');