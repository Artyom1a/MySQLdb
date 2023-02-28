CREATE DATABASE IF NOT EXISTS university;

USE university;  

CREATE TABLE students (
id int not null primary key auto_increment,
name VARCHAR(20) not null,
surname VARCHAR(40)  not null,
age INT  not null ,
course INT  not null 
);

alter table students add Phone varchar(13) not null unique ;

alter table students add check(length(Phone)=13);
alter table students add CONSTRAINT check_375 check(Phone like '+375%');
alter table students drop CONSTRAINT students_chk_2; 




insert into students (name,surname, Age,Course,Phone)
Values
('Maria', 'Grant', 22, 5, '+375291111111'), 
('Martha', 'Mausoleum', 21, 4, '+375291111122'),
('Konstantin', 'Konstantinov', 20, 3, '+375291231361'), 
('Kirill', 'Anisimov', 21, 4, '+375291181111'),
('Yana', 'Zolotova', 22, 5, '+375291149011');


insert into students (name,surname, Age,Course,Phone)  Values ('test', 'Zolotova', 22, 5, '+275291149011');
-- delete from students where id =8;
-- delete from students;
select * from students;
select name,surname,phone from students;
select  distinct surname as фамилия from students;
update students set course=course+1, name= 'katya' where id=6; 
delete from students where id=6;

select distinct course from students;

-- truncate table students;

-- 4. Очистите полностью таблицу и заполните заново
-- Заполните таблицу значениями
