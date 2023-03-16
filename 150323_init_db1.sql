CREATE DATABASE IF NOT EXISTS UNIVERSITYDB;

USE UNIVERSITYDB;

CREATE TABLE university (
ID INT PRIMARY KEY AUTO_INCREMENT,
TITLE VARCHAR(10) NOT NULL,
Address VARCHAR(50) NOT NULL
);

-- Создайте БД University. В БД University сформулируйте SQL запрос для создания
-- таблицы university . Структура таблицы

-- id
-- INT PK AUTO_INCREMENT
-- title
-- VARCHAR(10) NOT NULL
-- address
-- VARCHAR(50) NOT NULL

-- 2. Измените таблицу добавив поле Phone VARCHAR(13) UNIQUE
ALTER TABLE university ADD Phone VARCHAR(13) UNIQUE;


-- 3.
-- Заполните таблицу значениями
-- ('БГУИР', 'ул. Петруся Бровки 6', "+375172938815"), ('БНТУ', 'пр. Независимости, 65',
-- "+375172927752"), ('БГУ', 'пр. Независимости, 4', "+375172095044"), ('БГТУ', 'ул.
-- Свердлова, 13а', "+375173439432")

INSERT INTO university(TITLE,address,Phone) VALUES('БГУИР', 'ул. Петруся Бровки 6', "+375172938815"),
 ('БНТУ', 'пр. Независимости, 65', "+375172927752"),
 ('БГУ', 'пр. Независимости, 4', "+375172095044"),
 ('БГТУ', 'ул.-- Свердлова, 13а', "+375173439432");


-- 4. Очистите полностью таблицу и заполните заново

TRUNCATE TABLE university;
SELECT * FROM UNIVERSITY;

-- 5.
-- В БД University сформулируйте SQL запрос для создания таблицы students .
-- Структура таблицы type:

-- id
-- INT PK AUTO_INCREMENT
-- type
-- VARCHAR(10) DEFAULT “offline”

CREATE TABLE TYPE (
ID INT PRIMARY KEY AUTO_INCREMENT,
type VARCHAR(10) DEFAULT 'offline'
);
DROP TABLE STUDENTS;
SELECT * FROM TYPE;

-- 6.В БД University сформулируйте SQL запрос для создания таблицы students .
-- Структура таблицы students:

-- id
-- INT PK AUTO_INCREMENT
-- name
-- VARCHAR(20) NOT NULL
-- surname
-- VARCHAR(30) NOT NULL
-- age
-- INT DEFAULT 17
-- university_id
-- FK INT NOT NULL
-- type_id
-- FK INT NOT NULL

CREATE TABLE students (
ID INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
surname VARCHAR(30) NOT NULL,
age  INT DEFAULT 17,
university_id INT NOT NULL,
FOREIGN KEY (UNIVERSITY_ID) references university(ID),
type_id INT NOT NULL,
FOREIGN KEY (type_id) references type(ID)
);

SELECT * FROM students;

insert into type(type) values
('offline'),('online');
-- ////////////////
-- insert into students(name,surname,age,university_id,type_id) values
-- ('Анна', 'Петрова', 20, 1, 1), 
-- (' Дарья', 'Платонова', 18, 1, 1), 
-- (' Николай', 'Николаев', 19 , 3, 2),
-- ('Авсгустна', 'Сентябрьская', 20, 2, 2),
--  (' Есения', 'Грант', 18, 4, 1);

-- 9.
-- Отобразите всех студентов обучающихся в БГУИР
-- 10.
-- Отобразите всех студентов обучающихся offline


SELECT st.id, st.name, st.surname, st.age,un.title FROM STUDENTS st
JOIN university un
ON un.id=st.university_id
where un.TITLE='БГУИР';

SELECT st.id, st.name, st.surname, st.age,tp.type FROM STUDENTS st
JOIN type tp
ON tp.id=st.university_id
where tp.type='offline';

-- 11.
-- Отобразите количество студентов обучающихся online

SELECT Count(*) FROM STUDENTS st 
JOIN type tp
ON tp.id=st.university_id
where tp.type='online';

SELECT Count(tp.type),tp.type  FROM STUDENTS st 
JOIN type tp
ON tp.id=st.university_id
GROUP BY tp.type;



-- 12.
-- Отобразите студентов, название их университета в алфавитном порядке по
-- фамилии

select st.name,st.surname,title from students st
join university un
on un.id=st.university_id
order by surname asc;

-- 13. Найдите минимальный и максимальный возраст в каждом университете . В
-- итоговый вариант группировки должны входить только те студенты, возраст
-- которых > 19

SELECT MIN(ST.AGE), MAX(ST.AGE), UN.TITLE FROM  students st
JOIN UNIVERSITY UN
ON UN.ID = ST.UNIVERSITY_ID
WHERE ST.AGE>19
GROUP BY UN.ID;

-- 14. Вывести имена и фамилии студентов, их университет и форму обучения

SELECT ST.NAME, ST.SURNAME, UN.TITLE,TP.TYPE FROM students st
JOIN  UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
JOIN TYPE TP
ON TP.ID=ST.UNIVERSITY_ID;

-- 15.
-- Отобразите университет в котором обучается наибольшее количество студентов

SELECT  COUNT(UN.TITLE),UN.TITLE  FROM students st
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
GROUP BY UN.ID
ORDER BY COUNT(UN.TITLE) DESC
LIMIT 1;

-- 16.
-- Отобразите всех студентов, обучающихся offline в БГУИР

SELECT ST.NAME,ST.SURNAME,ST.AGE FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
JOIN TYPE TP
ON TP.ID=ST.UNIVERSITY_ID
WHERE UN.TITLE='БГУИР' && TP.TYPE = 'OFFLINE';

SELECT * FROM STUDENTS;

-- 17.
-- Отобразите всех студентов, обучающихся offline в университете, название
-- которого заканчивается на Р
SELECT ST.NAME,ST.SURNAME,ST.AGE FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
JOIN TYPE TP
ON TP.ID=ST.UNIVERSITY_ID
WHERE UN.TITLE LIKE '%Р' && TP.TYPE = 'OFFLINE';


-- 18.
-- Отобразите всех студентов, возраст которых больше 19 и обучающихся в БНТУ
SELECT ST.NAME,ST.SURNAME,ST.AGE FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
WHERE UN.TITLE='БНТУ' && ST.AGE>19;




