ALTER TABLE films
ALTER COLUMN title SET NOT NULL,
ALTER COLUMN year SET NOT NULL,
ALTER COLUMN genre SET NOT NULL,
ALTER COLUMN director SET NOT NULL,
ALTER COLUMN duration SET NOT NULL,
ALTER COLUMN title SET NOT NULL;

--This doens't work:
ALTER TABLE films
ALTER COLUMN title SET UNIQUE;

ALTER TABLE films
ADD CONSTRAINT unique_title UNIQUE (title);

ALTER TABLE films
DROP CONSTRAINT unique_title;

ALTER TABLE films
ADD CONSTRAINT non_empty_title CHECK (length(title) >= 1);

INSERT INTO films VALUES
('', 1945, 'comedy', 'someone', 1);

ALTER TABLE films
DROP CONSTRAINT non_empty_title;

ALTER TABLE films
ADD CONSTRAINT year_range CHECK (year BETWEEN 1900 and 2100);

ALTER TABLE films
ADD CONSTRAINT year_range CHECK year > 1900 AND year < 2100;

ALTER TABLE films
ADD CONSTRAINT director_name CHECK (length(director) >= 3 AND director LIKE '% %');

Three ways to use schema to restrict data:
constraints and check constraints
restrictions on columns
datatypes

CREATE TABLE test (
  name varchar(50) NOT NULL DEFAULT NULL
)
