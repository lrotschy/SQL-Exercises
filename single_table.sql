CREATE TABLE people (
  name varchar(50),
  age integer,
  occupation varchar(50)
);

INSERT INTO people (name, age, occupation)
     VALUES ('Abby', 34, 'biologist'),
            ('Mu''nisah', 26, NULL),
            ('Mirabelle', 40, 'contractor');

SELECT * FROM people WHERE name = 'Mu''nisah';
SELECT * FROM people WHERE age = 26;
SELECT * FROM people ORDER BY age ASC LIMIT 1;
SELECT * FROM people WHERE occupation IS NULL;

CREATE TABLE birds (
  name varchar(50),
  length decimal(3,1),
  wingspan decimal(3,1),
  family varchar(50),
  extinct boolean
);

INSERT INTO birds
     VALUES ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
            ('American Robin', 25.5, 36.0, 'Turdidae', false),
            ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
            ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
            ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

  SELECT name, family FROM birds
   WHERE extinct = false
ORDER BY length DESC;

SELECT avg(wingspan) AS "Average Wingspan" FROM birds;
SELECT min(wingspan) FROM birds;
SELECT max(wingspan) FROM birds;
SELECT round(avg(wingspan)) AS "Average", min(wingspan) AS "Minimum", max(wingspan) AS "Maximum";

CREATE TABLE menu_items (
  item varchar(25),
  prep_time integer,
  ingredient_cost decimal(4,2),
  sales integer,
  menu_price decimal(4,2)
);

INSERT INTO menu_items VALUES
('omelette', 10, 1.5, 182, 7.99),
('tacos', 5, 2.0, 254, 8.99),
('oatmeal', 1, .5, 79, 5.99);

SELECT item, (menu_price - ingredient_cost) AS profit FROM menu_items
ORDER BY profit DESC LIMIT 1;

SELECT item, menu_price, ingredient_cost, round((13.0/60.0) * prep_time, 2) AS labor, round((menu_price - ((13.0/60.0) * prep_time) + ingredient_cost), 2) AS profit
FROM menu_items
ORDER BY profit DESC;
