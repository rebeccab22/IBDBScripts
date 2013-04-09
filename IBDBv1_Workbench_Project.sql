DROP TABLE IF EXISTS
workbench_project_workflow_step
,workbench_project
,workbench_workflow_step_tool
,workbench_workflow_template_step
,workbench_tool_transform
,workbench_tool_output
,workbench_tool_input
,workbench_tool
,workbench_workflow_step
,workbench_workflow_template
,workbench_dataset
;

-- 
-- workbench crops
--

DROP TABLE IF EXISTS workbench_crop;
CREATE TABLE IF NOT EXISTS workbench_crop(
     crop_name VARCHAR(32) NOT NULL
    ,central_db_name VARCHAR(64)
    ,PRIMARY KEY(crop_name)
) ENGINE=InnoDB;

-- initial values for crops. REPLEACE WITH YOUR CENTRAL DB NAMES
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Cassava', 'ibdb_cassava_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Chickpea', 'ibdb_chickpea_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Cowpea', 'ibdb_cowpea_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Maize', 'ibdb_maize_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Rice', 'ibdb_rice_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Wheat', 'ibdb_wheat_central');


-- 
--  A template of a Workflow.
--  
--  To represent a workflow (such as MARS) in the DB,
--  we will be adding records on the following tables:
--       workflow_template
--       workflow_step
--       tool
--       tool_input
--       tool_output
--       tool_transform
--       workflow_template_step
--       workflow_step_tool
--  
--  When creating a new project, the user selects a workflow template,
--  and we "clone" the template's steps by adding entries to:
--       project_workflow_step
--  from the
--       workflow_template_step
--  table.
--  This table is actually a clone of "workflow_template_step" table.
-- 
CREATE TABLE workbench_workflow_template (
     template_id            INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(255) NOT NULL
    ,user_defined           BOOL NOT NULL DEFAULT FALSE
    ,PRIMARY KEY(template_id)
)
ENGINE=InnoDB;

-- 
--  A "Step" in a workflow.
-- 
CREATE TABLE workbench_workflow_step (
     step_id                INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(64) NOT NULL
    ,title                  VARCHAR(255) NOT NULL
    ,PRIMARY KEY(step_id)
    ,UNIQUE(name)
)
ENGINE=InnoDB;

-- 
--  Tools such as "Germplasm Browser" and "Field Book"
--  will be registered here.
--  
--  TODO:
--  - Maybe we need to record information about the tool's input/output.
--    For example, do we need to pass a file? or a named parameter?
-- 
CREATE TABLE workbench_tool (
     tool_id                INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(128) NOT NULL
    ,title                  VARCHAR(255) NOT NULL
    ,version                VARCHAR(16) NOT NULL
    ,tool_type              ENUM('WEB', 'WEB_WITH_LOGIN', 'NATIVE')
    ,path                   TEXT
    ,PRIMARY KEY(tool_id)
    ,UNIQUE(name)
)
ENGINE=InnoDB;

-- 
--  A list of named "input" of a tool.
--  "input_label" is the parameter name we could use as labels in screens.
--  "input_name" is the official paramter name (for web or commandline tools).
-- 
CREATE TABLE workbench_tool_input (
     tool_input_id          INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,tool_id                INT UNSIGNED NOT NULL
    ,input_label            VARCHAR(255)
    ,input_name             VARCHAR(128)
    ,input_type             ENUM('NUMBER', 'TEXT', 'DATE', 'FILE')
    ,PRIMARY KEY(tool_input_id)
    ,CONSTRAINT fk_tool_input_1 FOREIGN KEY(tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE workbench_tool_output (
     tool_output_id         INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,tool_id                INT UNSIGNED NOT NULL
    ,output_label           VARCHAR(255)
    ,output_name            VARCHAR(128)
    ,output_type            ENUM('NUMBER', 'TEXT', 'DATE', 'FILE')
    ,PRIMARY KEY(tool_output_id)
    ,CONSTRAINT fk_tool_output_1 FOREIGN KEY(tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- 
--  A "Tool Transform" represents an implementation that could
--  transform an "output" of a certain tool to an "input" of another tool.
-- 
CREATE TABLE workbench_tool_transform (
     tool_transform_id              INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,input_tool_id                  INT UNSIGNED NOT NULL
    ,output_tool_id                 INT UNSIGNED NOT NULL
    ,transform_label                VARCHAR(255) NOT NULL
    ,transform_name                 VARCHAR(255) NOT NULL
    ,PRIMARY KEY(tool_transform_id)
    ,UNIQUE(transform_label)
    ,UNIQUE(transform_name)
    ,CONSTRAINT fk_tool_transform_1 FOREIGN KEY(input_tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_tool_transform_2 FOREIGN KEY(output_tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- 
--  The steps associated with a Workflow Template.
--  
--  NOTE: If we are going to save the "prev/next step" of a "step",
--  it might be hard to support the UI mockup provided by douglas.
--  See Note 20120330_workflow_steps
-- 
CREATE TABLE workbench_workflow_template_step (
     workflow_template_step_id          INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,template_id                        INT UNSIGNED NOT NULL
    ,step_number                        VARCHAR(16)
    ,step_id                            INT UNSIGNED NOT NULL
    ,PRIMARY KEY(workflow_template_step_id)
    ,UNIQUE(template_id, step_number)
    ,CONSTRAINT fk_workflow_template_step_1 FOREIGN KEY(template_id) REFERENCES workbench_workflow_template(template_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_workflow_template_step_2 FOREIGN KEY(step_id) REFERENCES workbench_workflow_step(step_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- 
--  The tools associated with a Workflow Step.
--  
--  "tool_number" is added so we can set a tool order.
-- 
CREATE TABLE workbench_workflow_step_tool (
     workflow_step_tool_id              INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,template_id                        INT UNSIGNED NOT NULL
    ,step_id                            INT UNSIGNED NOT NULL
    ,tool_number                        INT UNSIGNED NOT NULL
    ,tool_id                            INT UNSIGNED NOT NULL
    ,PRIMARY KEY(workflow_step_tool_id)
    ,UNIQUE(template_id, step_id, tool_id)
    ,CONSTRAINT fk_workflow_step_tool_1 FOREIGN KEY(template_id) REFERENCES workbench_workflow_template(template_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_workflow_step_tool_2 FOREIGN KEY(step_id) REFERENCES workbench_workflow_step(step_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_workflow_step_tool_3 FOREIGN KEY(tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

--  NOTE:
--  - maybe we need to record the tools related to an activity?
--  TODO:
--  - confirm whether an activity is a breakdown of a workflow step
--  - can users register their own "activity/task"?
-- 
-- 
-- CREATE TABLE activity (
--      activity_id            INT UNSIGNED AUTO_INCREMENT NOT NULL
--     ,name                   VARCHAR(255) NOT NULL
--     ,PRIMARY KEY(activity_id)
-- )
-- ENGINE=InnoDB;
-- 

-- 
-- CREATE TABLE contact (
--      contact_id             INT UNSIGNED
--     ,title                  VARCHAR(32)
--     ,first_name             VARCHAR(255) NOT NULL
--     ,last_name              VARCHAR(255) NOT NULL
--     ,email                  VARCHAR(255)
--     ,phone_number           VARCHAR(32)
--     ,institution            VARCHAR(255)
--     ,address_1              VARCHAR(255)
--     ,address_2              VARCHAR(255)
--     ,skype_id               VARCHAR(64)
--     ,notes                  TEXT
--     ,picture                BLOB
--     ,PRIMARY KEY(contact_id)
-- )
-- ENGINE=InnoDB;
-- 

--
-- table structure for table 'users'
--
DROP TABLE IF EXISTS users; 
CREATE TABLE users (
  userid INT NOT NULL DEFAULT 0,
  instalid INT NOT NULL DEFAULT 0,
  ustatus INT NOT NULL DEFAULT 0,
  uaccess INT NOT NULL DEFAULT 0,
  utype INT NOT NULL DEFAULT 0,
  uname VARCHAR(30) NOT NULL DEFAULT '-',
  upswd VARCHAR(30) NOT NULL DEFAULT '-',
  personid INT NOT NULL DEFAULT 0,
  adate INT NOT NULL DEFAULT 0,
  cdate INT NOT NULL DEFAULT 0,
  PRIMARY KEY (userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
--  A project uses an instance of a "Workflow Template".
--  A project has one and only one workflow, which could be modified
--  later even after a project has made progress.
--  
--  A project has an instance of a "Workflow Template" to ensure that
--  a project's workflow can be modified without affecting all other
--  projects that followed the same template.
--  
--  "template_id" is the ID of the Workflow being used by the project.
--  "template_modified" specifies whether modifications on the original
--  Workflow steps has been made.
--  
--  TODO:
--  - a project has a data set
--  CONFIRM:
--  - what are datasets?
-- 
CREATE TABLE workbench_project (
     project_id                 INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,user_id                    INT UNSIGNED NOT NULL
    ,project_name               VARCHAR(255) NOT NULL
    ,start_date                 DATE
    ,template_id                INT UNSIGNED NOT NULL
    ,template_modified          BOOL NOT NULL DEFAULT FALSE
    ,crop_type                  VARCHAR(32)
    ,local_db_name              VARCHAR(64)
    ,central_db_name            VARCHAR(64)
    ,last_open_date             TIMESTAMP NULL
    ,PRIMARY KEY(project_id)
    ,CONSTRAINT fk_project_1 FOREIGN KEY(template_id) REFERENCES workbench_workflow_template(template_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_project_2 FOREIGN KEY(crop_type) REFERENCES workbench_crop(crop_name) ON UPDATE CASCADE
    ,CONSTRAINT uk_project_name UNIQUE(project_name)
)
ENGINE=InnoDB;

-- 
--  A "step" in a Project Workflow represents an "activity".
--  It can be assigned to a user (Contact), have a Due Date and a Status.
-- 
CREATE TABLE workbench_project_workflow_step (
     project_workflow_step_id           INT UNSIGNED NOT NULL
    ,project_id                         INT UNSIGNED NOT NULL
    ,step_number                        VARCHAR(16) NOT NULL
    ,step_id                            INT UNSIGNED NOT NULL
    ,contact_id                         INT UNSIGNED
    ,due_date                           DATE
    ,status                             VARCHAR(255)
    ,PRIMARY KEY(project_workflow_step_id)
    ,UNIQUE(project_id, step_number)
    ,CONSTRAINT fk_project_workflow_step_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_project_workflow_step_2 FOREIGN KEY(step_id) REFERENCES workbench_workflow_step(step_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- 
--  CONFIRM:
--  - If we have a Workflow Step known to be associated with two tools, Tool A and Tool B,
--    can a project that has that Workflow Step declare that it will not use Tool B?
--    We might need to create a separate table if we support it (I hope we don't).
-- 

CREATE TABLE workbench_dataset (
     dataset_id             INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(128) NOT NULL
    ,description            TEXT
    ,creation_date          DATE
    ,project_id             INT UNSIGNED NOT NULL
    ,type                   ENUM('STUDY', 'GERMPLASM_LIST')
    ,PRIMARY KEY(dataset_id)
    ,CONSTRAINT fk_workbench_dataset_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- 
--  Add initial data.
-- 
INSERT INTO workbench_workflow_template (template_id, name, user_defined) VALUES
(1, 'MARS', FALSE);

INSERT INTO workbench_workflow_step (step_id, name, title) VALUES
 (1, 'project_planning', 'Project Planning')
,(2, 'population_management', 'Population Management')
,(3, 'field_trial_management', 'Field Trial Management')
,(4, 'genotyping', 'Genotyping')
,(5, 'phenotypic_analysis', 'Phenotypic Analysis')
,(6, 'qtl_analysis', 'QTL Analysis')
,(7, 'qtl_selection', 'QTL Selection')
,(8, 'recombination_cycle', 'Recombination Cycle')
,(9, 'final_breeding_decision', 'Final Breeding Decision')
;

INSERT INTO workbench_workflow_template_step (template_id, step_number, step_id) VALUES
(1, 1, 1)
,(1, 2, 2)
,(1, 3, 3)
,(1, 4, 4)
,(1, 5, 5)
,(1, 6, 6)
,(1, 7, 7)
,(1, 8, 8)
,(1, 9, 9)
;

-- Notes on paths:
-- WEB tools should use the release port.
-- NATIVE tools should use a path relative to IBWorkflowSystem installation directory.
INSERT INTO workbench_tool (name, title, version, tool_type, path) VALUES
 ('germplasm_browser', 'Browse Germplasm Information', '1.1.2.6', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/germplasm/')
,('study_browser', 'Browse Studies and Datasets', '1.1.2.6', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/study/')
,('germplasm_list_browser', 'Browse Germplasm Lists', '1.1.2.6', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/germplasmlist/')
,('gdms', 'GDMS', '1.0', 'WEB_WITH_LOGIN', 'http://localhost:18080/GDMS/login.do')
,('fieldbook', 'FieldBook', '3.0.0', 'NATIVE', 'tools/fieldbook/IBFb/bin/ibfb.exe')
,('optimas', 'OptiMAS', '1.4', 'NATIVE', 'tools/optimas/optimas_gui.exe')
,('breeding_manager', 'Breeding Manager', '3.0.0 Beta 40', 'NATIVE', 'tools/breeding_manager/IBFb/bin/ibfb.exe')
,('breeding_view', 'Breeding View', '1.1.0.9221', 'NATIVE', 'tools/breeding_view/Bin/BreedingView.exe')
,('mbdt','MBDT','1.0.0','NATIVE','tools/mbdt/MBDTversion1.0.0.exe')
;



--
-- table structure for table 'persons'
--
DROP TABLE IF EXISTS persons; 
CREATE TABLE persons (
  personid INT NOT NULL DEFAULT 0,
  fname VARCHAR(20) NOT NULL DEFAULT '-',
  lname VARCHAR(50) NOT NULL DEFAULT '-',
  ioname VARCHAR(15) NOT NULL DEFAULT '-',
  institid INT NOT NULL DEFAULT 0,
  ptitle VARCHAR(25) NOT NULL DEFAULT '-',
  poname VARCHAR(50) NOT NULL DEFAULT '-',
  plangu INT NOT NULL DEFAULT 0,
  pphone VARCHAR(20) NOT NULL DEFAULT '-',
  pextent VARCHAR(20) NOT NULL DEFAULT '-',
  pfax VARCHAR(20) NOT NULL DEFAULT '-',
  pemail VARCHAR(40) NOT NULL DEFAULT '-',
  prole INT NOT NULL DEFAULT 0,
  sperson INT NOT NULL DEFAULT 0,
  eperson INT NOT NULL DEFAULT 0,
  pstatus INT NOT NULL DEFAULT 0,
  pnotes VARCHAR(255) NOT NULL DEFAULT '-',
  contact VARCHAR(255) NOT NULL DEFAULT '-',
  PRIMARY KEY (personid) 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
CREATE INDEX persons_idx01 ON persons (institid);
CREATE INDEX persons_idx02 ON persons (personid);  

--
CREATE INDEX users_idx01 ON users (instalid);
CREATE INDEX users_idx02 ON users (personid);
CREATE INDEX users_idx03 on users (userid);    -- added 20091103 mhabito: define regular index on column(s) with UNIQUE KEY constraint
--

-- 
--  The breeding method/s associated to a workbench project
-- 
DROP TABLE IF EXISTS workbench_project_method;
CREATE TABLE workbench_project_method (
     project_method_id           INT UNSIGNED AUTO_INCREMENT NOT NULL 
    ,project_id                  INT UNSIGNED NOT NULL
    ,method_id                   INT(11) NOT NULL
    ,PRIMARY KEY(project_method_id)
    ,UNIQUE(project_id, method_id)
    ,CONSTRAINT fk_project_method_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;



--
-- The mapping of workbench users with corresponding ibdb local user.
--
DROP TABLE IF EXISTS workbench_ibdb_user_map;
CREATE TABLE workbench_ibdb_user_map (
     ibdb_user_map_id           INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,workbench_user_id          INT(11) NOT NULL
    ,project_id                 INT UNSIGNED NOT NULL
    ,ibdb_user_id               INT(11) NOT NULL
    ,PRIMARY KEY(ibdb_user_map_id)
)
ENGINE=InnoDB;

--
-- table for mapping workbench_project with location
--
DROP TABLE IF EXISTS workbench_project_loc_map;
CREATE TABLE workbench_project_loc_map (
     id                      INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,project_id              INT UNSIGNED NOT NULL
    ,location_id             INT(11) NOT NULL               
    ,PRIMARY KEY(id)
    ,CONSTRAINT fk_workbench_project_loc_map_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
) ENGINE=InnoDB;



DROP TABLE IF EXISTS workbench_project_activity; 
CREATE TABLE workbench_project_activity (
     project_activity_id	INT UNSIGNED AUTO_INCREMENT NOT NULL 
    ,project_id				INT UNSIGNED NOT NULL
    ,name					VARCHAR(128) NOT NULL
    ,description			TEXT
    ,user_id				INT(11) NOT NULL
    ,date			DATE
    ,PRIMARY KEY(project_activity_id)
    ,CONSTRAINT fk_project_activity_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_project_activity_2 FOREIGN KEY(user_id) REFERENCES users(userid) ON UPDATE CASCADE
)
ENGINE=InnoDB;


-- 
-- Conventional Breeding Data into workflow tables
-- 

-- Insert Conventional Breeding (CB) into workbench_workflow_template

INSERT IGNORE INTO workbench_workflow_template(name, user_defined)
VALUES('CB', 0);

-- Insert steps used in MAS into workbench_workflow_step

INSERT IGNORE INTO workbench_workflow_step(name, title) VALUES
('project_planning','Project Planning')
,('population_development','Population Development')
,('field_trial_management','Field Trial Management')
,('statistical_analysis','Statistical Analysis')
,('breeding_decision','Breeding Decision');

-- Insert actual CB steps into workbench_workflow_template_step

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 1, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'CB' AND step.name = 'project_planning';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 2, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'CB' AND step.name = 'population_development';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 4, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'CB' AND step.name = 'field_trial_management';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 5, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'CB' AND step.name = 'statistical_analysis';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 6, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'CB' AND step.name = 'breeding_decision';

-- 
-- MAS Data into workflow tables
-- 

-- Insert MAS into workbench_workflow_template

INSERT IGNORE INTO workbench_workflow_template(name, user_defined)
VALUES('MAS', 0);

-- Insert steps used in MAS into workbench_workflow_step

INSERT IGNORE INTO workbench_workflow_step(name, title) VALUES
('project_planning','Project Planning')
,('population_development','Population Development')
,('genotyping','Genotyping')
,('field_trial_management','Field Trial Management')
,('statistical_analysis','Statistical Analysis')
,('breeding_decision','Breeding Decision');

-- Insert actual MAS steps into workbench_workflow_template_step

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 1, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MAS' AND step.name = 'project_planning';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 2, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MAS' AND step.name = 'population_development';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 3, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MAS' AND step.name = 'genotyping';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 4, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MAS' AND step.name = 'field_trial_management';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 5, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MAS' AND step.name = 'statistical_analysis';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 6, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MAS' AND step.name = 'breeding_decision';


--
-- Insert MABC and Manager templates into workbench_workflow_template 
--

INSERT INTO workbench_workflow_template(name, user_defined)
SELECT DISTINCT('MABC'), 0 FROM workbench_workflow_template
WHERE NOT EXISTS (SELECT template_id FROM workbench_workflow_template WHERE name = 'MABC');

INSERT INTO workbench_workflow_template(name, user_defined)
SELECT DISTINCT('Manager'), 0 FROM workbench_workflow_template
WHERE NOT EXISTS (SELECT template_id FROM workbench_workflow_template WHERE name = 'Manager');

-- Insert steps used in MABC into workbench_workflow_step

INSERT IGNORE INTO workbench_workflow_step(name, title) VALUES
('project_planning','Project Planning')
,('backcrossing','Backcrossing')
,('genotyping','Genotyping')
,('field_trial_management','Field Trial Management')
,('statistical_analysis','Statistical Analysis')
,('breeding_decision','Breeding Decision');

-- Insert actual MABC steps into workbench_workflow_template_step

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 1, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MABC' AND step.name = 'project_planning';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 2, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MABC' AND step.name = 'backcrossing';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 3, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MABC' AND step.name = 'genotyping';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 4, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MABC' AND step.name = 'field_trial_management';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 5, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MABC' AND step.name = 'statistical_analysis';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 6, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'MABC' AND step.name = 'breeding_decision';

-- Insert steps used in the Manager Workflow into workbench_workflow_step

INSERT IGNORE INTO workbench_workflow_step(name, title) VALUES
('project_planning','Project Planning')
,('administration','Administration')
,('analysis_pipeline','Analysis Pipeline')
,('configuration','Configuration')
,('breeding_management','Breeding Management')
,('decision_support','Decision Support');

-- Insert actual Manager Workflow steps into workbench_workflow_template_step

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 1, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'Manager' AND step.name = 'administration';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 2, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'Manager' AND step.name = 'configuration';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 3, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'Manager' AND step.name = 'project_planning';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 4, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'Manager' AND step.name = 'breeding_management';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 5, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'Manager' AND step.name = 'analysis_pipeline';

INSERT IGNORE INTO workbench_workflow_template_step(template_id, step_number, step_id)
SELECT template_id, 6, step_id 
FROM workbench_workflow_template template, workbench_workflow_step step
WHERE template.name = 'Manager' AND step.name = 'decision_support';


--
-- WORKBENCH_ROLE and data
-- 

DROP TABLE IF EXISTS workbench_role;
CREATE TABLE workbench_role (
     role_id INT UNSIGNED AUTO_INCREMENT
    ,name    VARCHAR(255)
    ,workflow_template_id INT UNSIGNED NOT NULL
    ,role_label VARCHAR(255)
    ,label_order INT
    ,CONSTRAINT workbench_role_pk PRIMARY KEY(role_id)
    ,CONSTRAINT fk_workbench_role_1 FOREIGN KEY(workflow_template_id) REFERENCES workbench_workflow_template(template_id) 
)ENGINE=InnoDB;


INSERT INTO workbench_role(name, workflow_template_id, role_label, label_order) 
SELECT 'CB Breeder', template_id, 'Conventional breeding (CB)', 1 
FROM workbench_workflow_template WHERE name = 'CB'
	AND NOT EXISTS (SELECT role_id FROM workbench_role 
                WHERE name = 'CB Breeder' 
                    AND workflow_template_id = (SELECT DISTINCT template_id 
                                                FROM workbench_workflow_template WHERE name = 'CB'));                                            

INSERT INTO workbench_role(name, workflow_template_id, role_label, label_order) 
SELECT 'MAS Breeder', template_id, 'Breeding with marker assisted selection (MAS)', 2 
FROM workbench_workflow_template WHERE name = 'MAS'
	AND NOT EXISTS (SELECT role_id FROM workbench_role 
                WHERE name = 'MAS Breeder' 
                    AND workflow_template_id = (SELECT DISTINCT template_id 
                                                FROM workbench_workflow_template WHERE name = 'MAS'));

INSERT INTO workbench_role(name, workflow_template_id, role_label, label_order) 
SELECT 'MABC Breeder', template_id, 'Marker assisted backcrossing (MABC)', 3 
FROM workbench_workflow_template WHERE name = 'MABC'
	AND NOT EXISTS (SELECT role_id FROM workbench_role 
                WHERE name = 'MABC Breeder' 
                    AND workflow_template_id = (SELECT DISTINCT template_id 
                                                FROM workbench_workflow_template WHERE name = 'MABC'));

INSERT INTO workbench_role(name, workflow_template_id, role_label, label_order) 
SELECT 'MARS Breeder', template_id, 'Marker assisted recurrent selection (MARS)', 4
FROM workbench_workflow_template WHERE name = 'MARS'
	AND NOT EXISTS (SELECT role_id FROM workbench_role 
                WHERE name = 'MARS Breeder' 
                    AND workflow_template_id = (SELECT DISTINCT template_id 
                                                FROM workbench_workflow_template WHERE name = 'MARS'));

INSERT INTO workbench_role(name, workflow_template_id, role_label, label_order) 
SELECT 'Manager', template_id, 'Access all tools with a menu interface (MENU)', 5 
FROM workbench_workflow_template WHERE name = 'Manager'
	AND NOT EXISTS (SELECT role_id FROM workbench_role 
                WHERE name = 'Manager' 
                    AND workflow_template_id = (SELECT DISTINCT template_id 
                                                FROM workbench_workflow_template WHERE name = 'Manager'));
                                                
-- 
--  The users/s associated to a workbench project
-- 
DROP TABLE IF EXISTS workbench_project_user_role;
CREATE TABLE workbench_project_user_role (
     project_user_id            INT UNSIGNED AUTO_INCREMENT NOT NULL 
    ,project_id                 INT UNSIGNED NOT NULL
    ,user_id                    INT(11) NOT NULL
    ,role_id 					INT UNSIGNED NOT NULL
    ,PRIMARY KEY(project_user_id)
    ,UNIQUE(project_id, user_id, role_id)
    ,CONSTRAINT fk_project_user_role_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_project_user_role_2 FOREIGN KEY(role_id) REFERENCES workbench_role(role_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- Mapping table of workbench users to their mysql username and password for each of their projects
DROP TABLE IF EXISTS workbench_project_user_mysql_account;
CREATE TABLE workbench_project_user_mysql_account (
	 project_user_mysql_id		INT UNSIGNED AUTO_INCREMENT NOT NULL
	,project_id                 INT UNSIGNED NOT NULL
    ,user_id                    INT(11) NOT NULL
    ,mysql_username				VARCHAR(16) NOT NULL
    ,mysql_password				VARCHAR(16) NOT NULL
    ,PRIMARY KEY(project_user_mysql_id)
    ,UNIQUE(project_id, user_id)
    ,CONSTRAINT fk_project_user_mysql_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_project_user_mysql_2 FOREIGN KEY(user_id) REFERENCES users(userid) ON UPDATE CASCADE
)
ENGINE=InnoDB;

-- Workbench Settings
DROP TABLE IF EXISTS workbench_setting;
CREATE TABLE workbench_setting (
     setting_id                 INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,installation_directory     VARCHAR(255)
    ,PRIMARY KEY(setting_id)
) ENGINE=InnoDB;

--
-- Tool Configuration table
--
DROP TABLE IF EXISTS workbench_tool_config;
CREATE TABLE workbench_tool_config(
     config_id               INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,tool_id                 INT UNSIGNED NOT NULL
    ,config_key              VARCHAR(255) NOT NULL
    ,config_value            VARCHAR(255) NOT NULL
    ,PRIMARY KEY(config_id)
    ,UNIQUE KEY(tool_id, config_key)
    ,CONSTRAINT fk_tool_config_1 FOREIGN KEY(tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
) ENGINE=InnoDB;

--
-- Workbench Runtime Data
DROP TABLE IF EXISTS workbench_runtime_data;
CREATE TABLE workbench_runtime_data (
     id                     INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,user_id                INT(11)
    ,PRIMARY KEY(id)
) ENGINE=InnoDB;

-- Workbench user security questions
DROP TABLE IF EXISTS workbench_security_question;
CREATE TABLE workbench_security_question (
     security_question_id   INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,user_id                INT NOT NULL
    ,security_question      VARCHAR(255) NOT NULL
    ,security_answer        VARCHAR(255) NOT NULL
    ,PRIMARY KEY (security_question_id)
    ,CONSTRAINT fk_security_question_1 FOREIGN KEY(user_id) REFERENCES users(userid) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Workbench Backup Project
DROP TABLE IF EXISTS workbench_project_backup;
CREATE TABLE workbench_project_backup (
     project_backup_id          	  INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,project_id                    	INT UNSIGNED NOT NULL
    ,backup_path                    TEXT NOT NULL
    ,backup_time                    TIMESTAMP NOT NULL
	  ,PRIMARY KEY(project_backup_id)
) ENGINE=InnoDB;

