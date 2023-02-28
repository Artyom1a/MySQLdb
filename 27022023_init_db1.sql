CREATE DATABASE IF NOT EXISTS hschool;

USE hschool;  

CREATE TABLE students (
studentName VARCHAR(20),
studentGroup INT
);

INSERT INTO students (studentName, studentGroup) VALUES ('Hanna' , 3);
INSERT INTO students (studentName, studentGroup) VALUES ('Artyom' , 4);
INSERT INTO students (studentName, studentGroup) VALUES ('Dima' , 5);
INSERT INTO students (studentName, studentGroup) VALUES ('Viktor' , 2);

SELECT * FROM students;

SELECT * FROM students where StudentGroup =5 or StudentGroup =2 ;

drop table students;

CREATE TABLE students (
name VARCHAR(20),
surname VARCHAR(40),
age INT ,
`group` INT,
phone Varchar(13)
);

INSERT INTO students (name, surname,age,`group`,phone) 
VALUES
('Maria' , 'Grant', 22,5, '+375291111111'),
('Martha' , 'Mausoleum', 21,4, '+375291111112'),
('Konstantin' , 'Konstantinov', 20,3, '+375291111113'),
('Yana' , 'Zolotova', 22,5, '+375291111114');

Select name as имя, surname as фамилия FROM students;

select *from students;

ALTER table students rename column `group` to groupid; 

alter table students modify column groupid int not null;

select distinct groupid as имяgrup from students;
INSERT INTO students (name,surname,age,groupid,phone) values ('Konstantdfsin' , 'sd', 20,3, '+375291111113');
update students Set name = 'Stanislau' where groupid = 3;

delete from students where name = 'Stanislau';

INSERT INTO students (name,surname,age,groupid,phone) values ('sdb' , 'sd', 20,1, '+375291111113');
INSERT INTO students (name,surname,age,groupid,phone) values ('bfdf' , 'sd', 20,3, '+375291111113');
INSERT INTO students (name,surname,age,groupid,phone) values ('drn' , 'sd', 20,2, '+375291111113');

delete from students where groupid <= 2;

truncate table students;

