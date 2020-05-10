/conninfo
\conninfo
\q
SELECT * FROM orders;
SELECT side FROM orders;
SELECT drink FROM orders;
SELECT customer_name, drink FROM orders;
SELECT drink, side FROM orders;
SELECT * FROM orders WHERE id = 1;
SELECT * FROM orders WHERE customer_name = Joyce Silva;
SELECT * FROM orders WHERE customer_name = "Joyce Silva"
;
SELECT * FROM orders WHERE customer_name = 'Joyce Silva'
;
SELECT customer_name FROM orders WHERE side = 'Fries';
SELECT customer_name FROM orders;
SELECT * FROM orders WHERE drink = 'Chocolate Shake';
SELECT burger, side, drink FROM orders WHERE id = 2;
SELECT customer_name FROM orders WHERE side = 'Onion Rings';
SELECT *;
\q
\list
CREATE DATABASE another_database.sql;
CREATE DATABASE another_database;
\list
\q
/list
\list
CREATE DATABASE yet_another_database;
\list
CREATE DATABASE yet_another_database;
\list
\c another_database 
\c yet_another_database 
DROP DATABASE another_database
\list
\list
DROP DATABASE another_database
\list
\q
\list
DROP DATABASE another_database;
\list
\q
CREATE DATABASE database_two;
\list
\c database_two
\l
DROP DATABASE database_two
;
\c database_one
DROP DATABASE database_two
;
\list
\q
\l
\q
\l
\c sql_book
CREATE TABLE users (
id serial UNIQUE NOT NULL,
username CHAR(25),
enabled boolean DEFAULT TRUE
);
SELECT * FROM users
;
\dt
\d users
\q
CREATE TABLE countries (
id serial,
name varchar(50) UNIQUE NOT NULL,
captal varchar(50) NOT NULL,
population integer
);
\dt
\d countries
CREATE TABLE famous_people (
id serial UNIQUE NOT NULL,
name varchar(100) NOT NULL,
occupation varchar(150),
date_of_birth varchar(50),
deceased boolean DEFAULT false
);
\dt
\d famous_people
CREATE TABLE animals (
id serial,
name varchar(100),
binomial_name varchar(100),
max_weight decimal(8, 3),
max_age integer,
conservation_status char(2)
);
\dt animals
\d animals
\dt
\d animals
CREATE DATABASE ls_burger;
\l
\c ls_burger
\dt
CREATE TABLE orders (
id serial,
customer_name varchar(100) NOT NULL,
burger varchar(50),
side varchar(50),
drink varchar(50),
order_total decimal(5, 2) NOT NULL
);
\dt orders
\d orders
\d users
\c sql_book
\d users
ALTER TABLE users
RENAME TO all_users/
;
RENAME TO all_users;
ALTER TABLE users;
ALTER TABLE users
RENAME TO all_users;
\dt
\d users
\d all_users
ALTER TABLE all_users
RENAME COLUMN username TO full_name;
\d all_users
ALTER TABLE all_users
ALTER COLUMN ful_name TYPE VARCHAR(25);
ALTER TABLE all_users
ALTER COLUMN full_name TYPE VARCHAR(25);
\d all_users
ALTER TABLE all_users
ALTER COLUMN full_name SET NOT NULL;
\d all_users
ALTER TABLE all_users
ALTER COLUMN id DROP DEFAULT;
\d all_users
ALTER TABLE all_users 
ADD COLUMN last_login timestamp NOT NULL DEFAULT NOW();
\d all_users
ALTER TABLE all_users DROP COLUMN enabled;
\d all_users
DROP TABLE all_users
/d
all_users
;
\d all_users;
DROP TABLE all_users;
\d all_users
\dt
\c encyclopedia
\dt
ALTER TABLE famous_people RENAME TO celebrities;
\dt
ALTER TABLE celebrities
RENAME COLUMN name TO first_name;
\d celebrities
ALTER TABLE celebrities
ALTER COLUMN first_name TYPE varchar(80)
;
\dt celebrities
\d celebrities
ALTER TABLE celebrities
ADD COLUMN last_name varchar(100) NOT NULL;
\d celebrities
ALTER TABLE celebrities
ALTER COLUMN date_of_birth TYPE timestamp USING date_of_birth::timestamp SET NOT NULL;
ALTER TABLE celebrities
ALTER COLUMN date_of_birth TYPE date USING date_of_birth::date, ALTER COLUMN date_of_birth SET NOT NULL;
\d celebrities
\d animals
alter table animals
ALTER COLUMN max_weight
SET decimal(6, 4);
ALTER TABLE animals
ALTER COLUMN max_weight
TYPE decimal(6, 4),
RENAME TO max_weight_kilograms;
ALTER TABLE animals
ALTER COLUMN max_weight TYPE decimal(6, 4);
\d animals
ALTER TABLE animals
ALTER COLUMN binomial_name SET UNIQUE;
ALTER TABLE animals
ADD CONSTRAINT unique_binomial_name UNIQUE(binomial_name);
\d animals
\c ls_burger
\dt
\d orders
ALTER TABLE orders
ADD COLUMN customer_email varchar(50),
ADD COLUMN customer_loyalty_points integer DEFAULT 0;
\d orders
ALTER TABLE
ADD COLUMN burger_cost decimal(4, 2) DEFAULT 0,
ADD COLUMN side_cost decimal(4, 2) DEFAULT 0,
ADD COLUMN drink_cost decimal(4, 2) DEFAULT 0;
ALTER TABLE orders
ADD COLUMN burger_cost decimal(4, 2) DEFAULT 0,
ADD COLUMN side_cost decimal(4, 2) DEFAULT 0,
ADD COLUMN drink_cost decimal(4, 2) DEFAULT 0;
\d orders
ALTER TABLE orders
DROP COLUMN order_total;
\d orders
\c sql_book
CREATE TABLE users (
id serial UNIQUE NOT NULL,
full_name character varying(25) NOT NULL,
enabled boolean DEFAULT true,
last_login timestamp wihtout time zone DEFAULT now()
);
last_login timestamp without time zone DEFAULT now()
);
sql_book=# CREATE TABLE users (
sql_book(# id serial UNIQUE NOT NULL,
sql_book(# full_name character varying(25) NOT NULL,
sql_book(# enabled boolean DEFAULT true,
sql_book(# last_login timestamp wihtout time zone DEFAULT now()
sq
CREATE TABLE users (
id serial UNIQUE NOT NULL,
full_name character varying (25) NOT NULL,
enabled boolean DEFAULT true,
last_login timestamp without time zone DEFAULT no()
;
);
)
\q
\d
CREATE TABLE users (
id serial UNIQUE NOT NULL,
full_name character varying(25) NOT NULL,
enabled boolean DEFAULT true,
last_login timestamp without time zone DEFAULT now(),
);
CREATE TABLE users (
id serial UNIQUE NOT NULL,
full_name character varying(25) NOT NULL,
enabled boolean DEFAULT true,
last_login timestamp without time zone DEFAULT now()
);
\d
\dt users
\d users
SELECT * from users;
INSERT INTO users (full_name, enabled) VALUES ('John Smith', false);
\d users
Select * from users
;
INSERT INTO users (full_name)
VALUES ('Jane Smith'), ('Harry Potter');
\d users
\dt users
SELECT * from users
;
ALTER TABLE users ADD CHECK (full_name <> '');
select * from users;
INSERT INTO users (id, full_name) VALUES (4, '');
\c encyclopedia
\dt
\d countries
\dt countries
ALTER TABLE countries
RENAME COLUMN captal to capital;
\dt countries
\d countries
INSERT INTO countries
VALUES (DEFAULT, 'France', 'Paris', 67158000);
\d countries
\dt countries
SELECT * FROM countries;
INSERT INTO countries
(name, capital, population)
VALUES ('USA', 'Washington D.C.', 325,365,189), ('Germany', 'Berlin', 82349400), ('Japan', 'Tokyo', 126672000);
INSERT INTO countriesINSERT INTO countri
INSERT INTO countries (name, capital, population)
VALUES ('USA', 'Washington D.C.', 325365189), ('Germany', 'Berlin', 82349400), ('Japan', 'Tokyo', 126672000);
insert into countries
(name, capital, population)
VALUES ('USA', 'Washington D.C.', 325365189), ('Germany', 'Berlin', 82349400), ('Japan', 'Tokyo', 126672000);
select * from countries
;
\dt celebrities
\d celebrities
insert into celebrities (first_name, occupation, date_of_birth, deceased, last_name)
values ('Bruce', 'singer and songwriter', 1949-09-23, f);
insert into celebrities
values (default, 'Bruce', 'singer and songwriter', 1949-09-23, false);
insert into celebrities
values (default, 'Bruce', 'singer and songwriter', Sep-23-1949, false);
insert into celebrities
values (default, 'Bruce', 'singer and songwriter', 'Sep-23-1949', false);
insert into celebrities
values (default, 'Bruce', 'singer and songwriter', '1949-09-23', false, 'Springsteen');
select * from celebrities
;
insert into celebrities
values (DEFAULT, 'Scarlett', 'actress', 'Nov-22-1984', DEFAULT, 'Johansson');
insert into celebrities
values (DEFAULT, 'Frank', 'Singer, actor', '1915-12-12', 'Sinatra'), 
(DEFAULT, 'Tom', 'actor', '1962-07-03', DEFAULT, 'Cruise');
\dt celebrities
\d celebrities
insert into celebrities (first_name, occupation, date_of_birth, deceased, last_name)
values ('Frank', 'singer', '1915-12-12', true, 'Sinatra'),
('Tom', 'actor', '1962-07-03', DEFAULT, 'Cruise');
select * from celebrities;
alter table celebrities alter column last_name DROP Constraint not null;
alter table celebrities alter column last_name drop not null;
\d celebrities
;
insert into celebrities (first_name, occupation, date_of_birth, deceased);
insert into celebrities (first_name, occupation, date_of_birth, deceased)
values ('Madonna', 'singer', '1958-08-16', false),
('Prince', 'singer', '1958-06-07', true);
select * from celebrities;
insert into celebrities
values ('Elvis', 'singer', '1935-08-01', NULL, 'Presley');
insert into celebrities
values (default, 'Elvis', 'singer', '1935-08-01', NULL, 'Presley');
select * from celebrities;
\dt animals
\d animals
alter table animals alter column binomial_name drop unique;
alter table animals alter column binomial_name drop unique_binomial_name;
alter table animals drop constraint unique_binomial_name;
insert into animals
values (default, 'dove', 'Columbidae Columbiformes', 2, 15, 'LC'),
(default, 'Golden Eagle', 'Aquila Chrysaetos', 6.35, 24, 'LC'),
(default, 'Peregrine Falcon', 'Falco Peregrinus', 1.5, 15, 'LC'),
(default, 'Pigeon', 'Columbidae Columbiformes', 2, 15, 'LC'),
(default, 'Kakapo', 'Strigops habroptila', 4, 60, 'CR');
select * from animals
;
\c  ls_burger
\d orders
insert into orders (customer_name, burger, side, drink, customer_email, customer_loyalty_points, burger_cost, side_cost, drink_cost)
values ('James Bergman', 'LS Burger', 'Fries', 'Cola', 'james1998@email.com', 18, 3, .99, 1.5);
insert into orders (customer_name, burger, side, drink, customer_email, customer_loyalty_points, burger_cost, side_cost, drink_cost)
values ('Natasha O''Shea', 'LS Cheeseburger', 'fries', null, 'natasha@osheafamily.com', 18, 3.5, .99, null),
('Natasha O''Shea', 'LS Double Deluxe Burger', 'onion rings', 'chocolate shake', 'natasha@osheafamily.com', 42, 6, 1.5, 2),
('Aaron Muller', 'LS burger', null, null, null, 10, 3, null, null);
select * from orders;
select side, burger from order where customer_loyalty_point > 10;
select side, burger from orders where customer_loyalty_points > 10;
select side, burger from orders where customer_loyalty_points < 20;
\c sql_book
select * from users
;
\d 
select full_name, enables from users
order by enabled;
select full_name, enabled from users
order by enabled;
select full_name from users
order by last_login;
select full_name from users
order by full_name;
select enabled, full_name from users
order by full_name;
select full_name from users
order by full_name desc;
SELECT * from users where full_name = 'Harry Potter' or full_name = 'Jane Smith';
SELECT * from users where full_name = 'Harry Potter' or full_name = 'jane smith';
select * from users where full_name LIKE '%Smith';
select * from users where full_name LIKE '_Smith';
select * from users where full_name LIKE '_o';
select * from users where full_name LIKE '%o';
\c encyclopedia
select population from countries where country = 'USA';
\dt countries
\d countries
select population from countries where name = 'USA';
select population, capital from countries 
;
select name from countries order by name;
select name, capital from countries order by population ASC;
select name, capital from countries order by population desc;
select name, binomial_name, max_weight_kg, max_age_years from animals 
order by max_age, max_weight_kg;
\d animals
select name, binomial_name, max_weight, max_age from animals
order by max_age, max weight;
select name, binomial_name, max_weight, max_age from animals
order by max_age, max_weight;
select name from countries where population > 70000000;
select name from countries where population > 70000000 and population < 200000000;
select first_name, last_name from celebrities wehre deceased = false;
select first_name, last_name from celebrities where deceased = false;
select first_name, last_name from celebrities where deceased != true;
select first_name from celebrities where deceased != true or deceased IS NULL:
select first_name from celebrities where deceased <> true or deceased IS NULL;
select first_name from celebrities where deceased <> true or deceased IS NULL;
select first_name, last_name from celebrities where occupation LIKE '%singer' or occupation LIKE '%Singer';
select first_name from celebrities where occupation LIKE '%singer%' or occupation LIKE '$Singer%';
select * from celebrities;
select name from celebrities where occupation = 'actor';
select first_name from celebrities where occupation = 'actor';
select first_name, last_name from celebrities where occupation LIKE '%actor%' AND occupation LIKE '%singer%';
select first_name from celebrities where occupation = 'actor' or occupation = 'singer' and date_of_birth < 1959;
select first_name from celebrities where occupation = 'singer' or occupation = 'actor' and deceased = false;
select first_name from celebrities where occupation = 'singer' or occupation = 'actor' and deceased = null;
\c ls_burger
\d ls_burger
\dt ls_burger
\s orders
