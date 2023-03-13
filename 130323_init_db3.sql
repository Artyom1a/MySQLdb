CREATE DATABASE IF NOT EXISTS BOOK;

USE BOOK;


CREATE TABLE book(
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50),
author VARCHAR(50),
price DECIMAL(8,2),
amount INT
   );
INSERT INTO book (title, author, price,amount) VALUES ('Мастер и Маргарита','Булгаков М.А.',670.99,3);
SELECT * FROM book;
INSERT INTO book (title, author, price,amount) VALUES ('Белая гвардия','Булгаков М.А.',540.50,5);
INSERT INTO book (title, author, price,amount) VALUES('Идиот','Достоевский Ф.М.',460.00,10);
INSERT INTO book (title, author, price,amount) VALUES('Братья Карамазовы','Достоевский Ф.М.',799.01,2);
SELECT * FROM book;
SELECT author,title,price FROM book;
SELECT title as Название,author as Автор FROM book;
SELECT title,amount,amount*1.65 as pack FROM book;

SELECT title, price, 
    (price*18/100)/(1+18/100) AS tax, 
    price/(1+18/100) AS price_tax 
FROM book;

SELECT title, 
    price, 
    ROUND((price*18/100)/(1+18/100),2) AS tax, 
    ROUND(price/(1+18/100),2) AS price_tax 
FROM book;

SELECT title,author,amount,ROUND(price*0.7,2) as new_price from book;
