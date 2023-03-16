-- 19. Отобразите всех студентов, возраст которых больше 19 и обучающихся в
-- университете с наибольшим количеством студентов


USE UNIVERSITYDB;


-- SELECT ST.NAME,ST.SURNAME,ST.AGE,UN.TITLE FROM STUDENTS ST
-- JOIN UNIVERSITY UN
-- ON UN.ID=ST.UNIVERSITY_ID
-- WHERE UN.ID; 
-- SELECT UN.ID FROM STUDENTS ST
-- JOIN UNIVERSITY UN
-- ON UN.ID=ST.UNIVERSITY_ID
-- WHERE ST.AGE>19
-- group by UN.ID
-- ORDER BY COUNT(UN.TITLE) DESC
-- LIMIT 1;


SELECT ST.NAME,ST.SURNAME,ST.AGE,UN.TITLE,COUNT(UN.TITLE) FROM STUDENTS ST
JOIN UNIVERSITY UN
ON UN.ID=ST.UNIVERSITY_ID
WHERE ST.AGE>19 
group by UN.ID,ST.ID
ORDER BY COUNT(UN.TITLE) DESC;


select st.* from students st 
join university un on un.id = st.university_id 
 where st.age>19 and st.university_id  = (select un.id from university un
join students st on  st.university_id = un.id group by un.id order by count(un.id) desc limit 1 )