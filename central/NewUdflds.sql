INSERT IGNORE INTO udflds (fldno, ftable, ftype, fcode, fname)
VALUES (10000, 'LOCATION', 'LTYPE', 'FIELD', 'EXPERIMENTAL FIELD'),
(10001, 'LOCATION', 'LTYPE', 'BLOCK', 'FIELD BLOCK'),
(10002, 'LOCDES', 'DTYPE', 'COL_IN_BLK', 'NUMBER OF COLUMNS IN THE BLOCK'),
(10003, 'LOCDES', 'DTYPE', 'RANGE_IN_BLK', 'NUMBER OF RANGES IN THE BLOCK'),
(10004, 'LOCDES', 'DTYPE', 'ROWS_IN_PLOT', 'NUMBER OF ROWS PER PLOT'),
(10005, 'LOCDES', 'DTYPE', 'PLOT_LYOUT', 'PLOT LAYOUT ORDER'),
(10006, 'LOCDES', 'DTYPE', 'MACHINE_CAP', 'ROW CAPACITY OF PLANTING MACHINE'),
(10007, 'LOCDES', 'DTYPE', 'DELETED_PLOT', 'DELETED PLOT')
;

INSERT IGNORE INTO cvterm (cvterm_id, cv_id, name, definition, is_obsolete, is_relationshiptype)
VALUES
(77782, 1010, 'BLOCK_ID_PROP', 'BLOCK_ID_PROP', 0, 0)
,(77783, 1040, 'BLOCK_ID', 'BLOCK_ID', 0, 0)
;

INSERT IGNORE INTO cvterm_relationship (cvterm_relationship_id, subject_id, type_id, object_id)
VALUES
(77778, 77783, 1044, 1020)
, (77779, 77783, 1105, 1110)
, (77780, 77783, 1200, 77782)
, (77781, 77783, 1210, 4030)
, (77782, 77783, 1220, 6000)
;
