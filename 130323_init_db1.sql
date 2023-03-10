-- Part2
-- 1. Создайте таблицу "Users", которая будет содержать информацию о пользователях:
-- идентификатор, имя пользователя, адрес электронной почты, хэш пароля, дата
-- регистрации

CREATE DATABASE IF NOT EXISTS part2;

USE part2;

CREATE TABLE IF NOT EXISTS users(
ID INT PRIMARY KEY AUTO_INCREMENT,
`NAME` VARCHAR(25),
EMAIL VARCHAR(30) UNIQUE,
PAROL  VARCHAR(30),
DATAREGISTRATION DATE
); 

SELECT * FROM users;

INSERT INTO users(`NAME`,EMAIL,PAROL,DATAREGISTRATION) VALUES("Artyom","Artyom@mail.ru","1234",now());
