CREATE DATABASE IF NOT EXISTS STUDIES;

USE STUDIES;

CREATE TABLE ANIMAL(
ID INT auto_increment,
NAME VARCHAR(20) NOT NULL,
TYPE varchar(20),
PRIMARY KEY(ID)
);