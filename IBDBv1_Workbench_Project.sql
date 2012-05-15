DROP TABLE IF EXISTS
workbench_project_member
,workbench_project_workflow_step
,workbench_project
,workbench_workflow_step_tool
,workbench_workflow_template_step
,workbench_tool_transform
,workbench_tool_output
,workbench_tool_input
,workbench_tool
,workbench_workflow_step
,workbench_workflow_template
;

/**
 * A template of a Workflow.
 * 
 * To represent a workflow (such as MARS) in the DB,
 * we will be adding records on the following tables:
 *      workflow_template
 *      workflow_step
 *      tool
 *      tool_input
 *      tool_output
 *      tool_transform
 *      workflow_template_step
 *      workflow_step_tool
 * 
 * When creating a new project, the user selects a workflow template,
 * and we "clone" the template's steps by adding entries to:
 *      project_workflow_step
 * from the
 *      workflow_template_step
 * table.
 * This table is actually a clone of "workflow_template_step" table.
 */
CREATE TABLE workbench_workflow_template (
     template_id            INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(256) NOT NULL
    ,user_defined           BOOL NOT NULL DEFAULT FALSE
    ,PRIMARY KEY(template_id)
)
ENGINE=InnoDB;

/**
 * A "Step" in a workflow.
 */
CREATE TABLE workbench_workflow_step (
     step_id                INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(64) NOT NULL
    ,title                  VARCHAR(256) NOT NULL
    ,PRIMARY KEY(step_id)
    ,UNIQUE(name)
)
ENGINE=InnoDB;

/**
 * Tools such as "Germplasm Browser" and "Field Book"
 * will be registered here.
 * 
 * TODO:
 * - Maybe we need to record information about the tool's input/output.
 *   For example, do we need to pass a file? or a named parameter?
 */
CREATE TABLE workbench_tool (
     tool_id                INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(128) NOT NULL
    ,title                  VARCHAR(256) NOT NULL
    ,tool_type              ENUM('WEB', 'NATIVE')
    ,path                   TEXT
    ,PRIMARY KEY(tool_id)
    ,UNIQUE(name)
)
ENGINE=InnoDB;
/**
 * A list of named "input" of a tool.
 * "input_label" is the parameter name we could use as labels in screens.
 * "input_name" is the official paramter name (for web or commandline tools).
 */
CREATE TABLE workbench_tool_input (
     tool_input_id          INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,tool_id                INT UNSIGNED NOT NULL
    ,input_label            VARCHAR(256)
    ,input_name             VARCHAR(128)
    ,input_type             ENUM('NUMBER', 'TEXT', 'DATE', 'FILE')
    ,PRIMARY KEY(tool_input_id)
    ,CONSTRAINT fk_tool_input_1 FOREIGN KEY(tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE workbench_tool_output (
     tool_output_id         INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,tool_id                INT UNSIGNED NOT NULL
    ,output_label           VARCHAR(256)
    ,output_name            VARCHAR(128)
    ,output_type            ENUM('NUMBER', 'TEXT', 'DATE', 'FILE')
    ,PRIMARY KEY(tool_output_id)
    ,CONSTRAINT fk_tool_output_1 FOREIGN KEY(tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

/**
 * A "Tool Transform" represents an implementation that could
 * transform an "output" of a certain tool to an "input" of another tool.
 */
CREATE TABLE workbench_tool_transform (
     tool_transform_id              INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,input_tool_id                  INT UNSIGNED NOT NULL
    ,output_tool_id                 INT UNSIGNED NOT NULL
    ,transform_label                VARCHAR(256) NOT NULL
    ,transform_name                 VARCHAR(256) NOT NULL
    ,PRIMARY KEY(tool_transform_id)
    ,UNIQUE(transform_label)
    ,UNIQUE(transform_name)
    ,CONSTRAINT fk_tool_transform_1 FOREIGN KEY(input_tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
    ,CONSTRAINT fk_tool_transform_2 FOREIGN KEY(output_tool_id) REFERENCES workbench_tool(tool_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

/**
 * The steps associated with a Workflow Template.
 * 
 * NOTE: If we are going to save the "prev/next step" of a "step",
 * it might be hard to support the UI mockup provided by douglas.
 * See Note 20120330_workflow_steps
 */
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

/**
 * The tools associated with a Workflow Step.
 * 
 * "tool_number" is added so we can set a tool order.
 */
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

/* NOTE:
 * - maybe we need to record the tools related to an activity?
 * TODO:
 * - confirm whether an activity is a breakdown of a workflow step
 * - can users register their own "activity/task"?
 */
/*
CREATE TABLE activity (
     activity_id            INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,name                   VARCHAR(256) NOT NULL
    ,PRIMARY KEY(activity_id)
)
ENGINE=InnoDB;
*/

/*
CREATE TABLE contact (
     contact_id             INT UNSIGNED
    ,title                  VARCHAR(32)
    ,first_name             VARCHAR(256) NOT NULL
    ,last_name              VARCHAR(256) NOT NULL
    ,email                  VARCHAR(256)
    ,phone_number           VARCHAR(32)
    ,institution            VARCHAR(256)
    ,address_1              VARCHAR(256)
    ,address_2              VARCHAR(256)
    ,skype_id               VARCHAR(64)
    ,notes                  TEXT
    ,picture                BLOB
    ,PRIMARY KEY(contact_id)
)
ENGINE=InnoDB;
*/

/**
 * A project uses an instance of a "Workflow Template".
 * A project has one and only one workflow, which could be modified
 * later even after a project has made progress.
 * 
 * A project has an instance of a "Workflow Template" to ensure that
 * a project's workflow can be modified without affecting all other
 * projects that followed the same template.
 * 
 * "template_id" is the ID of the Workflow being used by the project.
 * "template_modified" specifies whether modifications on the original
 * Workflow steps has been made.
 * 
 * TODO:
 * - a project has a data set
 * CONFIRM:
 * - what are datasets?
 */
CREATE TABLE workbench_project (
     project_id                 INT UNSIGNED AUTO_INCREMENT NOT NULL
    ,project_name               VARCHAR(256) NOT NULL
    ,target_due_date            DATE
    ,template_id                INT UNSIGNED NOT NULL
    ,template_modified          BOOL NOT NULL DEFAULT FALSE
    ,PRIMARY KEY(project_id)
    ,CONSTRAINT fk_project_1 FOREIGN KEY(template_id) REFERENCES workbench_workflow_template(template_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;

/**
 * A "step" in a Project Workflow represents an "activity".
 * It can be assigned to a user (Contact), have a Due Date and a Status.
 */
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

/**
 * CONFIRM:
 * - If we have a Workflow Step known to be associated with two tools, Tool A and Tool B,
 *   can a project that has that Workflow Step declare that it will not use Tool B?
 *   We might need to create a separate table if we support it (I hope we don't).
 */

CREATE TABLE workbench_project_member (
     project_id             INT UNSIGNED
    ,contact_id             INT UNSIGNED
    ,CONSTRAINT fk_project_member_1 FOREIGN KEY(project_id) REFERENCES workbench_project(project_id) ON UPDATE CASCADE
)
ENGINE=InnoDB;


/**
 * Add initial data.
 */
INSERT INTO workbench_workflow_template (template_id, name, user_defined) VALUES
(1, 'MARS', FALSE);

INSERT INTO workbench_workflow_step (step_id, name, title) VALUES
 (1, 'project_planning', 'Project Planning')
,(2, 'population_management', 'Population Management')
,(3, 'field_trial_management', 'Field Trial Management')
,(4, 'genotyping', 'Genotyping')
,(5, 'qtl_analysis', 'QTL Analysis')
,(6, 'ideotype_design', 'Ideotype Design')
,(7, 'plant_selection', 'Plant Selection')
,(8, 'population', 'Population')
,(9, 'project_completion', 'Project Completion')
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

INSERT INTO workbench_tool (name, title, tool_type, path) VALUES
 ('germplasm_browser', 'Browse Germplasm Information', 'WEB', 'http://localhost:8081/GermplasmBrowser/')
,('germplasm_phenotypic', 'Retrieve Germplasm by Phenotypic Data', 'WEB', 'http://localhost:8081/GermplasmBrowser2/')
,('gdms', 'GDMS', 'WEB', 'http://localhost:8080/GDMS/login.do')
,('fieldbook', 'FieldBook', 'NATIVE', 'C:/IBFIELDBOOK/IBFb/bin/ibfb.exe')
;