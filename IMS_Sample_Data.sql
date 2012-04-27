INSERT INTO lot (`lot_id`,`user_id`,`entity_type`,`entity_id`,`location_id`,`scale_id`,`status`,`source_id`,`comments`)
VALUES (-1,1,'GERMPLSM',50533,9000,1538,0,null,'A sample lot');
INSERT INTO lot (`lot_id`,`user_id`,`entity_type`,`entity_id`,`location_id`,`scale_id`,`status`,`source_id`,`comments`)
VALUES (-2,1,'GERMPLSM',1,9000,1538,0,null,'A sample lot');
INSERT INTO lot (`lot_id`,`user_id`,`entity_type`,`entity_id`,`location_id`,`scale_id`,`status`,`source_id`,`comments`)
VALUES (-3,1,'GERMPLSM',50533,9000,1538,0,null,'A sample lot');
INSERT INTO lot (`lot_id`,`user_id`,`entity_type`,`entity_id`,`location_id`,`scale_id`,`status`,`source_id`,`comments`)
VALUES (-4,1,'GERMPLSM',2,9000,1538,0,null,'A sample lot');
INSERT INTO lot (`lot_id`,`user_id`,`entity_type`,`entity_id`,`location_id`,`scale_id`,`status`,`source_id`,`comments`)
VALUES (-5,1,'GERMPLSM',3,9000,1538,0,null,'A sample lot');

INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-1,1,-1,20120405,1,1000,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-2,1,-2,20120405,1,1000,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-3,1,-3,20120405,1,1000,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-4,1,-4,20120405,1,1000,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-5,1,-5,20120405,1,1000,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-6,1,-1,20120407,1,-200,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-7,1,-1,20120412,0,100,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-8,1,-1,20120410,0,-500,'sample transaction',NULL,NULL,NULL,NULL,253);
INSERT INTO transaction (`transaction_id`,`user_id`,`lot_id`,`transaction_date`,`status`,`quantity`,`comments`,`source_type`,`source_id`,`source_record_id`,`previous_amount`,`person_id`)
VALUES (-9,1,-1,20120408,1,-200,'sample transaction',NULL,NULL,NULL,NULL,253);