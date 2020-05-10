CREATE TABLE employees (
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  department varchar(100) NOT NULL DEFAULT 'unknown',
  vacation_remaining integer NOT NULL DEFAULT 0
);

INSERT INTO employees VALUES
('Leonardo', 'Ferreira', 'finance', 14),
('Sara', 'Mikaelsen', 'operations', 14),
('Lian', 'Ma', 'marketing', 13),
('Haiden', 'Smith', DEFAULT, DEFAULT);

UPDATE employees SET department = 'unassigned' WHERE department = 'unknown';


CREATE TABLE temperatures (
  "date" date NOT NULL DEFAULT current_date,
  low integer NOT NULL,
  high integer NOT NULL
);

INSERT INTO temperatures VALUES
('2016-03-01', 34, 43),
('2016-03-02', 32, 44),
('2016-03-03', 31, 47),
('2016-03-04', 33, 42),
('2016-03-05', 39, 46),
('2016-03-06', 32, 43),
('2016-03-07', 29, 32),
('2016-03-08', 23, 31),
('2016-03-09', 17, 28);

SELECT round((avg(high) + avg(low)) / 2, 1) FROM temperatures;

SELECT "date", round((high + low)/2, 1) FROM temperatures
WHERE "date" BETWEEN '2016-03-02' AND '2016-03-08';

ALTER TABLE temperatures ADD COLUMN rainfall integer DEFAULT 0;

UPDATE temperatures SET rainfall = ((high + low) / 2) - 35
WHERE ((high + low) / 2) > 35;

ALTER TABLE temperatures
ALTER COLUMN rainfall TYPE decimal(6, 3);
UPDATE temperatures SET rainfall = rainfall * .039;

ALTER TABLE temperatures
RENAME TO weather;
