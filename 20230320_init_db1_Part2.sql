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
INSERT INTO users(`NAME`,EMAIL,PAROL,DATAREGISTRATION) VALUES("Petr","Petr@mail.ru","1234",now());

-- 2.
-- Создайте таблицу "Orders", которая будет содержать информацию о заказах:
-- идентификатор, идентификатор пользователя, дата заказа, статус заказа (новый,
-- обработанный, отмененный


CREATE TABLE IF NOT EXISTS Orders(
ID INT PRIMARY KEY AUTO_INCREMENT,
IDusers INT,
DATAREGISTRATION DATE,
STATUSPURCHASE VARCHAR(30),
FOREIGN KEY (IDusers)  REFERENCES users (ID)
); 

SELECT * FROM Orders;

INSERT INTO Orders(IDusers,DATAREGISTRATION,STATUSPURCHASE) VALUES(1,now(),"новый");
INSERT INTO Orders(IDusers,DATAREGISTRATION,STATUSPURCHASE) VALUES(1,now(),"новый");

-- 3.
-- Напишите запрос для выбора всех пользователей, зарегистрированных в
-- определенный день

SELECT * FROM users
WHERE DATAREGISTRATION = '2023-03-13';

-- 4.
-- Напишите запрос для выбора всех заказов, которые были сделаны
-- определенным пользователем


SELECT * FROM users
INNER JOIN Orders
ON users.id=Orders.IDusers
WHERE users.email = 'Artyom@mail.ru';
-- WHERE users.`NAME` = 'Petr'; Не работает?


-- 5.
-- Создайте таблицу "Products", которая будет содержать информацию о товарах:
-- идентификатор, название, описание, цена

CREATE TABLE IF NOT EXISTS Products(
ID INT PRIMARY KEY AUTO_INCREMENT,
IDOrders INT,
NAMEPRODUCTS VARCHAR(30),
DESCRIPTIONS VARCHAR(120),
PRICE DECIMAL,
FOREIGN KEY (IDORDERS) REFERENCES Orders (ID)
); 

SELECT * FROM PRODUCTS;
-- 6.
-- Напишите запрос для выбора всех заказов, которые содержат определенный
-- товар

INSERT INTO Products(IDOrders,NAMEPRODUCTS,DESCRIPTIONS,PRICE) VALUES(1,'LAPTOP','THIS IS THE BEST LAPTOP',100);

INSERT INTO Products(IDOrders,NAMEPRODUCTS,DESCRIPTIONS,PRICE) VALUES(2,'Table','comfortable table',50);

SELECT * FROM Orders
INNER JOIN Products
ON Orders.ID=Products.IDOrders
WHERE NAMEPRODUCTS = 'LAPTOP';

-- 7.
-- Напишите запрос для выбора общей стоимости всех заказов, сделанных
-- определенным пользователем
SELECT * FROM USERS;
SELECT * FROM PRODUCTS;
SELECT * FROM Orders;

SELECT  SUM(Products.PRICE) FROM USERS
INNER JOIN Orders
ON USERS.ID=Orders.IDusers
INNER JOIN Products
ON Orders.ID = Products.IDOrders
WHERE USERS.ID = 1;


-- 8.
-- Создайте таблицу "Categories", которая будет содержать информацию о
-- категориях товаров: идентификатор, название

CREATE TABLE IF NOT EXISTS Categories(
ID INT PRIMARY KEY AUTO_INCREMENT,
IDProducts INT,
NAMECategories VARCHAR(30),
FOREIGN KEY(IDProducts) REFERENCES Products(ID)
); 

SELECT * FROM Categories;

INSERT INTO Categories(IDProducts,NAMECategories) VALUES(1,'technique');
-- 9.
-- Напишите запрос для выбора всех товаров, относящихся к определенной
-- категории

SELECT * FROM Products
INNER JOIN Categories
ON Products.ID=Categories.IDProducts;

-- 10.
-- Напишите запрос для выбора всех пользователей, которые сделали заказы на
-- сумму больше определенной.



