CREATE DATABASE CCTICKET;

CONNECT TO CCTICKET USER db2 USING db2;

CREATE TABLE AREA 
(
	area_id			CHAR(2)			NOT NULL PRIMARY KEY,
	name			VARCHAR(30)		NOT NULL,
	description 	VARCHAR(100)
);

CREATE TABLE AREA_SECTION
(
	area_section_id		INT			NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	area_id				CHAR(2)		NOT NULL,
	section_number		INT			NOT NULL,
	row_number			INT			NOT NULL,
	seats				int			NOT NULL,
	FOREIGN KEY(area_id)	REFERENCES	AREA(area_id)
);

CREATE TABLE EVENT
(
	event_id			INT			NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	name				VARCHAR(50) NOT NULL,
	description			VARCHAR(1000),
	event_date			DATE,
	status				CHAR		NOT NULL WITH DEFAULT 'A'
);

CREATE TABLE EVENT_AREA_PRICE
(
	event_id			INT			NOT NULL,
	area_id				CHAR(2)		NOT NULL,
	price				DECIMAL(7,2)	NOT NULL,
	FOREIGN KEY(event_id)	REFERENCES EVENT(event_id),
	FOREIGN KEY(area_id)	REFERENCES AREA(area_id)
);

CREATE TABLE ACCOUNT
(
	account_id			INT			NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	email				VARCHAR(50) NOT NULL UNIQUE,
	password			CHAR(128)	NOT NULL,
	firstname			VARCHAR(50) NOT NULL,
	lastname			VARCHAR(50)	NOT NULL,
	created				DATE		NOT NULL,
	account_type		CHAR		NOT NULL WITH DEFAULT 'R',
	status				CHAR		NOT NULL WITH DEFAULT 'A'
);

CREATE TABLE TICKET
(
	ticket_id			INT			NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1),
	event_id			INT			NOT NULL,
	area_section_id		INT 		NOT NULL,
	account_id			INT			NOT NULL,
	seat_number			INT,
	sales_price			DECIMAL(7,2) NOT NULL,
	date_purchased		DATE		NOT NULL,
	FOREIGN KEY(event_id) REFERENCES EVENT(event_id),
	FOREIGN KEY(area_section_id) REFERENCES AREA_SECTION(area_section_id),
	FOREIGN KEY(account_id)	REFERENCES ACCOUNT(account_id)
);

INSERT INTO ACCOUNT (ACCOUNT_ID, EMAIL, PASSWORD, FIRSTNAME, LASTNAME, CREATED, ACCOUNT_TYPE, STATUS) VALUES (0, 'admin', 'fd76c939bc09d6b199de60664efefc3770fce16b1e957d2482bd9e0a293eb321016dec42cd4e51f0dc141bbe929c4368098a0e7d37e8a0447fd08b82f50f91b2', 'Super', 'Admin', CURRENT DATE, 'A', DEFAULT);

-- AREAS
INSERT INTO AREA (AREA_ID, NAME, DESCRIPTION) VALUES ('LB','Lower Box', NULL);
INSERT INTO AREA (AREA_ID, NAME, DESCRIPTION) VALUES ('UB','Upper Box', NULL);
INSERT INTO AREA (AREA_ID, NAME, DESCRIPTION) VALUES ('GA','General Admission', NULL);

-- AREA SECTIONS
	-- LOWER BOX 
		-- SECTION 1
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 1, 46);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 2, 47);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 3, 49);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 4, 51);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 5, 53);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 6, 62);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 1, 7, 68);
		-- SECTION 2
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 1, 38);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 2, 42);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 3, 46);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 4, 50);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 5, 54);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 6, 62);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 2, 7, 66);
		-- SECTION 3
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 1, 7);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 2, 8);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 3, 9);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 4, 10);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 5, 11);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 6, 12);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 3, 7, 13);
		-- SECTION 4
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 1, 7);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 2, 8);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 3, 9);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 4, 10);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 5, 11);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 6, 12);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 4, 7, 13);
		-- SECTION 5
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 1, 38);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 2, 42);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 3, 46);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 4, 50);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 5, 53);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 6, 61);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 5, 7, 66);
		-- SECTION 6
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 1, 20);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 2, 20);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 3, 20);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 4, 20);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 5, 40);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 6, 40);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 7, 40);			
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 8, 35);			
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 9, 35);			
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'LB', 6, 10, 35);			
			
	-- UPPER BOX 
		-- SECTION 1
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 1, 1, 68);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 1, 2, 70);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 1, 3, 72);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 1, 4, 74);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 1, 5, 76);
		-- SECTION 2
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 2, 1, 74);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 2, 2, 78);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 2, 3, 83);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 2, 4, 93);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 2, 5, 97);
		-- SECTION 3
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 3, 1, 16);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 3, 2, 17);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 3, 3, 18);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 3, 4, 19);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 3, 5, 19);
		-- SECTION 4
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 4, 1, 16);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 4, 2, 17);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 4, 3, 18);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 4, 4, 19);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 4, 5, 19);
		-- SECTION 5
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 5, 1, 74);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 5, 2, 78);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 5, 3, 82);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 5, 4, 91);
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'UB', 5, 5, 96);
	--GENERAL ADMISSION
			INSERT INTO AREA_SECTION (area_section_id, area_id, section_number, row_number, seats) VALUES (DEFAULT, 'GA', 1, 1, 6000);


DISCONNECT CCTICKET;