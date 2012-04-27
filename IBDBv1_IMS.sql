--
-- table structure for table 'lot'
--
DROP TABLE IF EXISTS lot;
CREATE TABLE lot (
	lot_id INT NOT NULL,
	user_id INT NOT NULL,
	entity_type VARCHAR(15) NOT NULL,
	entity_id INT NOT NULL,
	location_id INT NOT NULL,
	scale_id INT NOT NULL,
	status INT NOT NULL,
	source_id INT,
	comments VARCHAR(255),
	PRIMARY KEY (lot_id), 
	FOREIGN KEY (source_id) REFERENCES lot(lot_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX lot_idx1 ON lot (lot_id);
CREATE INDEX lot_idx2 ON lot (user_id);
CREATE INDEX lot_idx3 ON lot (entity_id);
CREATE INDEX lot_idx4 ON lot (location_id);
CREATE INDEX lot_idx5 ON lot (status);
CREATE INDEX lot_idx6 ON lot (source_id);
CREATE INDEX lot_idx7 ON lot (entity_type, entity_id, location_id, scale_id);

--
-- table structure for table 'transaction'
--
DROP TABLE IF EXISTS transaction;
CREATE TABLE transaction (
	transaction_id INT NOT NULL,
	user_id INT NOT NULL,
	lot_id INT NOT NULL,
	transaction_date INT NOT NULL,
	status INT NOT NULL,
	quantity INT NOT NULL,
	comments VARCHAR(255),
	source_type VARCHAR(10),
	source_id INT,
	source_record_id INT,
	previous_amount INT,
	person_id INT,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (lot_id) REFERENCES lot(lot_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX transaction_idx1 ON transaction (transaction_id);
CREATE INDEX transaction_idx2 ON transaction (user_id);
CREATE INDEX transaction_idx3 ON transaction (lot_id);
CREATE INDEX transaction_idx4 ON transaction (transaction_date);
CREATE INDEX transaction_idx5 ON transaction (status);
CREATE INDEX transaction_idx6 ON transaction (quantity);
CREATE INDEX transaction_idx7 ON transaction (source_id);
CREATE INDEX transaction_idx8 ON transaction (source_record_id);
CREATE INDEX transaction_idx9 ON transaction (previous_amount);
CREATE INDEX transaction_idx10 ON transaction (person_id);