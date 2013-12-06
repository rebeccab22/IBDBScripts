--
-- Make sure that workbench_tool supports new enum types
--

ALTER TABLE `workbench`.`workbench_tool` 
CHANGE COLUMN `tool_type` `tool_type` ENUM('WEB','WEB_WITH_LOGIN','NATIVE','WORKBENCH','ADMIN') NULL DEFAULT NULL ;

-- Notes on paths:
-- WEB tools should use the release port.
-- NATIVE tools should have an absolute path
INSERT INTO `workbench_tool` VALUES 
(1,'mbdt','MBDT','1.0.3','NATIVE','C:\\IBWorkflowSystem\\tools/mbdt/MBDT.exe','',0)
,(2,'optimas','OptiMAS','1.4','NATIVE','C:\\IBWorkflowSystem\\tools/optimas/optimas_gui.exe','',0)
,(3,'fieldbook','FieldBook','4.0.2','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=IBFieldbookTools',0)
,(4,'breeding_view','Breeding View','1.1.0.10749','NATIVE','C:\\IBWorkflowSystem\\tools/breeding_view/Bin/BreedingView.exe','',0)
,(5,'breeding_manager','Breeding Manager','4.0.2','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=BreedingManager',0)
,(6,'germplasm_browser','Browse Germplasm Information','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/germplasm/','',0)
,(7,'study_browser','Browse Studies and Datasets','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/study/','',0)
,(8,'germplasm_list_browser','Browse Germplasm Lists','1.2.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/germplasmlist/','',0)
,(9,'gdms','GDMS','1.2.3','WEB_WITH_LOGIN','http://localhost:18080/GDMS/login.do','',0)
,(10,'list_manager','List Manager','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/germplasm-import/','',0)
,(11,'crossing_manager','Crossing Manager','1.2.0','WEB','http://localhost:18080/BreedingManager/main/crosses/','',0)
,(12,'nursery_template_wizard','Nursery Template Wizard','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/nursery-template/?restartApplication','',0)
,(13,'breeding_planner','Breeding Planner','1.0','NATIVE','C:\\IBWorkflowSystem\\tools/breeding_planner/breeding_planner.exe','',0)
,(14,'ibfb_germplasm_import','Fieldbook Native','4.0.0','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=GermplasmImport',0)
,(15,'germplasm_import','Fieldbook Germplasm Import','1.0.0','NATIVE','C:\\IBWorkflowSystem\\tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=GermplasmImport',0)
,(16,'germplasm_headtohead','Fieldbook Germplasm Head To Head','1.0.0-BETA','WEB','http://localhost:18080/GermplasmStudyBrowser/main/h2h-query?restartApplication','',0)
,(17,'germplasm_mainheadtohead','Fieldbook Germplasm MAIN Head To Head','4.0.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/Head_to_head_comparison','',0)
,(18,'dataset_importer','Data Import Tool','1.0','WEB','http://localhost:18080/DatasetImporter/','',0)
,(19,'query_for_adapted_germplasm','Query For Adapted Germplasm','1.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/Query_For_Adapted_Germplasm','',0)
,(20,'breeding_view_wb','Single-Site Analysis','1.0','WORKBENCH','http://localhost:18080/ibpworkbench/main/#/breeding_view','',0)
,(21,'breeding_gxe','Multi-Site Analysis','1.0','WORKBENCH','http://localhost:18080/ibpworkbench/main/#/BreedingGxE','',0)
,(22,'bm_list_manager', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/listmanager/','',0)
,(23,'fieldbook_web', 'Fieldbook', '1.1.1.0', 'WEB', 'http://localhost:18080/Fieldbook','',0)
,(24,'nursery_manager_fieldbook_web', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/Fieldbook/NurseryManager','',0)
,(25,'trial_manager_fieldbook_web', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/Fieldbook/TrialManager ','',0)
,(26,'ontology_browser_fieldbook_web', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/Fieldbook/OntologyBrowser','',0)
,(27,'bv_meta_analysis','Meta Analysis of Field Trials','1.0','WORKBENCH','http://localhost:18080/ibpworkbench/main/#/bv_meta_analysis','',0)
;