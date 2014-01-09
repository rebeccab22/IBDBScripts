-- execute in CENTRAL database ONLY


INSERT IGNORE INTO cvterm (cvterm_id, cv_id, name, definition, is_obsolete, is_relationshiptype)
VALUES (32789, 1000, 'Unclassified', 'Unclassified', 0, 0);

INSERT IGNORE INTO cvterm_relationship (cvterm_relationship_id, type_id, subject_id, object_id)
VALUES (35397, 1225, 32789, 1330);


