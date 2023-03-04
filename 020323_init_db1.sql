-- CREATE DATABASE IF NOT EXISTS STUDIES;

USE STUDIES;

-- CREATE TABLE ANIMAL(
-- ID INT auto_increment,
-- NAME VARCHAR(20) NOT NULL,
-- TYPE varchar(20),
-- PRIMARY KEY(ID)
-- );

-- rename table ANIMAL to ANIMALS; 

insert into Animals (NAME, TYPE) values ('cat', 'mamal');
insert into Animals (NAME, TYPE) values ('dog', 'mamal');
insert into Animals (NAME, TYPE) values ('frog', 'wat'),('salmon', 'fish');

select last_insert_id();

select * from animals;

select Id,name,type from animals;