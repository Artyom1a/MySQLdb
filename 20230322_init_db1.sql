-- 1. Создайте БД Сompany. В БД Сompany сформулируйте SQL запрос для создания
-- следующих таблиц. Структура таблицы worker:

-- id INT PK AUTO_INCREMENT
-- Name VARCHAR(40) NOT NULL
-- Lastname VARCHAR(40) NOT NULL
-- Email VARCHAR(40) NOT NULL
-- Age INT NOT NULL

CREATE DATABASE IF NOT EXISTS Сompany;

USE Сompany;

CREATE TABLE worker (
id INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(40) NOT NULL,
Lastname VARCHAR(40) NOT NULL,
Email VARCHAR(40) NOT NULL,
Age INT NOT NULL
);


-- Используйте каскадное удаление при создании FK. Структура таблицы salary:
-- id INT PK AUTO_INCREMENT
-- Worker_id INT FK NOT NULL
-- Month_id INT FK NOT NULL
-- Salary INT NOT NULL

CREATE TABLE salary ( 
id INT PRIMARY KEY AUTO_INCREMENT,
Worker_id INT,
Month_id INT,
Salary INT NOT NULL
);

ALTER TABLE salary MODIFY COLUMN Worker_id INT NOT NULL;
ALTER TABLE salary MODIFY COLUMN Month_id INT NOT NULL;



CREATE TABLE month ( 
id INT PRIMARY KEY AUTO_INCREMENT,
Title VARCHAR(20) NOT NULL
);


ALTER TABLE salary ADD CONSTRAINT FK_WORKER_SALARY FOREIGN KEY (Worker_id) REFERENCES worker(id);
ALTER TABLE salary ADD CONSTRAINT FK_MONTH_SALARY FOREIGN KEY (Month_id) REFERENCES month (id);

INSERT INTO Month(Title) VALUES 
('Январь'),('Февраль'),('Март'),('Апрель'),('Май'),('Июнь'), ('Июль'), ('Август'), ('Сентябрь'),
('Октябрь'), ('Ноябрь'), ('Декабрь');

INSERT INTO Worker(Name,Lastname,Email,Age) VALUES 
('Есения', 'Грант', 'yes@mail.ru', 21), ('Анастасия', 'Павлова', 'test@mail.ru', 21),('Мария',
'Гардон', 'qqq@mail.ru', 21), ('Марта', 'Котикова', 'eee@mail.ru', 28),('Борис', 'Юревич',
'zzz@mail.ru', 21), ('Рыжик', 'Рыжий', 'eeezzz@mail.ru', 31), ('Рейна', 'Собачкова',
'test2@mail.ru', 28), ('Максим', 'Николаев', 'hanna@mail.ru', 21),('Дарья', 'Плешко',
'dasha@mail.ru', 17),('Константин', 'Константинов', 'konst@mail.ru', 31),('Иван',
'Иванов', 'iv@mail.ru', 31),('Николай', 'Николаев', 'nik@mail.ru', 24);


INSERT INTO Salary(Worker_id,Month_id,Salary) VALUES 
(1, 1, 500), (1, 2, 600), (1, 3, 5600), (1, 4, 5100), (1, 5, 5400), (2, 1, 500), (2, 2, 5700), (2, 3, 500), (3,
1, 1500), (4, 1, 5200), (5, 6, 3500), (5, 7, 4500), (6, 4, 570), (7, 9, 5107), (8, 10, 6700);


-- 2. Выведите из таблицы worker записи с id равным 3-5, 6, 10.

SELECT * FROM Worker WHERE ID IN (3,4,5,6,10);

SELECT * FROM Month;
SELECT * FROM Salary;
SELECT * FROM Worker;

-- 3. Выведите из таблицы worker записи с id равным 3, 5, 6, 10 и почтой, начинающейся
-- с 'eee', 'zzz' или 'ggg'.
SELECT * FROM Worker WHERE ID IN (3,5,6,10) && Email LIKE ('eee%') || Email LIKE ('zzz%') || Email LIKE ('ggg%') ;


-- 4. Выведите сотрудников и их зарплаты.
SELECT  * FROM Worker
INNER JOIN Salary
ON WORKER.ID = Salary.Worker_id;

SELECT *, (SELECT SUM(salary) FROM SALARY WHERE WORKER_ID=WORKER.ID) AS SALARY FROM WORKER;

SELECT * FROM WORKER
FULL JOIN SALARY;

-- 5. Выберите неповторяющиеся зарплаты
SELECT  DISTINCT Salary.Salary FROM Worker
INNER JOIN Salary
ON Salary.Worker_id  = WORKER.ID;




-- 6. Выведите тех сотрудников, зарплаты которых > 1000
SELECT  * FROM Worker
INNER JOIN Salary
ON Salary.Worker_id  = WORKER.ID
WHERE Salary.Salary >1000;

-- 7. Выведите сотрудников их зарплаты и месяцы
SELECT  * FROM Worker
INNER JOIN Salary
ON Salary.Worker_id  = WORKER.ID
INNER JOIN month
ON month.id  = Salary.Month_id;


-- 8. Обновите имя у сотрудника id которого 1
UPDATE WORKER SET NAME = 'Борис бритва' WHERE ID =1;


-- 9. Выведите полностью всех сотрудников и зарплаты которые имеются
SELECT  * FROM Worker
FULL JOIN Salary;

SELECT W.*, AVG(SALARY) FROM WORKER W
INNER JOIN SALARY S
ON S.WORKER_ID=W.ID
GROUP BY ID;


-- 10. Выведите минимульную и максимальную прибыль сотрудника
-- SELECT *, (SELECT MAX(SALARY) FROM SALARY WHERE WORKER_ID=WORKER.ID) AS MAXSALARY  FROM WORKER;

SELECT WORKER.*, MAX(SALARY.SALARY), MIN(SALARY.SALARY) FROM WORKER
INNER JOIN SALARY 
ON SALARY.WORKER_ID=WORKER.ID
GROUP BY WORKER.ID;

-- 11. Выведите количество всех сотрудников

SELECT COUNT(*) FROM WORKER;

-- 12. Выведите средний возраст среди всех сотрудников

SELECT ROUND(AVG(AGE),2) AS AVGAGE FROM WORKER;

-- 13. Выведите суммарную прибыль каждого сотрудника
SELECT WORKER.*,SUM(SALARY) FROM WORKER
LEFT JOIN SALARY
ON SALARY.WORKER_ID=WORKER.ID
GROUP BY WORKER.ID;

-- 14. Выведите суммарную прибыль каждого сотрудника, где сумма > 2000

SELECT WORKER.*, SUM(SALARY.SALARY) FROM WORKER
LEFT JOIN SALARY
ON SALARY.WORKER_ID=WORKER.ID
GROUP BY WORKER.ID
HAVING SUM(SALARY.SALARY)>2000;

-- 15. При выборке создайте новое поле, которое состоит из конкатенации имени и
-- фамилии сотрудника разделенных пробелом

SELECT CONCAT(W.NAME , ' ' , W.LASTNAME) AS WORKER FROM WORKER W;


-- 16. Найдите самые маленькие зарплаты по группам возрастов

SELECT W.AGE,MIN(S.SALARY) FROM WORKER W
INNER JOIN SALARY S
ON S.WORKER_ID=W.ID
GROUP BY W.AGE;

-- 17. Подзапрос. Выберите сотрудников, возраст которых меньше среднего возраста,
-- деленного на 2 и умноженного на 3

SELECT * FROM WORKER
WHERE AGE < (SELECT AVG(AGE)/2*3 FROM WORKER);


-- 18. Подзапрос. Выберите из таблицы workers записи с минимальной зарплатой.

SELECT *  FROM WORKER W
INNER JOIN SALARY S
ON S.WORKER_ID=W.ID
WHERE S.SALARY = (SELECT MIN(SALARY.SALARY) FROM SALARY);

-- 20.Отобразите тех сотрудников, зарплата которых выше средней каждого месяца в
-- отсортированном порядке

SELECT W.*,S.SALARY,S.MONTH_ID FROM WORKER W
INNER JOIN SALARY S
ON S.WORKER_ID=W.ID;

SELECT M.ID,M.TITLE, ROUND(AVG(S.SALARY),0) FROM WORKER W
INNER JOIN SALARY S
ON S.WORKER_ID=W.ID
INNER JOIN MONTH M
ON S.MONTH_ID=M.ID
GROUP BY M.ID
HAVING M.ID =S.MONTH_ID  ;




SELECT * FROM Month;
SELECT * FROM Salary;
SELECT * FROM Worker;