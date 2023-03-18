USE UNIVERSITYDB;

CREATE TABLE author (
    author_id	INT PRIMARY KEY AUTO_INCREMENT,
    name_author	VARCHAR(50)
    );


INSERT INTO author (name_author) 
VALUES
('Булгаков М.А.'),
 ('Достоевский Ф.М.'),
 ('Есенин С.А.'),
 ('Пастернак Б.Л.');


CREATE TABLE таблица (
    столбец_1 INT NOT NULL, 
    столбец_2 VARCHAR(10) 
);


CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id) 
);



CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50), 
    author_id INT NOT NULL, 
    genre_id INT, 
    price DECIMAL(8,2), 
    amount INT, 
    FOREIGN KEY (author_id)  REFERENCES author (author_id),
    FOREIGN KEY (genre_id)  REFERENCES genre (genre_id)
);


