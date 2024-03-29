CREATE DATABASE IF NOT EXISTS CINEMA_DB;
USE CINEMA_DB;


CREATE TABLE KINOTEATR ( 
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
NAME VARCHAR(20) NOT NULL,
ADRESS VARCHAR(50) NOT NULL,
COUNT_PLACE INT NOT NULL
);

CREATE TABLE FILM ( 
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
NAME VARCHAR(20) NOT NULL
);

CREATE TABLE SEANSE ( 
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_KINOTEATR INT NOT NULL,
id_FILM INT NOT NULL,
COST INT NOT NULL
);

ALTER TABLE SEANSE ADD CONSTRAINT FK_id_KINOTEATR FOREIGN KEY(id_KINOTEATR) REFERENCES  KINOTEATR(ID);
ALTER TABLE SEANSE ADD CONSTRAINT FK_id_FILM FOREIGN KEY(id_FILM) REFERENCES  FILM(ID);

INSERT INTO KINOTEATR(NAME,ADRESS,COUNT_PLACE) VALUES('ORBITA','PUSHKINA',50), ('MIR','KOZLOVA',20);

INSERT INTO FILM(NAME) VALUES('SHAZAM 2'), ('STARWARS');

INSERT INTO SEANSE(id_KINOTEATR,id_FILM,COST) VALUES
(1,1,3), 
(1,2,6);
INSERT INTO SEANSE(id_KINOTEATR,id_FILM,COST) VALUES
(2,1,4), 
(2,2,8);


SELECT F.*,K.*,S.COST FROM SEANSE S
INNER JOIN KINOTEATR K
ON K.ID=S.id_KINOTEATR
INNER JOIN FILM F
ON F.ID=S.id_FILM;



SELECT F.NAME,SUM(K.COUNT_PLACE*S.COST) FROM SEANSE S
INNER JOIN KINOTEATR K
ON K.ID=S.id_KINOTEATR
INNER JOIN FILM F
ON F.ID=S.id_FILM
GROUP BY F.id;



ALTER TABLE SEANSE ADD SEATS_SOLD INT NOT NULL;


UPDATE SEANSE SET SEATS_SOLD=18-ID WHERE id_KINOTEATR =2;
UPDATE SEANSE SET SEATS_SOLD=39-ID WHERE id_KINOTEATR =1;


SELECT F.NAME,SUM(S.SEATS_SOLD*S.COST),SUM(K.COUNT_PLACE*S.COST),(SUM(K.COUNT_PLACE*S.COST)-SUM(S.SEATS_SOLD*S.COST))  FROM SEANSE S
INNER JOIN KINOTEATR K
ON K.ID=S.id_KINOTEATR
INNER JOIN FILM F
ON F.ID=S.id_FILM
GROUP BY F.id;

SELECT F.NAME,SUM(S.SEATS_SOLD*S.COST),SUM(K.COUNT_PLACE*S.COST),(SUM(K.COUNT_PLACE*S.COST)-SUM(S.SEATS_SOLD*S.COST))  FROM SEANSE S
INNER JOIN KINOTEATR K
ON K.ID=S.id_KINOTEATR
INNER JOIN FILM F
ON F.ID=S.id_FILM
GROUP BY F.id
HAVING SUM(S.SEATS_SOLD*S.COST)>200;



SELECT * FROM KINOTEATR;
SELECT * FROM SEANSE;
SELECT * FROM FILM;
