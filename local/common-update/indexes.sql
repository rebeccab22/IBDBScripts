ALTER TABLE listnms ENGINE = MYISAM;

ALTER TABLE listnms ADD FULLTEXT INDEX(listname);

CALL create_index_if_not_exists('index_liststatus','listnms','liststatus');

CALL create_index_if_not_exists('index_listname','listnms','listname');

CALL create_index_if_not_exists('index_desig','listdata','desig');