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
 
ALTER TABLE listnms ENGINE = MYISAM;

ALTER TABLE listnms ADD FULLTEXT INDEX(listname);

-- CREATE INDEX index_liststatus ON listnms(liststatus);

-- CREATE INDEX index_listname ON listnms(listname);

-- CREATE INDEX index_desig ON listdata(desig);

CALL create_index_if_not_exists('index_list_status','listnms','liststatus');

CALL create_index_if_not_exists('index_listname','listnms','listname');

CALL create_index_if_not_exists('index_desig','listdata','desig');