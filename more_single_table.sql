psql -d residents < residents_with_data.sql

10 states with most rows in people table
SELECT state, count(id) from people group by state order by count(id) DESC limit 10;



SELECT substr(email, strpos(email, '@') + 1) as domain, COUNT(id)
FROM people GROUP BY domain ORDER BY count DESC;

SELECT substring(email FROM '%#"@%#"' FOR '#') FROM people LIMIT 10; ???

select substring(email FROM '%@#"%#"' FOR '#') FROM people LIMIT 10;

  SELECT substring(email FROM '%@#"%#"' FOR '#') AS domain, count(id)
    FROM people
GROUP BY domain
ORDER BY count(id) DESC;

DELETE FROM people WHERE id = 3999;

DELETE FROM people WHERE state = 'CA';


DELETE FROM people;
