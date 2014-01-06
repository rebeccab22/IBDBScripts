-- Script generated by MySQL Compare 1.0.0.425 on 1/2/2014 11:55:12 AM


SET @ORIGINAL_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @ORIGINAL_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @ORIGINAL_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES,NO_AUTO_VALUE_ON_ZERO,NO_AUTO_CREATE_USER';



USE `workbench`;



DROP TABLE IF EXISTS
 workbench_sidebar_category;

CREATE TABLE  `workbench`.`workbench_sidebar_category` (
  
	`sidebar_category_id` int(11) NOT NULL auto_increment,
  
	`sidebar_category_name` varchar(255) NOT NULL,
  
	`sidebar_category_label` varchar(255) NULL,
  
PRIMARY KEY (`sidebar_category_id`)

) ENGINE=InnoDB;



ALTER TABLE `workbench`.`workbench_tool`
  
MODIFY COLUMN `tool_type` enum('WEB','WEB_WITH_LOGIN','NATIVE','WORKBENCH','ADMIN') NULL;

-- ----------------------------



DROP PROCEDURE IF EXISTS alter_workbench_tool_add_group_name;

DELIMITER $$


CREATE DEFINER=CURRENT_USER PROCEDURE alter_workbench_tool_add_group_name ( ) 

BEGIN

SELECT IFNULL(column_name, '') INTO @colName

FROM information_schema.columns 

WHERE table_name = 'workbench_tool'
 AND column_name = 'group_name';

IF @colName = '' THEN 
	
	ALTER IGNORE TABLE workbench.workbench_tool
	
	ADD COLUMN group_name VARCHAR(128) AFTER name;

	END IF;


END$$


DELIMITER ;



CALL alter_workbench_tool_add_group_name;


DROP PROCEDURE alter_workbench_tool_add_group_name;

-- ----------------------------




DROP TABLE IF EXISTS workbench_sidebar_category_link;
CREATE TABLE workbench_sidebar_category_link (

    sidebar_category_link_id        INT(11) NOT NULL AUTO_INCREMENT,

    tool_name                       VARCHAR(128) NOT NULL,

    sidebar_category_id             INT(11) NOT NULL,

    sidebar_link_name               VARCHAR(255) DEFAULT NULL,

    sidebar_link_title              VARCHAR(255) DEFAULT NULL,

    PRIMARY KEY (sidebar_category_link_id),

    KEY sidebar_category_id_idx (sidebar_category_id),

    KEY tool_name (tool_name),

    CONSTRAINT sidebar_category_id FOREIGN KEY (sidebar_category_id) REFERENCES workbench_sidebar_category (sidebar_category_id) ON DELETE CASCADE ON UPDATE NO ACTION,

    CONSTRAINT fk_tool_name FOREIGN KEY (tool_name) REFERENCES workbench_tool (name) ON DELETE CASCADE ON UPDATE NO ACTION

) ENGINE=InnoDB DEFAULT CHARSET=utf8;





ALTER TABLE workbench_crop
ADD COLUMN schema_version VARCHAR(32);

ALTER TABLE workbench_project
ADD COLUMN local_schema_version VARCHAR(32);


SET FOREIGN_KEY_CHECKS=@ORIGINAL_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@ORIGINAL_UNIQUE_CHECKS;
SET SQL_MODE=@ORIGINAL_SQL_MODE;
