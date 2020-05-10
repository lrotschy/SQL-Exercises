CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  film_id integer REFERENCES films (id),
  director_id integer REFERENCES directors (id)
);

INSERT INTO directors_films (film_id, director_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 3),
(8, 7),
(9, 8),
(10, 4);


ALTER TABLE films DROP COLUMN director_id;

INSERT INTO films (title, year, genre, duration) VALUES
('Fargo', 1996, 'comedy', 98),
('No Country For Old Men', 2007, 'western', 122),
('Sin City', 2005, 'crime', 124),
('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors (name) VALUES
('Joel Coen'), ('Ethan Cohen'), ('Frank Miller'), ('Robert Rodriguez');

INSERT INTO directors_films (film_id, director_id) VALUES
(12, 9),
(13, 9),
(13, 10),
(14, 11),
(14, 12),
(15, 12)
;

SELECT films.title, directors.name FROM
films JOIN directors_films ON films.id = directors_films.film_id
JOIN directors ON directors_films.director_id = directors.id
ORDER BY films.title ASC;

SELECT directors.name AS director, count(films.id) AS films
FROM films JOIN directors_films ON films.id = directors_films.film_id
JOIN directors ON directors_films.director_id = directors.id
GROUP BY name
ORDER BY films DESC, director ASC;
