ALTER TABLE listnms ENGINE = MYISAM;

CALL create_fulltext_index_if_not_exists('listname', 'listnms', 'listname');

CALL create_index_if_not_exists('index_liststatus','listnms','liststatus');

CALL create_index_if_not_exists('index_listname','listnms','listname');

CALL create_index_if_not_exists('index_desig','listdata','desig');