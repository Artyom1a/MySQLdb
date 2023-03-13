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
