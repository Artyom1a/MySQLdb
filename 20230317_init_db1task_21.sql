USE UNIVERSITYDB;


-- 22.Отобразите наибольший возраст внутри каждого из университетов

SELECT MAX(ST.AGE), UN.TITLE FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
GROUP BY UN.ID;



