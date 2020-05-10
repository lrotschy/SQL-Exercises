-- Easy_1

CREATE DATABASE animals; -- or $ createdb animals

CREATE TABLE birds (
id serial PRIMARY KEY,
name varchar(25),
age integer,
species varchar(15)
);

INSERT INTO birds (name, age, species) VALUES
('Charlie', 3, 'Finch'),
('Allie', 5, 'Owl'),
('Jennifer', 3, 'Magpie'),
('Jamie', 4, 'Owl'),
('Roy', 8, 'Crow');

TABLE birds;
SELECT * FROM birds;

SELECT * FROM birds WHERE age < 5;

UPDATE birds SET species = 'Raven' where species = 'Crow';

DELETE FROM birds WHERE species = 'Finch' AND age = 3;

ALTER TABLE birds
ADD CONSTRAINT check_age CHECK (age > 0);

INSERT INTO birds (name, age, species) VALUES ('Bill', -15, 'alligator');

DROP TABLE birds;
