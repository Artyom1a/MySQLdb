CREATE DATABASE IF NOT EXISTS worker;

USE worker;

CREATE TABLE IF NOT EXISTS workertable
(
id INT NOT NULL auto_increment ,
Name VARCHAR(20) null,
Email TEXT,
Age Double CHECK(Age>0 or Age<100),
Phone VARCHAR(20),
CONSTRAINT phoneunique UNIQUE(Phone),
PRIMARY KEY(id)
);

SELECT * FROM workertable;

ALTER TABLE WORKERTABLE ADD BIRTHDAY DATE;


INSERT INTO WORKERTABLE (Name, Age,Phone) vALUES ('artyom', 10,+375291111);

INSERT INTO workertable(BIRTHDAY) values ('2012-05-01');

SELECT BIRTHDAY AS деньрождения FROM workertable;