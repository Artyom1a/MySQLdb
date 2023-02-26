USE hschool;

CREATE TABLE User (
	Id INT,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Age INT,
    Email VARCHAR(60)
);

RENAME TABLE User TO Account