-- initial values for crops. REPLEACE WITH YOUR CENTRAL DB NAMES
-- you only need to do this if you are setting up the workbench database yourself
-- the workbench/central database installers will initialize
-- the contents of the workbench_crop table for you.
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Cassava', 'ibdbv2_cassava_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Chickpea', 'ibdbv2_chickpea_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Cowpea', 'ibdbv2_cowpea_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Maize', 'ibdbv2_maize_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Rice', 'ibdbv2_rice_central');
INSERT INTO workbench_crop(crop_name, central_db_name) VALUES ('Wheat', 'ibdbv2_wheat_central');
