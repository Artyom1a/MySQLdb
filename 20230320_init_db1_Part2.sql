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
INSERT INTO Orders(IDusers,DATAREGISTRATION,STATUSPURCHASE) VALUES(2,now(),"новый");
INSERT INTO Orders(IDusers,DATAREGISTRATION,STATUSPURCHASE) VALUES(2,now(),"обработанный");
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
INSERT INTO Products(IDOrders,NAMEPRODUCTS,DESCRIPTIONS,PRICE) VALUES(3,'Table','comfortable table',50);
INSERT INTO Products(IDOrders,NAMEPRODUCTS,DESCRIPTIONS,PRICE) VALUES(4,'LAPTOP','THIS IS THE BEST LAPTOP',100);
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
INSERT INTO Categories(IDProducts,NAMECategories) VALUES(4,'FURNITURE');
INSERT INTO Categories(IDProducts,NAMECategories) VALUES(5,'FURNITURE');
INSERT INTO Categories(IDProducts,NAMECategories) VALUES(6,'technique');
-- 9.
-- Напишите запрос для выбора всех товаров, относящихся к определенной
-- категории

SELECT * FROM Products
INNER JOIN Categories
ON Products.ID=Categories.IDProducts;

-- 10.
-- Напишите запрос для выбора всех пользователей, которые сделали заказы на
-- сумму больше определенной.


SELECT SUM(Products.PRICE) FROM USERS
INNER JOIN Orders 
ON USERS.ID=Orders.IDUSERS
INNER JOIN PRODUCTS
ON Orders.ID=PRODUCTS.IDOrders
GROUP BY USERS.ID
HAVING SUM(Products.PRICE)>50;


-- 11.
-- Напишите запрос для выбора всех пользователей, у которых электронный адрес
-- содержит определенное слово.
-- ?????
SELECT EMAIL 
FROM USERS 
WHERE CONTAINS ( EMAIL, '@mail.ru' );

-- 12.
-- Напишите запрос для выбора всех товаров, цена которых больше определенной
-- суммы и которые относятся к определенной категории.

SELECT * FROM PRODUCTS
INNER JOIN Categories
ON PRODUCTS.ID=Categories.IDPRODUCTS
WHERE PRODUCTS.PRICE > 30 && Categories.NAMECategories='FURNITURE';





-- 13.
-- Напишите запрос для выбора всех пользователей, у которых количество заказов
-- больше определенного числа.

SELECT USERS.`NAME` FROM USERS
INNER JOIN Orders 
ON USERS.ID=Orders.IDUSERS
GROUP BY Orders.IDUSERS
HAVING COUNT(Orders.IDUSERS)>1;





-- 14.
-- Напишите запрос для выбора всех записей из таблицы "Orders", у которых статус
-- является "обработанным" и которые были сделаны в определенный период
-- времени.

SELECT * FROM Orders
WHERE STATUSPURCHASE = 'обработанный' || DATAREGISTRATION='2023-03-13' ;


-- 15.
-- Напишите запрос для выбора всех пользователей, у которых имя начинается с
-- определенной буквы и которые зарегистрировались в определенный период
-- времени.

SELECT * FROM USERS
WHERE `NAME` LIKE 'A%'  && DATAREGISTRATION='2023-03-13';


-- 16.
-- Напишите запрос для выбора всех записей из таблицы "Products",
-- отсортированных по цене в порядке возрастания.


SELECT * FROM PRODUCTS
ORDER BY PRICE;


-- 17.
-- Напишите запрос для выбора всех товаров, цена которых находится в
-- определенном диапазоне и которые относятся к определенной категории.


SELECT * FROM PRODUCTS
INNER JOIN Categories
ON PRODUCTS.ID=Categories.IDPRODUCTS
WHERE PRICE > 50 && PRICE<= 100 && Categories.NAMECategories='technique';


-- 18.
-- Напишите запрос для выбора всех товаров, цена которых не превышает
-- определенную сумму и которые относятся к определенной категории.

SELECT * FROM PRODUCTS
INNER JOIN Categories
ON PRODUCTS.ID=Categories.IDPRODUCTS
WHERE  PRICE<= 100 && Categories.NAMECategories='technique';

-- 19.
-- Напишите запрос для выбора всех товаров, цена которых не превышает
-- определенную сумму и которые относятся к определенной категории.
-- Отсортируйте результаты по цене в порядке возрастания.

SELECT * FROM PRODUCTS
INNER JOIN Categories
ON PRODUCTS.ID=Categories.IDPRODUCTS
WHERE  PRICE<= 100 && Categories.NAMECategories='technique'
ORDER BY PRODUCTS.ID DESC;


-- 20.
-- Напишите запрос для выбора всех пользователей, у которых дата регистрации
-- была раньше определенной даты, и которые имеют определенный статус.
-- Отсортируйте результаты по дате регистрации в порядке убывания.


SELECT * FROM USERS
WHERE  DATAREGISTRATION> '2023-03-13' 
ORDER BY DATAREGISTRATION DESC;


-- 21.
-- Напишите запрос для выбора всех записей из таблицы "Orders", у которых статус
-- заказа является "обработанным" или "отправленным". Отсортируйте результаты
-- по дате заказа в порядке убывания.

SELECT * FROM Orders
WHERE STATUSPURCHASE = 'обработанный' 
ORDER BY DATAREGISTRATION DESC;



SELECT * FROM USERS;
SELECT * FROM PRODUCTS;
SELECT * FROM Orders;
SELECT * FROM Categories;

