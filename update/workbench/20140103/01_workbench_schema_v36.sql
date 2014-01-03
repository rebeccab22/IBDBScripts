-- Script generated by MySQL Compare 1.0.0.425 on 1/2/2014 11:55:12 AM

SET @ORIGINAL_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @ORIGINAL_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @ORIGINAL_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES,NO_AUTO_VALUE_ON_ZERO,NO_AUTO_CREATE_USER';

USE `workbench`;

CREATE TABLE `workbench`.`workbench_sidebar_category` (
  `sidebar_category_id` int(11) NOT NULL auto_increment,
  `sidebar_category_name` varchar(255) NOT NULL,
  `sidebar_category_label` varchar(255) NULL,
  PRIMARY KEY (`sidebar_category_id`)
) ENGINE=InnoDB;

ALTER TABLE `workbench`.`workbench_tool`
  MODIFY COLUMN `tool_type` enum('WEB','WEB_WITH_LOGIN','NATIVE','WORKBENCH','ADMIN') NULL;

ALTER TABLE workbench.workbench_tool
ADD COLUMN group_name VARCHAR(128) AFTER name
;

CREATE TABLE `workbench`.`workbench_sidebar_category_link` (
  `sidebar_category_link_id` int(11) NOT NULL auto_increment,
  `tool_name` varchar(128) NOT NULL,
  `sidebar_category_id` int(11) NOT NULL,
  `sidebar_link_name` varchar(255) NULL,
  `sidebar_link_title` varchar(255) NULL,
  PRIMARY KEY (`sidebar_category_link_id`),
  FOREIGN KEY (`tool_name`) REFERENCES `workbench`.`workbench_tool` (`name`) ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (`sidebar_category_id`) REFERENCES `workbench`.`workbench_sidebar_category` (`sidebar_category_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  KEY `sidebar_category_id_idx`(`sidebar_category_id`),
  KEY `tool_name`(`tool_name`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS=@ORIGINAL_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@ORIGINAL_UNIQUE_CHECKS;
SET SQL_MODE=@ORIGINAL_SQL_MODE;
