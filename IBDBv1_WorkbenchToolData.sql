-- Notes on paths:
-- WEB tools should use the release port.
-- NATIVE tools should have an absolute path
INSERT INTO workbench_tool (name, title, version, tool_type, path,parameter,user_tool) VALUES
 ('germplasm_browser', 'Browse Germplasm Information', '1.1.2.6', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/germplasm/','',0)
,('study_browser', 'Browse Studies and Datasets', '1.1.2.6', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/study/','',0)
,('germplasm_list_browser', 'Browse Germplasm Lists', '1.1.2.6', 'WEB', 'http://localhost:18080/GermplasmStudyBrowser/main/germplasmlist/','',0)
,('list_manager', 'List Manager', '1.1.1.0', 'WEB', 'http://localhost:18080/BreedingManager/main/germplasm-import/','',0)
,('crossing_manager','Crossing Manager','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/crosses/','',0)
,('nursery_template_wizard','Nursery Template Wizard','1.1.1.0','WEB','http://localhost:18080/BreedingManager/main/nursery-template/','',0)
,('gdms', 'GDMS', '1.0', 'WEB_WITH_LOGIN', 'http://localhost:18080/GDMS/login.do','',0)
,('fieldbook', 'FieldBook', '3.0.0 Beta 41', 'NATIVE', 'tools/fieldbook/IBFb/bin/ibfb.exe','',0)
,('optimas', 'OptiMAS', '1.4', 'NATIVE', 'tools/optimas/optimas_gui.exe','',0)
,('breeding_manager', 'Breeding Manager', '3.0.0 Beta 41', 'NATIVE', 'tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=BreedingManager',0)
,('breeding_view', 'Breeding View', '1.1.0.9221', 'NATIVE', 'tools/breeding_view/Bin/BreedingView.exe','',0)
,('mbdt','MBDT','1.0.0','NATIVE','tools/mbdt/MBDTversion1.0.0.exe','',0)
,('breeding_planner','Breeding Planner','1.0 April 2013 Release','NATIVE','tools/Breeding Planner/Breeding Planner.exe','',0)
,('germplasm_import','Fieldbook Germplasm Import','4.0.0','NATIVE','tools/fieldbook/IBFb/bin/ibfb.exe','--ibpApplication=GermplasmImport',0)
;