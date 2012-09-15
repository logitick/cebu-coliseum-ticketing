
CREATE TABLE USERS ( 
    USERNAME VARCHAR (25)  NOT NULL , 
    PASSWORD CHAR(128)  NOT NULL , 
    FIRSTNAME VARCHAR (50),
    LASTNAME VARCHAR (50),
    JOINED DATE  NOT NULL, 
    STATUS CHARACTER (1)  NOT NULL  WITH DEFAULT 'A', 
    PRIMARY KEY (USERNAME)  
);
CONNECT RESET;
insert into users ( username, password, joined, status) VALUES ('admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', current date, default);