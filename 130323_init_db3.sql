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


SELECT title, amount, price, 
    IF(amount<4, price*0.5, price*0.7) AS sale
FROM book;

SELECT title, amount, price, 
    ROUND(IF(amount<4, price*0.5, price*0.7),2) AS sale
FROM book;

SELECT title, amount, price,
    ROUND(IF(amount < 4, price * 0.5, IF(amount < 11, price * 0.7, price * 0.9)), 2) AS sale,
    IF(amount < 4, 'скидка 50%', IF(amount < 11, 'скидка 30%', 'скидка 10%')) AS Ваша_скидка
FROM book;

SELECT author,title,ROUND(IF(author="Булгаков М.А.",price*1.1,IF(author="Есенин С.А.",price*1.05,price)),2) as new_price from book;
SELECT title, price 
FROM book
WHERE price < 600;
SELECT title, author, price * amount AS total
FROM book
WHERE price * amount > 4000;
SELECT author,title,price FROM book WHERE amount<10;

SELECT title, author, price 
FROM book
WHERE price > 600 AND author = 'Булгаков М.А.';

SELECT title, author, price 
FROM book
WHERE (author = 'Булгаков М.А.' OR author = 'Есенин С.А.') AND price > 600;

SELECT title, author, price 
FROM book
WHERE author = 'Булгаков М.А.' OR author = 'Есенин С.А.' AND price > 600;

SELECT title,author,price,amount from book where (price>500 or price>600) and price*amount>5000;


SELECT title, amount 
FROM book
WHERE amount BETWEEN 5 AND 14;


SELECT title, amount 
FROM book
WHERE amount >= 5 AND amount <=14;


SELECT title, price 
FROM book
WHERE author IN ('Булгаков М.А.', 'Достоевский Ф.М.');


SELECT title, price 
FROM book
WHERE author = 'Булгаков М.А.' OR author = 'Достоевский Ф.М.';


SELECT title,author FROM book where (price>= 540.50 and price<=800) and amount in (2,3,5,7);

SELECT title, author, price
FROM book
ORDER BY title;


SELECT title, author, price
FROM book
ORDER BY 1;

SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY author, amount DESC;

SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY author, Количество DESC;

SELECT author, title, amount AS Количество
FROM book
WHERE price < 750
ORDER BY 1, 3 DESC;


SELECT author,title
FROM book
WHERE amount>=1 AND amount<=14
ORDER BY author DESC, title asc;
SELECT title 
FROM book
WHERE title LIKE 'Б%';
/* эквивалентное условие 
title LIKE 'б%'
*/

SELECT title FROM book 
WHERE title LIKE "_____";

SELECT title FROM book 
WHERE title LIKE "______%";
/* эквивалентные условия 
title LIKE "%______"
title LIKE "%______%"
*/


SELECT title FROM book 
WHERE   title LIKE "_% и _%" /*отбирает слово И внутри названия */
    OR title LIKE "и _%" /*отбирает слово И в начале названия */
    OR title LIKE "_% и" /*отбирает слово И в конце названия */
    OR title LIKE "и" /* отбирает название, состоящее из одного слова И */


SELECT title FROM book 
WHERE title NOT LIKE "% %"; 