--  dml.sql

CREATE DATABASE ddl_exercises;

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices (id)
);

INSERT INTO devices (name) VALUES
('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES
(123, 1), (1234, 1), (12345, 1), (100, 2), (101, 2), (102, 2), (103, 2), (104, 2), (105, 2), (500, NULL), (501, NULL), (502, NULL);

SELECT devices.name, parts.part_number
FROM devices INNER JOIN parts ON devices.id = parts.device_id;

SELECT * FROM parts
WHERE part_number::varchar LIKE '3%';

SELECT * FROM parts
WHERE substring(part_number::varchar, 1, 1) = '5';

SELECT * FROM parts
WHERE position('5' in part_number::varchar) = 1;


SELECT * FROM parts
WHERE starts_with(part_number::varchar, '5');

SELECT * FROM parts
WHERE substr(part_number::varchar, 1, 1) = '5';

SELECT devices.name, count(parts.id)
FROM devices INNER JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name
ORDER BY devices.name DESC;

SELECT part_number, device_id FROM parts
WHERE device_id IS NOT NULL;

SELECT part_number, device_id FROM parts
WHERE device_id IS NULL;

SELECT part_number, device_id FROM parts
ORDER BY device_id;

SELECT name AS oldest_device FROM devices ORDER BY created_at ASC LIMIT 1;

SELECT MIN(created_at) FROM devices;

SELECT * FROM devices WHERE created_at IN (SELECT MIN(created_at) FROM devices);

UPDATE parts SET device_id = 1
WHERE part_number = 104 OR part_number = 105;

UPDATE parts SET device_id = 2 WHERE part_number in (SELECT MIN(part_number) FROM parts);

DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE name = 'Accelerometer';

ON DELETE CASCADE clause on foreign key
