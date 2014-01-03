SET @ORIGINAL_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @ORIGINAL_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @ORIGINAL_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES,NO_AUTO_VALUE_ON_ZERO,NO_AUTO_CREATE_USER';

-- -- ALTER TABLE `cvtermprop` DROP FOREIGN KEY IF EXISTS `cvtermprop_ibfk_1`;


-- -- ALTER TABLE `cvtermsynonym` DROP FOREIGN KEY IF EXISTS `cvtermsynonym_fk1`;
-- ----------------------------


DROP PROCEDURE IF EXISTS drop_foreign_key;

DELIMITER $$

CREATE DEFINER=CURRENT_USER  PROCEDURE drop_foreign_key(table_name_vc varchar(50), foreign_key_name varchar(50))
BEGIN

SELECT IFNULL(constraint_name, '') INTO @fkName

FROM information_schema.table_constraints

WHERE table_name = table_name_vc AND constraint_type = 'FOREIGN KEY'
		
	AND constraint_name = foreign_key_name
	AND table_schema like '%local%'

LIMIT 1;

IF @colName = '' THEN 
	
	set @index_sql = concat('ALTER TABLE ',table_name_vc,' DROP FOREIGN KEY ', foreign_key_name);


	PREPARE stmt FROM @index_sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END IF;


END$$



DELIMITER ;
-- ----------------------------


CALL drop_foreign_key('cvtermprop', 'cvtermprop_ibfk_1');


CALL drop_foreign_key('cvtermsynonym', 'cvtermsynonym_fk1');


DROP PROCEDURE drop_foreign_key;




SET FOREIGN_KEY_CHECKS=@ORIGINAL_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@ORIGINAL_UNIQUE_CHECKS;

SET SQL_MODE=@ORIGINAL_SQL_MODE;
