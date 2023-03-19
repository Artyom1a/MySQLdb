

-- 1. Создайте БД С inema . В БД С inema сформулируйте SQL запрос для создания
-- таблицы movies . Структура таблицы movies:
-- id
-- INT PK AUTO_INCREMENT
-- title
-- VARCHAR(40) NOT NULL
-- director
-- VARCHAR(40) NOT NULL
-- year
-- INT NOY NULL
-- length_minutes
-- INT NOT NULL

CREATE DATABASE IF NOT EXISTS cinema;

USE cinema;

CREATE TABLE movies (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(40) NOT NULL,
director VARCHAR(40) NOT NULL,
year INT NOT NULL,
length_minutes INT NOT NULL);

-- 2. Заполните таблицу movies
-- История игрушек", " John Lasseter", 1995, 81), (" Жизнь жуков", " John Lasseter", 1998,
-- 95), (" История игрушек 2", " John Lasseter", 1999, 93), (" Корпорация монстров", " Pete
-- Docter ", 2001, 92), В поисках немо", " Andrew Stanton", 2003, 107), (" Суперсемейка ",
-- Brad Bird", 2004, 116), (" Тачки", " John Lasseter", 2006, 117), (" Рататуй", " Brad Bird", 2007,
-- 115), (" ВАЛЛ И", " Andrew Stanton", 2008, 104), (" Вверх", " Pete Docter ", 2009, 101),
-- История игрушек 3", " Lee Unkrich", 2010, 103), (" Тачки 2", " John Lasseter", 2011, 120),
-- Храбрая сердцем", " Brenda Chapman", 2012, 102), (" Университет монстров", " Dan
-- Scanlon", 2013, 110)


INSERT INTO movies (title,director,year,length_minutes) VALUES 
("История игрушек", " John Lasseter", 1995, 81), 
(" Жизнь жуков", " John Lasseter", 1998, 95), 
(" История игрушек 2", " John Lasseter", 1999, 93), 
(" Корпорация монстров", " PeteDocter ", 2001, 92), 
("В поисках немо", " Andrew Stanton", 2003, 107), 
("Суперсемейка","Brad Bird", 2004, 116), 
(" Тачки", " John Lasseter", 2006, 117), 
(" Рататуй", "Brad Bird", 2007,115),
("ВАЛЛИ", "Andrew Stanton", 2008, 104),
(" Вверх", " Pete Docter ", 2009, 101),
("История игрушек 3", " Lee Unkrich", 2010, 103),
 ("тачки2", "John Lasseter", 2011, 120),
("Храбрая сердцем", " Brenda Chapman", 2012, 102), 
(" Университет монстров", " DanScanlon", 2013, 110);

SELECT * FROM movies;

-- 3.
-- Вывести title каждого фильма с использованием псевдонимов
-- 4.
-- Вывести title and director каждого фильма
-- 5.
-- Вывести title and year каждого фильма , где title содержит подстроку сто


SELECT title AS название  FROM movies;

SELECT title,director  FROM movies;


SELECT title,director, year  FROM movies WHERE title LIKE '%сто%';


-- 6.
-- Вывести всю информацию о каждом фильме
-- 7.
-- Выведите количество фильмов выпущенных в каждом году
-- 8.
-- Найдите фильмы, не выпущенные в период year с 2000 по 2010 год

SELECT * FROM movies;

SELECT year, COUNT(title)  FROM movies
group by year;

SELECT title, director, year, length_minutes from movies
where year NOT between 2000 and 2010;

-- 9.
-- Найдите первые 5 фильмов и их выпуск year
-- 10.
-- Найти с реднее время фильмов у каждого рефиссера
-- 11.
-- Найти все фильмы режиссера начинающегося на Джон

SELECT title, director, year, length_minutes from movies
order by year
limit 5;


SELECT director, AVG(length_minutes) from movies
GROUP BY director;


SELECT title,director, year  FROM movies 
WHERE director LIKE 'John%';


-- 12.
-- Найти 3 первых фильма начинающиеся на “В” в отсортированном порядке

SELECT title,director, year,length_minutes  FROM movies 
WHERE title LIKE 'В%'
ORDER BY title;


-- 13.
-- Отобразите общее количество всех фильмов существующих в БД, а также
-- максимальный и минимальный по длительности фильм

SELECT COUNT(title), MAX(length_minutes), MIN(length_minutes) FROM movies;


-- 14.
-- Перечислите с писок всех режиссеров фильмов (в алфавитном порядке) без
-- дубликатов

SELECT DISTINCT director FROM movies
ORDER BY director;


-- 15.
-- Перечислите всех режиссеров, выпустивших минимум 2 фильма

SELECT director,COUNT(title) FROM movies
GROUP BY director
HAVING COUNT(title)>1;



-- 16.
-- Перечислите первые пять фильмов в алфавитном порядке . Учитывать фильмы
-- только с 2000 года


SELECT * FROM movies
where year>= 2000
order by title
limit 5;

-- 18.
-- С формулируйте SQL запрос для создания таблицы boxoffice . Структура таблицы
-- boxoffice

CREATE TABLE boxoffice(
id INT PRIMARY KEY AUTO_INCREMENT,
movie_id INT NOT NULL,
rating DECIMAL(5, 2) NOT NULL,
domestic_sales INT NOT NULL,
internation_sales INT NOT NULL
);

-- ALTER TABLE boxoffice ADD FOREIGN KEY (movie_id)  REFERENCES movies(ID);
ALTER TABLE boxoffice ADD CONSTRAINT FK_Movies_Boxoffice FOREIGN KEY (movie_id)  REFERENCES movies(ID);

-- ALTER TABLE boxoffice DROP FOREIGN KEY boxoffice_ibfk_1;

-- Заполните таблицу boxoffice

INSERT INTO boxoffice(movie_id,rating,domestic_sales,internation_sales) VALUES 
(5, 8.2, 380843261, 555900000), (14, 7.4, 268492764, 475066843), (8, 8, 206445654,
417277164), (12, 6.4, 191452396, 368400000), (3, 7.9, 245852179, 239163000), (6, 8,
261441092, 370001000), (9, 8.5, 223808164, 297503696), (11, 8.4, 415004880, 648167031), (1,
8.3, 191796233, 170162503), (7, 7.2, 244082982, 217900167), (10, 8.3, 293004164, 438338580),
(4, 8.1, 289916256, 272900000), (2, 7.2, 162798565, 200600000), (13, 7.2, 237283207,
301700000);

SELECT * FROM boxoffice;

DELETE FROM movies WHERE id = 1;

-- 20 Найдите domestic and international sales для каждого фильма

SELECT domestic_sales,internation_sales,title
FROM movies
RIGHT JOIN boxoffice
ON boxoffice.movie_id = movies.id;


-- SELECT *
-- FROM movies
-- FULL JOIN boxoffice;
-- 21.
-- Покажите цифры продаж для каждого фильма, где international sales больше чем
-- на domestic sales

SELECT domestic_sales,internation_sales,title
FROM movies
INNER JOIN boxoffice
ON boxoffice.movie_id = movies.id
WHERE internation_sales>domestic_sales;


-- 22.
-- Отобразите с писок всех фильмов по рейтингу в порядке убывания


SELECT title,rating
FROM movies
INNER JOIN boxoffice
ON boxoffice.movie_id = movies.id
ORDER BY rating DESC;



-- 23.
-- Перечислите все фильмы и их совокупные продажи

SELECT title,internation_sales
FROM movies 
LEFT JOIN boxoffice
ON boxoffice.movie_id = movies.id; 



-- 24.
-- Отобразите с писок всех фильмов и их рейтинги в процентах



SELECT title, CONVERT(char(10), rating*10) as Procent_raiting
FROM movies 
LEFT JOIN boxoffice
ON boxoffice.movie_id = movies.id;

SELECT CAST("2017-08-29" AS DATE);



-- 25.Перечислите все фильмы, выпущенные в четные годы
SELECT title,year 
FROM movies
WHERE year%2=0;


-- 26.
-- Посчитайте количество фильмов выпущенных одним режиссером и выведите
-- только те, количество которых четное


SELECT director,COUNT(title)
FROM movies
GROUP BY director
HAVING COUNT(title)%2=0
ORDER BY director ;

-- 27.
-- Выведите название фильма, режиссера, сумму domestic and international sales , где
-- режиссер поставил только 1 фильм


SELECT director,count(title), (SUM(internation_sales) +SUM(domestic_sales))
FROM movies 
INNER JOIN boxoffice
ON boxoffice.movie_id = movies.id
GROUP BY director
HAVING COUNT(title)=1;

SELECT * FROM boxoffice;


