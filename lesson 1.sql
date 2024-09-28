-- Active: 1727513389415@@127.0.0.1@3306@sql_training
CREATE DATABASE test;

SHOW DATABASES;

DROP DATABASE test;

INSERT INTO
    persons (first_name, last_name, email)
VALUES (
        'Boss',
        'GANDJI',
        'gandji@me.com'
    );

CREATE Table persons_copy1 AS
SELECT person_id, first_name
FROM persons;

CREATE TABLE persons_copy2 AS SELECT * FROM persons;

TRUNCATE TABLE personnes;

ALTER Table persons ADD COLUMN email VARCHAR(255) NOT NULL UNIQUE;

ALTER Table persons_copy1 MODIFY COLUMN first_name TEXT;

ALTER Table persons_copy1 ADD dateOfBirth TIMESTAMP;

TRUNCATE TABLE persons_copy1;

ALTER TABLE persons_copy1
ADD CONSTRAINT pk_person UNIQUE (created_at);

ALTER TABLE persons_copy1 DROP INDEX pk_person;

DESCRIBE person;

DESCRIBE persons_copy;

DROP TABLE personnes, commandes;

--création de table personnes
CREATE Table personnes (
    person_id int NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    created_at DATETIME NOT NULL,
    Age  int NOT NULL,
    PRIMARY KEY (person_id),
    city VARCHAR(55) DEFAULT 'Abidjan'
);

--création de table commandes
CREATE Table commandes (
    order_id int NOT NULL AUTO_INCREMENT,
    person_id int NOT NULL,
    Order_number int NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (person_id) REFERENCES personnes (person_id)
);

ALTER TABLE personnes ALTER city DROP DEFAULT;

CREATE INDEX idx_persons ON personnes (first_name);
DESCRIBE personnes;
