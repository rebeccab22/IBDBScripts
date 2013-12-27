START TRANSACTION;

UPDATE schema_version SET
    version = '20131227'
;

ALTER TABLE workbench.workbench_tool
ADD COLUMN group_name VARCHAR(128) AFTER name
;

COMMIT;
