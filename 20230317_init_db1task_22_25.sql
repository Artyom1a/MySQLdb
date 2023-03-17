USE UNIVERSITYDB;

-- 22.Отобразите наибольший возраст внутри каждого из университетов

SELECT MAX(ST.AGE), UN.TITLE FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
GROUP BY UN.ID;

-- 23.Добавьте с таблицу однофамильца и выведите все уникальные значения
-- фамилий из таблицы
SELECT ID,SURNAME FROM STUDENTS
WHERE SURNAME = 'Петрова';

-- 24.Отобразите последнюю запись в таблице студенты. К выводу добавьте
-- университет каждого студента и его форму обучения
SELECT ST.NAME,ST.SURNAME,ST.AGE, UN.TITLE, TP.TYPE FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
JOIN TYPE TP
ON TP.ID=ST.TYPE_ID
ORDER BY SURNAME DESC
LIMIT 1;





