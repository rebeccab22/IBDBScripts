-- Notes on paths:
-- WEB tools should use the release port.
-- NATIVE tools should have an absolute path
INSERT INTO workbench_tool (name, title, version, tool_type, path,parameter,user_tool) VALUES
('mbdt','MBDT','1.0.2','NATIVE','tools/mbdt/MBDT.exe','',0)
,('optimas', 'OptiMAS', '1.4', 'NATIVE', 'tools/optimas/optimas_gui.exe','',0)
,('fieldbook', 'FieldBook', '4.0.2', 'NATIVE', 'tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=IBFieldbookTools',0)
,('breeding_view', 'Breeding View', '1.1.0.10749', 'NATIVE', 'tools/breeding_view/Bin/BreedingView.exe','',0)
,('breeding_manager', 'Breeding Manager', '4.0.2', 'NATIVE', 'tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=BreedingManager',0)
,('germplasm_browser', 'Browse Germplasm Information', '1.1.3.0', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/germplasm/','',0)
,('study_browser', 'Browse Studies and Datasets', '1.1.3.0', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/study/','',0)
,('germplasm_list_browser', 'Browse Germplasm Lists', '1.1.3.0', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/germplasmlist/','',0)
,('gdms', 'GDMS', '1.2.2', 'WEB_WITH_LOGIN', 'http://localhost:18080/GDMS/login.do','',0)
,('list_manager', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/germplasm-import/','',0)
,('crossing_manager', 'Crossing Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/crosses/','',0)
,('nursery_template_wizard', 'Nursery Template Wizard', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/nursery-template/?restartApplication','',0)
,('breeding_planner','Breeding Planner','1.0','NATIVE','tools/breeding_planner/breeding_planner.exe','',0)
,('germplasm_import','Germplasm Import','1.0.0','WEB','http://localhost:18080/BreedingManager/main/germplasm-import','',0)
,('germplasm_headtohead','Fieldbook Germplasm Head To Head','1.0.0-BETA','WEB','http://localhost:18080/GermplasmStudyBrowser/main/h2h-query?restartApplication','',0)
,('ibfb_germplasm_import','Fieldbook Germplasm Import','4.0.0','NATIVE','tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=GermplasmImport',0)
,('germplasm_mainheadtohead','Fieldbook Germplasm MAIN Head To Head','4.0.0','WEB','http://localhost:18080/GermplasmStudyBrowser/main/Head_to_head_comparison','',0)
,('DatasetImporter', 'Data Import Tool', '1.0', 'WEB', 'http://localhost:18080/DatasetImporter/','',0)
;

