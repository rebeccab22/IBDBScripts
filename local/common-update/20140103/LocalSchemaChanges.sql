-- execute in LOCAL database ONLY

CALL drop_fk_if_exists('cvtermprop','cvtermprop_ibfk_1');
CALL drop_fk_if_exists('cvtermsynonym','cvtermsynonym_fk1');