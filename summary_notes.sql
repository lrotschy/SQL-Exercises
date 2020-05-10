

-- create database inside psql:
CREATE DATABASE review;
-- create database from command line:
createdb review
-- drop database inside psql:
DROP DATABASE review;
-- drop database from command line
dropdb review
-- create table with primary key, default value, constraints, check constraint
CREATE TABLE people (
  id serial PRIMARY KEY,
  human boolean DEFAULT true,
  name varchar(50) NOT NULL CHECK (length(name) > 1),
  age integer,
  CHECK (age >= 0),
  CONSTRAINT not_becky CHECK (name != 'becky')
);

-- create table with foreign key
CREATE TABLE places (
  people_id integer REFERENCES people (id),
  name varchar(50),
  id serial
);

CREATE TABLE things (
  people_id integer,
  name varchar(50),
  type varchar(50),
  id serial
);

-- Add a primary key
ALTER TABLE places ADD PRIMARY KEY (id);
ALTER TABLE things ADD CONSTRAINT primary_key_name PRIMARY KEY (id);
-- DROP a primary key by name:
ALTER TABLE things DROP CONSTRAINT primary_key_name;
-- add a foreign KEY
-- first allows SQL to generate name of f-key constraint:
ALTER TABLE things ADD FOREIGN KEY (people_id) REFERENCES people (id);
-- THis one assigns name
ALTER TABLE things ADD CONSTRAINT f_key_people FOREIGN KEY (people_id) REFERENCES people (id);
-- DROP a foreign key -- must use name of f-key constraint
ALTER TABLE things DROP CONSTRAINT f_key_people;

-- add a check constraint
ALTER TABLE people ADD CONSTRAINT length CHECK (length(name ) > 3);
ALTER TABLE places ADD CHECK (length(name) > 3);

-- add a default value
ALTER TABLE things ALTER COLUMN type SET DEFAULT 'unknown';
-- add a non null constraint
ALTER TABLE things ALTER COLUMN type SET NOT NULL;

-- create a sequence and add value to table
CREATE SEQUENCE my_sequence;
ALTER TABLE things ADD COLUMN sequence_value integer DEFAULT nextval('my_sequence');
-- drop a column
ALTER TABLE things DROP COLUMN sequence_value;
-- drop a table
DROP TABLE things;
--  rename a table
ALTER TABLE places RENAME TO locations;
--  rename a database

-- insert values
INSERT INTO locations (name) VALUES
('home'), ('utah'), ('colorado');

-- remove constraint--find name by using \d table_name
ALTER TABLE people DROP CONSTRAINT length;

INSERT INTO people (name, age) VALUES
('meee', 43), ('brooke', 13), ('michael', 55);

INSERT INTO people (name, age) VALUES ('me', 43);

-- DELETE row
DELETE FROM people WHERE name = 'meee';
-- Delete all values in table:
DELETE FROM people;

-- update values
UPDATE people SET human = false WHERE name = 'brooke';
-- use NULL to delete values:
UPDATE people SET name = NULL WHERE id = 15;

-- group by
SELECT human, round(avg(age), 2) AS age FROM people GROUP BY human ORDER BY age ASC;
-- order by
SELECT name FROM people ORDER BY name DESC;
-- WHERE
-- having
SELECT avg(age) AS age FROM people GROUP BY human HAVING count(id) >= 2;


CREATE TABLE practice_table (
  series serial,
  name varchar(50)
);

INSERT INTO practice_table VALUES
(1, 'robert'),
(1, 'pinky');

ALTER TABLE practice_table ADD CONSTRAINT name_check CHECK (length(name) > 0);
ALTER TABLE practice_table DROP CONSTRAINT name_check;
ALTER TABLE practice_table ADD COLUMN people_id integer;
ALTER TABLE practice_table ADD FOREIGN KEY (people_id) REFERENCES people (id);
ALTER TABLE practice_table DROP CONSTRAINT practice_table_people_id_fkey;
ALTER TABLE practice_table ADD CONSTRAINT fkey FOREIGN KEY (people_id) REFERENCES people (id);
ALTER TABLE practice_table DROP CONSTRAINT fkey;
ALTER TABLE practice_table DROP FOREIGN KEY CONSTRAINT fkey;
