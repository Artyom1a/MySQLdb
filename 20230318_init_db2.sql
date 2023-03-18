USE UNIVERSITYDB;

INSERT INTO book(title,author_id,genre_id,price,amount) VALUES
('Стихотворения и поэмы',3,2,650.00,15),
('Черный человек',3,2,570.20,6),
('Лирика',4,2,518.99,2);


SELECT title, name_author
FROM 
    author INNER JOIN book
    ON author.author_id = book.author_id;
    
    
SELECT title,name_genre,price
FROM book inner join genre
ON book.genre_id=genre.genre_id
WHERE book.amount>8
ORDER BY price DESC;

SELECT name_author, title 
FROM author LEFT JOIN book
     ON author.author_id = book.author_id
ORDER BY name_author;


SELECT name_genre
FROM genre LEFT JOIN book
ON genre.genre_id = book.genre_id
WHERE title IS NULL;

