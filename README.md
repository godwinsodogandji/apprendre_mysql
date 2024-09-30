# Notes de Cours - MySQL

## Table des matières

- [Notes de Cours - MySQL](#notes-de-cours---mysql)
  - [Table des matières](#table-des-matières)
  - [Introduction à MySQL](#introduction-à-mysql)
  - [Types de données](#types-de-données)
    - [Types de données numériques](#types-de-données-numériques)
    - [Types de données chaînes de caractères](#types-de-données-chaînes-de-caractères)
    - [Types de données date et heure](#types-de-données-date-et-heure)
  - [Création de bases de données et tables](#création-de-bases-de-données-et-tables)
    - [Créer une base de données](#créer-une-base-de-données)
    - [Voir les bases de données:](#voir-les-bases-de-données)
    - [Supprimer une base de données](#supprimer-une-base-de-données)
    - [Création d'une table dans une base de donnée](#création-dune-table-dans-une-base-de-donnée)
  - [Exemple](#exemple)
  - [Modification d'une table](#modification-dune-table)
    - [Exemple:](#exemple-1)
  - [Pour insérer une donnée dans une table](#pour-insérer-une-donnée-dans-une-table)
  - [Modification globale](#modification-globale)
  - [Vider les données d'une table](#vider-les-données-dune-table)
  - [Créer des contraintes](#créer-des-contraintes)

---

## Introduction à MySQL

MySQL est un système de gestion de bases de données relationnelles (SGBDR) basé sur SQL. Il est utilisé pour stocker et manipuler des données dans des tables interconnectées.

- **Commandes de base** :
  - `mysql -u username -p` : Se connecter à MySQL.
  - `SHOW DATABASES;` : Lister toutes les bases de données.
  - `USE database_name;` : Sélectionner une base de données.

## Types de données

Les types de données dans MySQL sont utilisés pour définir la nature des valeurs qu'une colonne peut stocker.

### Types de données numériques

- `INT` : Stocke des entiers.
- `DECIMAL(p, d)` : Stocke des nombres décimaux.
- `FLOAT` : Nombres à virgule flottante.

### Types de données chaînes de caractères

- `VARCHAR(n)` : Chaîne de caractères de longueur variable (jusqu'à `n` caractères).
- `CHAR(n)` : Chaîne de caractères de longueur fixe.

### Types de données date et heure

- `DATE` : Stocke une date (format `YYYY-MM-DD`).
- `DATETIME` : Stocke une date et une heure (format `YYYY-MM-DD HH:MM:SS`).

## Création de bases de données et tables

### Créer une base de données

```sql
CREATE DATABASE nom_de_la_base;


```

### Voir les bases de données:

SHOW DATABASES;

### Supprimer une base de données

DROP DATABASE nom_de_la_base;

### Création d'une table dans une base de donnée

CREATE TABLE nom_de_la_table
(
colonne_1 type_donnees (options),

colonne_2 type_donnees(options),

colonne_3 type_donnees(options),

colonne_4 type_donnees(options),
);

## Exemple

CREATE TABLE articles
(
`id `INT NOT NULL ,

`title` VARCHAR(255) NOT NULL,

`description` VARCHAR(255) NOT NULL,

`content` TEXT NOT NULL,

PRIMARY KEY (id)

);

## Modification d'une table

Pour modifier la structure d'une table, on utilise la commande `ALTER TABLE` suivie d'une instruction d'ajout' de modification ou encore de suppression de colonne.

ALTER TABLE nom_table ...;

### Exemple:

` Modification d'une table person en ajoutant une colonne`

`ALTER Table` persons` ADD` `COLUMN` email VARCHAR(255) NOT NULL UNIQUE;

## Pour insérer une donnée dans une table

INSERT INTO nom_de_la_table(champ_1, champ_2, ...) VALUES (valeur_1, valeur_2, ...);

## Modification globale

Une modification globale consiste à modifier l'ensemble des données d'une table pour une ou plusieurs colonnes spécifiée(s).

`UPDATE nom_table
SET colonne_1 = valeur_1, colonne_2 = valeur_2, colonne_3 = valeur_3;`

## Vider les données d'une table

`TRUNCATE TABLE nom_de_la_table`;

## Créer des contraintes

Contraintes MySQL

Les contraintes SQL sont utilisées pour spécifier des règles pour les données d'une table.

Les contraintes sont utilisées pour limiter le type de données pouvant être placées dans une table. Cela garantit l'exactitude et la fiabilité des données de la table. En cas de violation entre la contrainte et l'action sur les données, l'action est abandonnée.

Les contraintes peuvent être au niveau des colonnes ou au niveau des tables. Les contraintes au niveau des colonnes s'appliquent à une colonne, et les contraintes au niveau des tables s'appliquent à l'ensemble de la table.

Les contraintes suivantes sont couramment utilisées dans SQL :

`NOT NULL`- Garantit qu'une colonne ne peut pas avoir de valeur NULL
UNIQUE- Garantit que toutes les valeurs d'une colonne sont différentes.

`PRIMARY KEY`- Une combinaison de a NOT NULLet de UNIQUE. Identifie de manière unique chaque ligne d'un tableau
FOREIGN KEY - Empêche les actions qui détruiraient les liens entre les tables

`CHECK`- Garantit que les valeurs d'une colonne satisfont une condition spécifique

`DEFAULT`- Définit une valeur par défaut pour une colonne si aucune valeur n'est spécifiée.

`CREATE INDEX`- Utilisé pour créer et récupérer des données de la base de données très rapidement



CREATE TABLE persons (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    age int NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
DROP TABLE persons;
TRUNCATE TABLE persons;
DESCRIBE persons ;


INSERT INTO persons (nom, prenom, age) VALUES
('Doe', 'John', 25),
('Doe', 'Jane', 25),
('Smith', 'Jim', 30),
('Adams', 'Homer', 35),
('Smith', 'Jack', 35),
('Johnson', 'Bill', 40),
('Johnson', 'Bill', 40),
('Johnson', 'Bill', 40),
('Adams', 'Homer', 35),
('Johnson', 'Bill', 40);

UPDATE persons SET nom = 'Godwin' , prenom = 'Jean-Michel', age = 25 WHERE id = 1;

--faire une nouvelle copie de la table persons 
CREATE TABLE copie_persons AS SELECT * FROM persons;

--création d'une table album
CREATE TABLE album (
    AlbumId INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ArtistId INT NOT NULL,
    PRIMARY KEY (AlbumId)
);
--creation d'une table Track 
CREATE TABLE track (
    TrackId INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    AlbumId INT NOT NULL,
    MediaTypeId INT NOT NULL,
    GenreId INT NOT NULL,
    Composer VARCHAR(255),
    Milliseconds INT NOT NULL,
    Bytes INT,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (TrackId)
);
-- insertion dans la table track
INSERT INTO track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) VALUES
('For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99),
('Put The Finger On You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, 0.99),
('Let Go', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343224, 11170334, 0.99),
('Inject The Venom', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 210834, 6852860, 0.99),
('Snowballed', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 203223, 6728260, 0.99),
('Evil Walks', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 263497, 8611245, 0.99);
--mysql alias Syntaxe de la colonne Alias

SELECT Name AS nom, AlbumId AS album FROM track;

--jointures mysql
--INNER JOIN: Renvoie les enregistrements qui ont des valeurs correspondantes dans les deux tables

SELECT * FROM track INNER JOIN album ON track.AlbumId = album.AlbumId;

--LEFT JOIN: Renvoie tous les enregistrements de la table de gauche et les enregistrements correspondants de la table de droite

SELECT * FROM track LEFT JOIN album ON track.AlbumId = album.AlbumId;
--RIGHT JOIN: Renvoie tous les enregistrements de la table de droite et les enregistrements correspondants de la table de gauche

SELECT * FROM track RIGHT JOIN album ON track.AlbumId = album.AlbumId;
--CROSS JOIN: Renvoie tous les enregistrements de toutes les tables

SELECT * FROM track CROSS JOIN album;




L'opérateur MySQL UNION
L' UNIONopérateur est utilisé pour combiner l'ensemble de résultats de deux ou plusieurs SELECT instructions.

Chaque SELECTinstruction UNIONdoit avoir le même nombre de colonnes
Les colonnes doivent également avoir des types de données similaires
Les colonnes de chaque SELECTinstruction doivent également être dans le même ordre
Syntaxe UNION
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
Syntaxe UNION ALL
L' UNIONopérateur sélectionne uniquement des valeurs distinctes par défaut. Pour autoriser les valeurs dupliquées, utilisez UNION ALL:

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
Remarque : les noms de colonnes dans l’ensemble de résultats sont généralement égaux aux noms de colonnes dans la première SELECTinstruction.

