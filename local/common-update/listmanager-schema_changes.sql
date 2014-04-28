DELIMITER $$

DROP PROCEDURE IF EXISTS add_column_if_not_exists $$
CREATE PROCEDURE add_column_if_not_exists(in theTable varchar(128), in theColumn varchar(128),in theColumnType )
BEGIN

 IF(( SELECT COUNT(*) 
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE()
    	AND   TABLE_NAME = theTable 
        AND   COLUMN_NAME = theColumn) = 0) THEN
   SET @s = CONCAT('ALTER TABLE ' , theTable , ' ADD COLUMN(`' , theForeignKey,'` ',theColumnType, ')');
   PREPARE stmt FROM @s;
   EXECUTE stmt;
 END IF;
END $$

DELIMITER ;

DROP TABLE IF EXISTS `listdataprops`;

CREATE TABLE `listdataprops` ( 
  `listdataprop_id` int(11) NOT NULL AUTO_INCREMENT, 
  `listdata_id` int(11) NOT NULL DEFAULT '0', 
  `column_name` varchar(50) NOT NULL DEFAULT '-', 
  `value` varchar(255), 
  PRIMARY KEY (`listdataprop_id`) 
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ALTER TABLE `listnms` ADD COLUMN(
--   `notes` TEXT
-- );

CALL add_column_if_not_exists('listnms','notes','TEXT');