SET @ORIGINAL_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @ORIGINAL_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @ORIGINAL_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES,NO_AUTO_VALUE_ON_ZERO,NO_AUTO_CREATE_USER';



ALTER TABLE listnms ENGINE = MYISAM;






DROP TABLE IF EXISTS `listdataprops`;


CREATE TABLE `listdataprops` (
 
	`listdataprop_id` int(11) NOT NULL auto_increment,
  
	`listdata_id` int(11) NOT NULL DEFAULT '0',
  
	`column_name` varchar(50) NOT NULL DEFAULT '-',
  
	`value` varchar(255) NULL,
  
	PRIMARY KEY (`listdataprop_id`)

) ENGINE=MyISAM;



-- ----------------------



ALTER TABLE `listnms`
  
ADD COLUMN `notes` text NULL;


-- ----------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS `create_index_if_not_exists`$$

CREATE DEFINER=CURRENT_USER  PROCEDURE `create_index_if_not_exists`(table_name_vc varchar(50), index_name_vc varchar(50), field_list_vc varchar(200))
SQL SECURITY INVOKER
BEGIN

set @Index_cnt = (
select	count(1) cnt
FROM	INFORMATION_SCHEMA.STATISTICS
WHERE	table_name = table_name_vc
and	index_name = index_name_vc
);

IF ifnull(@Index_cnt,0) = 0 THEN set @index_sql = concat('Alter table ',table_name_vc,' ADD INDEX ',index_name_vc,'(',field_list_vc,');');

PREPARE stmt FROM @index_sql;
EXECUTE stmt;

DEALLOCATE PREPARE stmt;

END IF;

END$$
DELIMITER ;

-- ----------------------


DELIMITER $$
DROP PROCEDURE IF EXISTS `create_fulltext_index_if_not_exists`$$

CREATE DEFINER=`user`@`%` PROCEDURE `create_fulltext_index_if_not_exists`(table_name_vc varchar(50), index_name_vc varchar(50), field_list_vc varchar(200))
SQL SECURITY INVOKER
BEGIN

set @Index_cnt = (
select	count(1) cnt
FROM	INFORMATION_SCHEMA.STATISTICS
WHERE	table_name = table_name_vc
and	index_name = index_name_vc
);

IF ifnull(@Index_cnt,0) = 0 THEN set @index_sql = concat('Alter table ',table_name_vc,' ADD FULLTEXT INDEX ',index_name_vc,'(',field_list_vc,');');

PREPARE stmt FROM @index_sql;
EXECUTE stmt;

DEALLOCATE PREPARE stmt;

END IF;

END$$
DELIMITER ;
-- ----------------------
-- -- CREATE INDEX `index_desig` ON `listdata`(`desig`);
-- -- CREATE INDEX `index_listname` ON `listnms`(`listname`);
-- -- CREATE INDEX `index_liststatus` ON `listnms`(`liststatus`);


-- -- CREATE FULLTEXT INDEX  `listname` ON `listnms`(`listname`);


-- -- CREATE FULLTEXT INDEX  `listname_2` ON `listnms`(`listname`);



call create_index_if_not_exists('listdata', 'index_desig', 'desig');
call create_index_if_not_exists('listnms', 'index_listname', 'listname');
call create_index_if_not_exists('listnms', 'index_listname', 'liststatus');
call create_fulltext_index_if_not_exists('listnms', 'listname', 'listname');
call create_fulltext_index_if_not_exists('listnms', 'listname_2', 'listname');

drop procedure create_index_if_not_exists;
drop procedure create_fulltext_index_if_not_exists;

SET FOREIGN_KEY_CHECKS=@ORIGINAL_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@ORIGINAL_UNIQUE_CHECKS;

SET SQL_MODE=@ORIGINAL_SQL_MODE;
