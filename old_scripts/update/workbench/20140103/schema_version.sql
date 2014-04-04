ALTER TABLE workbench_crop
ADD COLUMN schema_version VARCHAR(32) AFTER central_db_name;

ALTER TABLE workbench_project
ADD COLUMN local_schema_version VARCHAR(32) AFTER last_open_date;

UPDATE workbench_crop
SET schema_version = '20140103';

UPDATE workbench_project
SET local_schema_version = '20140103';