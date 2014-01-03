START TRANSACTION;

UPDATE schema_version SET
    version = '20131202'
;

ALTER TABLE `workbench`.`workbench_tool` 
CHANGE COLUMN `tool_type` `tool_type` ENUM('WEB','WEB_WITH_LOGIN','NATIVE','WORKBENCH','ADMIN') NULL DEFAULT NULL ;

UPDATE workbench_role SET
    role_label = 'Conventional Breeding (CB)'
WHERE
    name = 'CB Breeder'
;

UPDATE workbench_role SET
    role_label = 'Breeding with Marker Assisted Selection (MAS)'
WHERE
    name = 'MAS Breeder'
;

UPDATE workbench_role SET
    role_label = 'Marker Assisted Backcrossing (MABC)'
WHERE
    name = 'MABC Breeder'
;

UPDATE workbench_role SET
    role_label = 'Marker Assisted Recurrent Selection (MARS)'
WHERE
    name = 'MARS Breeder'
;

COMMIT;
