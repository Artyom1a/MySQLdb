-- Создайте БД Library В БД Library сформулируйте SQL запрос для создания
-- таблицы test. Структура таблицы test:
-- 2. Переименуйте таблицу test на book
-- 3. Измените таблицу добавив поле Amount INT NOT NULL
-- 4. Заполните таблицу значениями
-- ('Мастер и Маргарита', 'Булгаков М. А.', 67.99, 3), ('Белая гвардия', 'Булгаков М. А.',
-- 54.50, 5), ('Идиот', 'Достоевский Ф. М.', 46.00, 10), ('Братья Карамазовы', 'Достоевский
-- Ф. М.', 79.99, 2), ('Стихотворения и поэмы', 'Есенин С. А.', 65.99, 15)
-- 5. Очистите полностью таблицу и заполните заново
-- Поле Ограничение
-- Id INT PK AUTO_INCREMENT
-- Title VARCHAR(50) NOT NULL
-- Author VARCHAR(50) NOT NULL
-- Price DECIMAL(8, 2) NOT NULL

Create database Library;

USE Library;

Create TABLE test(
Id INT PRIMARY KEY AUTO_INCREMENT,
Title VARCHAR(50) NOT NULL,
Author VARCHAR(50) NOT NULL,
Price DECIMAL(8, 2) NOT NULL
);

SELECT * FROM BOOK;

RENAME TABLE test TO BOOK;

ALTER TABLE BOOK ADD AMOUNT INT NOT NULL;

INSERT INTO BOOK(Title,Author,Price,AMOUNT)
VALUES
('Мастер и Маргарита', 'Булгаков М. А.', 67.99, 3), 
('Белая гвардия', 'Булгаков М. А.', 54.50, 5), 
('Идиот', 'Достоевский Ф. М.', 46.00, 10), 
('Братья Карамазовы', 'Достоевский Ф. М.', 79.99, 2), 
('Стихотворения и поэмы', 'Есенин С. А.', 65.99, 15);

TRUNCATE TABLE BOOK;


-- 6. Вывести информацию о всех книгах, хранящихся в библиотеке
-- 7. Выбрать авторов, название книг и их цену из таблицы book.
-- 8. Выбрать названия книг и авторов из таблицы book, для поля title задать
-- имя(псевдоним) Название, для поля author – Автор.
-- 9. Вывести количество всех книг

SELECT TITLE, PRICE FROM BOOK;

SELECT Author,TITLE,Price FROM BOOK;

SELECT TITLE AS "имя(псевдоним)",Author AS "Автор" FROM BOOK;

SELECT COUNT(*) AS 'COUNT'
FROM BOOK;



-- 10. Вывети максимальную и минимальную цену за книги
-- 11. Вывести последнюю запись в динамической таблице
-- 12. Вывести в отсортированном порядке до 3 книг, цена которых от 50 до 60
-- 13. Вывести 1 книгу, цена которой от 60 до 70 и автор Булгаков

SELECT  COUNT(*) AS 'COUNT',
        MIN(Price) AS 'MIN',
        MAX(Price) AS 'MAX'
FROM BOOK;

SELECT  * FROM  BOOK order by ID DESC LIMIT 1;

SELECT  * FROM  BOOK WHERE PRICE  BETWEEN 40 AND 60  order by PRICE LIMIT 3;
SELECT  * FROM  BOOK WHERE (PRICE  BETWEEN 60 AND 70) AND AUTHOR LIKE 'Булгаков%'  order by PRICE LIMIT 1;

-- 14. Вывести автора, название и цены тех книг, количество которых меньше 10.
-- 15. Вывести автора и название книг, количество которых принадлежит интервалу от
-- 2 до 14 (включая границы). Информацию отсортировать сначала по авторам (в
-- обратном алфавитном порядке), а затем по названиям книг (по алфавиту).
-- 16. Для упаковки каждой книги требуется один лист бумаги, цена которого 1 рубль 65
-- копеек. Посчитать стоимость упаковки для каждой книги (сколько денег
-- потребуется, чтобы упаковать все экземпляры книги). В запросе вывести
-- название книги, ее количество и стоимость упаковки, последний столбец назвать
-- pack. 



SELECT  AUTHOR,TITLE,PRICE FROM BOOK WHERE AMOUNT <10;

SELECT AUTHOR,TITLE FROM BOOK WHERE AMOUNT BETWEEN 2 AND 14 ORDER BY AUTHOR DESC, TITLE ASC;

SELECT TITLE, AMOUNT, (AMOUNT*1.65) AS 'PACK' FROM BOOK ;
-- ALTER TABLE BOOK ADD PACK INT NOT NULL;

-- INSERT INTO BOOK(Title,Author,Price,AMOUNT,PACK)
-- VALUES
-- ('Мастер и Маргарита', 'Булгаков М. А.', 67.99, 3, 3*1,65), 
-- ('Белая гвардия', 'Булгаков М. А.', 54.50, 5, 5*1,65), 
-- ('Идиот', 'Достоевский Ф. М.', 46.00, 10, 10*1,65), 
-- ('Братья Карамазовы', 'Достоевский Ф. М.', 79.99, 2,2*1,65 ), 
-- ('Стихотворения и поэмы', 'Есенин С. А.', 65.99, 15);

-- 17. Вывести все книги начинающиеся на М.
-- 18. Вывести все книги Булгакова, начинающиеся на М в отсортированном порядке
-- 19. Выведите все книги, прайс которых находится в промежутке от 40 до 50


SELECT * FROM BOOK WHERE TITLE LIKE 'Б%';

SELECT * FROM BOOK WHERE author LIKE 'Булгаков%' ORDER BY Title ASC;

SELECT * FROM BOOK WHERE PRICE BETWEEN 40 AND 50;

SELECT * FROM BOOK WHERE PRICE IN (65.99,79.99);
