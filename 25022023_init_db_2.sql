CREATE database IF NOT EXISTS homework;

USE homework;

CREATE TABLE Random (
	Id INT auto_increment,
    City VARCHAR(20) Not null,
    primary key(id)
);

Alter TABLE Random ADD Name VARCHAR(20) Not null;

Alter TABLE Random DROP COLUMN Name;

CREATE TABLE TableTime (
	Cucumber VARCHAR(20),
    time datetime
);
Alter TABLE TableTime ADD Name VARCHAR(20),  ADD Count int;

Alter TABLE TableTime DROP Count;

drop TABLE TableTime;

CREATE TABLE TableOne (
	Id INT ,
    Name VARCHAR(10),
    Email VARCHAR(40)
);

RENAME TABLE TableOne TO Tabletwo;

drop table Tabletwo;

drop database homework;

-- Создать 3 таблицы. Каждая содержит минимум 3 поля,
-- ограничения. Изменить таблицу добавив новое поле.
-- Изменить таблицу добавив ограничение на одно из
-- существующих полей. Переименовать таблицу. Удалить
-- одну из таблиц