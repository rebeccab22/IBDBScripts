-- execute in CENTRAL database ONLY

INSERT IGNORE INTO cv(cv_id, name, definition)
VALUES(88888, '77777', 'Nursery Type')
, (88889, '32791', 'Check Factor')
;

INSERT IGNORE INTO cvterm (cvterm_id, cv_id, name, definition, is_obsolete, is_relationshiptype)
VALUES
(32790, 1010, 'CHECK', 'CHECK', 0, 0)
, (32791, 1040, 'CHECK', 'CHECK', 0, 0)
, (77790, 88889, 'CHECK', 'CHECK', 0, 0)
, (77791, 88889, 'TEST', 'TEST', 0, 0)
;

INSERT IGNORE INTO cvterm_relationship (cvterm_relationship_id, subject_id, type_id, object_id)
VALUES
(35398, 32791, 1044, 1040)
, (35399, 32791, 1105, 1130)
, (35400, 32791, 1200, 32790)
, (35401, 32791, 1210, 4030)
, (35402, 32791, 1220, 6050)
, (80000, 32791, 1190, 77790)
, (80001, 32791, 1190, 77791)
, (80002, 32790, 1225, 1045)
;

INSERT IGNORE INTO cvterm (cvterm_id, cv_id, name, definition, is_obsolete, is_relationshiptype)
VALUES
  (77777, 1040, 'NURSERY TYPE', 'NURSERY TYPE', 0, 0)
, (77778, 1010, 'NURSERY TYPE PROP', 'NURSERY TYPE PROP', 0, 0)
, (77779, 88888, 'F1', 'F1 NURSERY', 0, 0)
, (77780, 88888, 'F2', 'F2 NURSERY', 0, 0)
, (77781, 88888, 'PEDIGREE', 'PEDIGREE NURSERY', 0, 0)
;

INSERT IGNORE INTO cvterm_relationship (cvterm_relationship_id, subject_id, type_id, object_id)
VALUES
  (77770, 77777, 1044, 1010)
, (77771, 77777, 1105, 1130)
, (77772, 77777, 1200, 77778)
, (77773, 77777, 1210, 4020)
, (77774, 77777, 1220, 6040)
, (77775, 77777, 1190, 77779)
, (77776, 77777, 1190, 77780)
, (77777, 77777, 1190, 77781)
;
