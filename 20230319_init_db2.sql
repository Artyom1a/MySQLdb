USE UNIVERSITYDB;


SELECT name_city,name_author,(DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY)) as Дата
FROM city CROSS JOIN author
ORDER BY name_city ASC, Дата DESC;


SELECT title, name_author, name_genre, price, amount
FROM
    author 
    INNER JOIN  book ON author.author_id = book.author_id
    INNER JOIN genre ON genre.genre_id = book.genre_id
WHERE price BETWEEN 500 AND 700;


SELECT name_genre,title,name_author
FROM
    genre
    INNER JOIN book ON genre.genre_id=book.genre_id
    INNER JOIN author ON author.author_id= book.author_id
WHERE name_genre='Роман'
ORDER BY title ASC;