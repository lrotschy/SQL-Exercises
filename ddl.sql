CREATE DATABASE extrasolar;

-- stars table

-- id: a unique serial number that auto-increments and serves as a primary key for this table.
-- name: the name of the star,e,g., "Alpha Centauri A". Allow room for 25 characters. Must be unique and non-null.
-- distance: the distance in light years from Earth. Define this as a whole number (e.g., 1, 2, 3, etc) that must be non-null and greater than 0.
-- spectral_type: the spectral type of the star: O, B, A, F, G, K, and M. Use a one character string.
-- companions: how many companion stars does the star have? A whole number will do. Must be non-null and non-negative.


CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) UNIQUE NOT NULL,
  distance integer NOT NULL,
  spectral_type char(1),
  companions integer NOT NULL
);

-- ALTER TABLE
-- ADD CONSTRAINT upper_case_spectral_type CHECK (spectral type = upper(spectral_type));
ALTER TABLE stars
ADD CONSTRAINT acceptable_chars_spectral_type CHECK (spectral_type SIMILAR TO '(O|B|A|F|G|K|M)');
ALTER TABLE stars
ADD CONSTRAINT non_zero_companions CHECK (companions >= 0);
ALTER TABLE stars
ADD CONSTRAINT non_zero_distance CHECK (distance >= 0);

ALTER TABLE stars ALTER COLUMN name TYPE varchar(50);

INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4, 'K', 3);

CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');
ALTER TABLE stars
DROP CONSTRAINT acceptable_chars_spectral_type;
ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectral_type_enum USING spectral_type::spectral_type_enum;


id: a unique serial number that auto-increments and serves as a primary key for this table.
designation: a single alphabetic character that uniquely identifies the planet in its star system ('a', 'b', 'c', etc.)
mass: estimated mass in terms of Jupiter masses; use an integer for this value.

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer
);

ALTER TABLE planets
ADD COLUMN star_id integer NOT NULL,
ADD FOREIGN KEY (star_id) REFERENCES stars (id);

ALTER TABLE planets
ADD CONSTRAINT alphabetic_designation CHECK (designation ~* '[a-z]');

ALTER TABLE planets
ALTER COLUMN designation SET NOT NULL;

ALTER TABLE planets
ALTER COLUMN mass TYPE decimal;

ALTER TABLE planets
ALTER COLUMN mass SET NOT NULL;

ALTER TABLE planets
ADD CONSTRAINT positive_mass CHECK (mass >= 0);

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

ALTER TABLE planets
DROP COLUMN semi_major_axis;

DELETE FROM stars;
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Alpha Centauri B', 4.37, 'K', 3);
INSERT INTO stars (name, distance, spectral_type, companions)
           VALUES ('Epsilon Eridani', 10.5, 'K', 0);

INSERT INTO planets (designation, mass, star_id)
  VALUES ('b', 0.0036, 4); -- check star_id; see note below
INSERT INTO planets (designation, mass, star_id)
  VALUES ('c', 0.1, 5); -- check star_id; see note below

ALTER TABLE planets
  ADD COLUMN semi_major_axis numeric;

UPDATE planets SET semi_major_axis = 0.04 WHERE designation = 'b';
UPDATE planets SET semi_major_axis = 40 WHERE designation = 'c';

ALTER TABLE planets
ALTER COLUMN semi_major_axis SET NOT NULL;

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id integer NOT NULL REFERENCES stars (id)
);
