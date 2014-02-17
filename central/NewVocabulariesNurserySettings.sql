-- execute in CENTRAL database ONLY

INSERT IGNORE INTO cv(cv_id, name, definition)
VALUES(88888, '77777', 'Nursery Type')
;

INSERT IGNORE INTO cvterm (cvterm_id, cv_id, name, definition, is_obsolete, is_relationshiptype)
VALUES
  (77777, 1040, 'NURSERY TYPE', 'NURSERY TYPE', 0, 0)
, (77778, 1010, 'NURSERY TYPE PROP', 'NURSERY TYPE PROP', 0, 0)
, (77779, 88888, 'F1 NURSERY', 'F1 NURSERY', 0, 0)
, (77780, 88888, 'F2 NURSERY', 'F2 NURSERY', 0, 0)
, (77781, 88888, 'PEDIGREE NURSERY', 'PEDIGREE NURSERY', 0, 0)
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
