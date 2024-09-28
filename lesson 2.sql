-- Active: 1727513389415@@127.0.0.1@3306@sql_training
CREATE Table humans (
    person_id int NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(55) NOT NULL,
    last_name VARCHAR(55) NOT NULL,
    created_at DATETIME NOT NULL,
    Age int NOT NULL,
    PRIMARY KEY (person_id),
    city VARCHAR(55) DEFAULT 'Abidjan'
);

DROP Table humans;

INSERT INTO
    humans (
        first_name,
        last_name,
        created_at,
        Age
    )
VALUES (
        'Benjamin',
        'Gossa',
        NOW(),
        30
    ),
    ('John', 'Doe', NOW(), 25),
    (
        'Benjamin',
        'Gossa',
        NOW(),
        10
    ),
    (
        'Jeremy',
        'Baptista',
        NOW(),
        23
    );

SELECT first_name, last_name, `Age` FROM humans;

SELECT DISTINCT first_name FROM humans;

SELECT * FROM humans WHERE `Age` = 23;

SELECT * FROM humans WHERE `Age` = 23 AND first_name = 'Godwin';

SELECT * FROM humans WHERE `Age` = 31 OR first_name = 'Godwin';

SELECT DISTINCT
    first_name
FROM humans
WHERE
    first_name NOT IN('Godwin', 'Benjamin');

SELECT * FROM humans WHERE first_name LIKE '%win%';

SELECT * FROM humans WHERE first_name LIKE 'G%';

SELECT DISTINCT
    first_name
FROM humans
WHERE
    first_name IN ('Godwin', 'Benjamin');

-- Mysql order_by

SELECT * FROM humans ORDER BY `Age` DESC;

SELECT * FROM humans ORDER BY first_name DESC;

--mysql NULL / NOT NULL

SELECT * FROM humans WHERE city IS NULL;

SELECT * FROM humans WHERE city IS NOT NULL;

SELECT * FROM humans WHERE city IS NULL OR city = 'Abidjan';

SELECT * FROM humans WHERE last_name IS NULL;

SELECT * FROM humans WHERE last_name IS NOT NULL;

--mysql Update

UPDATE humans SET city = 'Accra' WHERE person_id = 1;

UPDATE humans SET city = 'Yamoussoukro' WHERE person_id = 3;

UPDATE humans SET first_name = 'Bob' WHERE first_name LIKE '%win%';

--mysql Delete

DELETE FROM humans WHERE person_id = 1;

DELETE FROM humans WHERE city = 'Abidjan';

--mysql LIMIT

SELECT * FROM humans LIMIT 2;

SELECT *
FROM humans
WHERE
    first_name IS NOT NULL
ORDER BY first_name DESC
LIMIT 2;

--mysql fonction min() pour récupérer le first_name, last_name, person_id le plus jeune de la table human

SELECT * FROM humans WHERE `Age` = (SELECT MIN(`Age`) FROM humans);


--mysql fonction max() pour sélectionner l'individu le plus vieux de la table human

SELECT * FROM humans WHERE `Age` = (SELECT MAX(`Age`) FROM humans);

SELECT first_name as 'Nom', last_name as 'Prenom' FROM humans;

--mysql fonction count() pour compter le nombre d'individus dans la table human

SELECT COUNT(*) FROM humans;
--mysql fonction AVG() qui renvoie la valeur moyenne d'une colonne numérique

SELECT AVG(`Age`) FROM humans;

--mysql fonction SUM() qui renvoie la somme d'une colonne numérique 

SELECT SUM(`Age`) FROM humans;


