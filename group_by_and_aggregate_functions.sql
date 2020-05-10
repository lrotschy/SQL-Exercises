INSERT INTO films (title, year, genre, director, duration) VALUES
('Wayne''s World', '1992', 'comedy', 'Penelope Spheeris', 95),
('Bourne Identity', '2002', 'espionage', 'Doug Liman', 118);

SELECT DISTINCT genre FROM films;

SELECT genre FROM films GROUP BY genre;

SELECT ROUND(AVG(duration)) FROM films;

SELECT genre, ROUND(AVG(duration)) AS average_duration FROM films GROUP BY genre;

SELECT EXTRACT(DECADE FROM year::date) AS decade, ROUND(AVG(duration)) AS average_duration FROM films GROUP BY decade;

SELECT (year/10)*10 AS decade, ROUND(AVG(duration)) AS average_duration
FROM films
GROUP BY decade
ORDER BY decade;

SELECT title FROM FILMS WHERE director LIKE 'John%';
SELECT title FROM FILMS WHERE SUBSTRING(director FROM '#"____#" %' FOR '#') = 'John';


--This one doesn't return correctly for example below:
SELECT title FROM FILMS WHERE SUBSTRING(director FROM '#"%#" %' FOR '#') = 'John';
SELECT SUBSTRING('John Wilden Hughes, Jr.' FROM '^#"%#" %' FOR '#');
--It returns everything up to Jr.

SELECT genre, count(id) FROM FILMS GROUP BY genre ORDER BY count DESC;

SELECT (year/10)*10 AS decade, genre, title AS films FROM films
GROUP BY decade, genre ORDER BY decade, genre;

SELECT (year/10*10) AS decade, genre, string_agg(title, ',') AS films
FROM films
GROUP BY decade, genre ORDER BY decade, genre;

SELECT genre, sum(duration) AS total_duration FROM films GROUP BY genre ORDER BY total_duration ASC;
