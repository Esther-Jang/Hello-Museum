use museumdb;

CREATE TABLE IF NOT EXISTS exhibit(
	e_id VARCHAR(10) NOT NULL,
	e_title VARCHAR(20),
	e_author VARCHAR(50),
	e_description TEXT,
	e_url TEXT,
	e_openDate VARCHAR(20),
	e_closeDate VARCHAR(20),
	e_filename VARCHAR(20),
	PRIMARY KEY (e_id)
)default CHARSET=utf8;
