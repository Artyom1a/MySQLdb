USE UNIVERSITYDB;

-- 21. Найдите всех студентов, фамилия которых начинается на “П”

SELECT * FROM STUDENTS
WHERE SURNAME LIKE 'П%';