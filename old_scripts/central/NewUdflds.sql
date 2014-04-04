SELECT @fldno := max(fldno) from udflds;

INSERT IGNORE INTO udflds (fldno, ftable, ftype, fcode, fname)
VALUES (@fldno+1, 'LOCATION', 'LTYPE', 'FIELD', 'EXPERIMENTAL FIELD'),
(@fldno+2, 'LOCATION', 'LTYPE', 'BLOCK', 'FIELD BLOCK'),
(@fldno+3, 'LOCDES', 'DTYPE', 'COL_IN_BLK', 'NUMBER OF ROWS IN THE BLOCK'),
(@fldno+4, 'LOCDES', 'DTYPE', 'RANGE_IN_BLK', 'NUMBER OF RANGES IN THE BLOCK'),
(@fldno+5, 'LOCDES', 'DTYPE', 'ROWS_IN_PLOT', 'NUMBER OF ROWS PER PLOT'),
(@fldno+6, 'LOCDES', 'DTYPE', 'PLOT_LYOUT', 'PLOT LAYOUT ORDER'),
(@fldno+7, 'LOCDES', 'DTYPE', 'MACHINE_CAP', 'ROW CAPACITY OF PLANTING MACHINE'),
(@fldno+8, 'LOCDES', 'DTYPE', 'DELETED_PLOT', 'DELETED PLOT'),
(@fldno+9, 'LOCDES', 'DTYPE', 'FIELD_PARENT', 'FIELD PARENT'),
(@fldno+10, 'LOCDES', 'DTYPE', 'BLOCK_PARENT', 'BLOCK PARENT')
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
