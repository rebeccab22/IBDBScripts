SET @ORIGINAL_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @ORIGINAL_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

START TRANSACTION;



UPDATE schema_version 
SET
    version = '20131227'
;

UPDATE workbench_crop
SET schema_version = '20140103';

UPDATE workbench_project
SET local_schema_version = '20140103';


REPLACE INTO `workbench_tool` VALUES 
(1,'mbdt','MBDT','1.0.3','NATIVE','C:\\IBWorkflowSystem\\tools/mbdt/MBDT.exe','',0)
,(2,'optimas','OptiMAS','1.4','NATIVE','C:\\IBWorkflowSystem\\tools/optimas/optimas_gui.exe','',0)
,(3,'fieldbook','Fieldbook Native','4.0.2','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=IBFieldbookTools',0)
,(4,'breeding_view','Breeding View','1.1.0.11849','NATIVE','C:\\IBWorkflowSystem\\tools/breeding_view/Bin/BreedingView.exe','',0)
,(5,'breeding_manager','Fieldbook Native - Breeding Manager','4.0.2','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=BreedingManager',0)
,(6,'germplasm_browser','Browse Germplasm Information','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/germplasm/','',0)
,(7,'study_browser','Browse Studies and Datasets','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/study/','',0)
,(8,'germplasm_list_browser','Browse Germplasm Lists','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/germplasmlist/','',0)
,(9,'gdms','GDMS','1.2.3','WEB_WITH_LOGIN','http://localhost:18080/GDMS/login.do','',0)
,(10,'list_manager','List Manager (old)','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/germplasm-import/','',0)
,(11,'crossing_manager','Crossing Manager','1.2.0','WEB','http://localhost:18080/BreedingManager/main/crosses/','',0)
,(12,'nursery_template_wizard','Nursery Template Wizard','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/nursery-template/?restartApplication','',0)
,(13,'breeding_planner','Breeding Planner','1.0','NATIVE','C:\\IBWorkflowSystem\\tools/breeding_planner/breeding_planner.exe','',0)
,(14,'ibfb_germplasm_import','Fieldbook Native - Germplasm Import','4.0.0','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=GermplasmImport',0)
,(15,'germplasm_import','Breeding Manager - Germplasm Import','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/germplasm-import/','',0)
,(16,'germplasm_headtohead','Fieldbook Germplasm Head To Head','1.0.0-BETA','WEB','http://localhost:18080/GermplasmStudyBrowser/main/h2h-query?restartApplication','',0)
,(17,'germplasm_mainheadtohead','Fieldbook Germplasm MAIN Head To Head','4.0.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/Head_to_head_comparison','',0)
,(18,'dataset_importer','Data Import Tool','1.0','WEB','http://localhost:18080/DatasetImporter/','',0)
,(19,'query_for_adapted_germplasm','Query For Adapted Germplasm','1.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/Query_For_Adapted_Germplasm','',0)
,(20,'breeding_view_wb','Single-Site Analysis','1.0','WORKBENCH','http://localhost:18080/ibpworkbench/main/#/breeding_view','',0)
,(21,'breeding_gxe','Multi-Site Analysis','1.0','WORKBENCH','http://localhost:18080/ibpworkbench/main/#/BreedingGxE','',0)
,(22,'bm_list_manager', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/listmanager','',0)
,(23,'fieldbook_web', 'Fieldbook Web', '1.0', 'WEB', 'http://localhost:18080/Fieldbook','',0)
,(24,'nursery_manager_fieldbook_web', 'Fieldbook Web - Nursery Manager', '1.0', 'WEB', 'http://localhost:18080/Fieldbook/NurseryManager','',0)
,(25,'trial_manager_fieldbook_web', 'Fieldbook Web - Trial Manager', '1.0', 'WEB', 'http://localhost:18080/Fieldbook/TrialManager ','',0)
,(26,'ontology_browser_fieldbook_web', 'Fieldbook Web - Ontology Browser', '1.0', 'WEB', 'http://localhost:18080/Fieldbook/OntologyBrowser','',0)
,(27,'bv_meta_analysis','Meta Analysis of Field Trials','1.0','WORKBENCH','http://localhost:18080/ibpworkbench/main/#/bv_meta_analysis','',0)
,(28,'bm_list_manager_main', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/list-manager','',0)
,(29,'study_browser_with_id','Browse Studies and Datasets','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/studybrowser/','',0)
;

COMMIT;




UPDATE workbench_role 
SET
    role_label = 'Conventional Breeding (CB)'

WHERE
    name = 'CB Breeder'
;



UPDATE workbench_role 
SET
    role_label = 'Breeding with Marker Assisted Selection (MAS)'

WHERE
    name = 'MAS Breeder'
;



UPDATE workbench_role 
SET
    role_label = 'Marker Assisted Backcrossing (MABC)'

WHERE
    name = 'MABC Breeder'
;



UPDATE workbench_role 
SET
    role_label = 'Marker Assisted Recurrent Selection (MARS)'

WHERE
    name = 'MARS Breeder'
;



COMMIT;



--
-- Dumping data for table `workbench_sidebar_category`

--

LOCK TABLES `workbench_sidebar_category` WRITE;

/*!40000 ALTER TABLE `workbench_sidebar_category` DISABLE KEYS */;

REPLACE INTO `workbench_sidebar_category` VALUES 
(1,'activities','Breeding Activities')
,(2,'information_mgt','Information Management')
,(3,'statistical_analysis','Statistical Analysis')
,(4,'marker_assisted_breeding','Marker Assisted Breeding')
,(5,'additional_tools','Additional Tools')
,(6,'workflows','Workflows')
,(7,'admin','Program Administration');


/*!40000 ALTER TABLE `workbench_sidebar_category` ENABLE KEYS */;

UNLOCK TABLES;



--
-- Dumping data for table `workbench_sidebar_category_link`

--

LOCK TABLES `workbench_sidebar_category_link` WRITE;

/*!40000 ALTER TABLE `workbench_sidebar_category_link` DISABLE KEYS */;

REPLACE INTO `workbench_sidebar_category_link` VALUES 
(1,'bm_list_manager_main',1,'manage_list','Manage Lists')
,(2,'crossing_manager',1,'manage_crosses','Make Crosses')
,(3,'nursery_manager_fieldbook_web',1,'manage_nurseries','Manage Nurseries')
,(4,'trial_manager_fieldbook_web',1,'manage_trials','Manage Trials')
,(5,'germplasm_import',2,'germplasm_import','Import Germplasm')
,(6,'gdms',2,'gdms','Manage Genotyping Data')
,(7,'study_browser',2,'study_browser','Browse Studies')
,(8,'germplasm_mainheadtohead',2,'main_hxh','Head to Head Query')
,(9,'query_for_adapted_germplasm',2,'adopted_query','Adapted Germplasm Query')
,(10,'ontology_browser_fieldbook_web',2,'ontology_browser_fieldbook_web','Manage Ontologies')
,(11,'breeding_view_wb',3,'breeding_view_wb','Single-Site Analysis')
,(12,'breeding_gxe',3,'breeding_gxe','Multi-Site Analysis')
,(13,'bv_meta_analysis',3,'bv_meta_analysis','Multi-Year Multi-Site Analysis')
,(14,'breeding_view',3,'breeding_view','Breeding View Standalone for QTL')
,(15,'mbdt',4,'mbdt','Molecular Breeding Decision Tool')
,(16,'optimas',4,'optimas','Molecular Breeding Decision Tool: OptiMAS')
,(17,'breeding_planner',4,'mbp','Molecular Breeding Planner');


/*!40000 ALTER TABLE `workbench_sidebar_category_link` ENABLE KEYS */;

UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=@ORIGINAL_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@ORIGINAL_UNIQUE_CHECKS;
