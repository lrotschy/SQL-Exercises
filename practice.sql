insert into singers (first_name, occupation, date_of_birth, deceased, last_name) values ('Frank', 'singer', '1915-12-12', true, 'Sinatra'), ('Madonna', 'singer', '1958-08-16', false, null), ('Prince', 'singer', '1958-06-07', true, null), ('Elvis', 'singer', '1935-08-01', true, 'Presley');

insert into singers (first_name, occupation, date_of_birth, deceased, last_name) values ('Frank', 'pooper', '1915-12-12', true, 'Sinatra'), ('Madonna', 'blather', '1958-08-16', false, null), ('Prince', 'singding', '1958-06-07', true, null), ('Elvis', 'artist', '1935-08-01', true, 'Presley');

-- sql_book
create table addresses (
  user_id int,
  street varchar(30) not null,
  city varchar(30) not null,
  state varchar(30) not null,
  primary key (user_id),
  foreign key (user_id) references users (id) on delete cascade
);

insert into addresses (user_id, street, city, state) values
(1, '1 Markey Street', 'San Francisco', 'CA'),
(2, '2 Elm Street', 'San Francisco', 'CA'),
(3, '3 Main Street', 'Boston', 'MA');

create table books (
id serial,
title varchar(100) not null,
author varchar(100) not null,
published_date timestamp not null,
isbn char(12),
primary key (id),
unique (isbn)
);

create table reviews (
id serial,
book_id integer not null,
reviewer_name varchar(255),
content varchar(255),
rating integer,
published_date timestamp default current_timestamp,
primary key (id),
foreign key (book_id) references books(id) on delete cascade
);

insert into books (id, title, author, published_date, isbn) values
  (1, 'My First SQL Book', 'Mary Parker', '2012-02-22 12:08:17.320053-03', '98148302912'),
  (2, 'My Second SQL Book', 'John Mayer', '1972-07-03 09:22:45.050088-07', '857300923713'),
  (3, 'My First SQL Book', 'Cary Flint', '2015-10-18 14:05:44.547516-07', '523120967812');

insert into reviews (id, book_id, reviewer_name, content, rating, published_date) values
  (1, 1, 'John Smith', 'My first review', 4, '2017-12-10 05:50:11.127281-02'),
  (2, 2, 'John Smith', 'My second review', 5, '2017-10-13 15:05:12.673382-05'),
  (3, 2, 'Alice Walker', 'Another review', 1, '2017-10-22 23:47:10.407569-07');


create table checkouts (
  id serial,
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

INSERT INTO checkouts (id, user_id, book_id, checkout_date, return_date) VALUES
  (1, 1, 1, '2017-10-15 14:43:18.095143-07', NULL),
  (2, 1, 2, '2017-10-05 16:22:44.593188-07', '2017-10-13 13:0:12.673382-05'),
  (3, 2, 2, '2017-10-15 11:11:24.994973-07', '2017-10-22 17:47:10.407569-07'),
  (4, 5, 3, '2017-10-15 09:27:07.215217-07', NULL);

-- encyclopedia
-- continents and countries
  CREATE TABLE continents (
    id serial,
    name varchar(50) NOT NULL,
    PRIMARY KEY (id)
  );

  ALTER TABLE countries
    DROP COLUMN continent,
    ADD COLUMN continent_id integer,
    ADD FOREIGN KEY (continent_id) REFERENCES continents(id) ON DELETE CASCADE;

  INSERT INTO continents (name) VALUES
    ('Africa'), ('Asia'), ('Europe'), ('North America'), ('South Africa');

  INSERT INTO countries (name, capital, population, continent_id) VALUES
    ('Brazil', 'Brasilia', 208385000, 5),
    ('Egypt', 'Cairo', 96308900, 1),
    ('France', 'Paris', 67178000, 3),
    ('Germany', 'Berlin', 82349400, 3),
    ('Japan', 'Tokyo', 126672000, 2),
    ('USA', 'Washington DC', 325365189, 4);

  -- singers and albums
CREATE TABLE albums (
  id serial PRIMARY KEY,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id int,
  FOREIGN KEY (singer_id) REFERENCES singers(id) ON DELETE CASCADE
);

ALTER TABLE singers
  ADD PRIMARY KEY (id);

INSERT INTO albums (album_name, released, genre, label, singer_id) VALUES
('Born to Run', '1975-08-25', 'Rock and roll', 'Columbia', 2),
('Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 11),
('Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 2),
('Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 10),
('True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 10),
('Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 12),
('Sign o'' the Times', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 11),
('G.I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 12);

-- ls_burger

CREATE TABLE customers (
  id serial PRIMARY KEY,
  customer_name varchar(100)
);

CREATE TABLE email_addresses (
  customer_id integer PRIMARY KEY,
  customer_email varchar(50),
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (customer_name) VALUES
  ('Natasha O''Shea'), ('James Bergman'), ('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email) VALUES
  (1, 'natasha@osheafamily.com'), (2, 'james1998@email.com');

CREATE TABLE products (
  id serial PRIMARY KEY,
  product_name varchar(50),
  product_cost numeric(4,2) DEFAULT 0,
  product_type varchar(20),
  product_loyalty_points int
);

INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points) VALUES
  ('LS Burger', 3.00, 'Burger', 10),
  ('LS Cheeseburger', 3.50, 'Burger', 15),
  ('LS Chicken Burger', 4.50, 'Burger', 20),
  ('LS Double Deluxe Burger', 6.00, 'Burger', 30),
  ('Fries', 1.20, 'Side', '3'),
  ('Onion Rings', 1.50, 'Side', 5),
  ('Cola', 1.5, 'Drink', '5'),
  ('Lemonade', 1.5, 'Drink', '5'),
  ('Vanilla Shake', 2.00, 'Drink', 7),
  ('Chocolate Shake', 2.00, 'Drink', 7),
  ('Strawberry Shake', 2.00, 'Drink', 7);

  DROP TABLE orders;

  CREATE TABLE orders (
    id serial PRIMARY KEY,
    customer_id int,
    order_status varchar(20),
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
  );

  -- CREATE TABLE order_items (
  --   order_id serial PRIMARY KEY,
  --   burger varchar(20),
  --   side varchar(20),
  --   drink varchar(20),
  --   FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
  -- );

CREATE TABLE order_items (
  id serial PRIMARY KEY,
  order_id integer,
  product_id integer,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
);

INSERT INTO orders (customer_id, order_status)
VALUES (1, 'In Progress'),
(2, 'Placed'),
(2, 'Complete'),
(3, 'Placed');

INSERT INTO order_items (order_id, product_id)
VALUES (1, 3),
(1, 5),
(1, 6),
(1, 8),
(2, 2),
(2, 5),
(2, 7),
(3, 4),
(3, 2),
(3, 5),
(3, 5),
(3, 6),
(3, 10),
(3, 9),
(4, 1),
(4, 5);

-- joins and multiple tables

encyclopedia=# select c.name, cc.name
encyclopedia-# from countries c join continents cc on (c.continent_id = cc.id);

select c.name, c.capital
from countries c join continents cc on (c.continent_id = cc.id)
where c.continent_id = 3;

select distinct singers.first_name
from singers join albums
on (singers.id = albums.singer_id)
where albums.label like '%Warner Bros%';

select singers.*, albums.*
from singers join albums on (singers.id = albums.singer_id);

select  s.first_name, s.last_name
from singers s join albums a on s.id = a.singer_id
where a.released >= '1980-01-01' and a.released < '1990-01-01' and s.deceased = false
order by s.date_of_birth;

-- ????
select distinct s.first_name, s.last_name order by s.date_of_birth
from singers s join albums a on s.id = a.singer_id
where a.released >= '1980-01-01' and a.released < '1990-01-01' and s.deceased = false

select s.first_name, s.last_name
from singers s left join albums a on s.id = a.singer_id
where a.album_name IS NULL;

select s.first_name, s.last_name from singers s
where s.id not in (select a.singer_id from albums a);


Connect to the ls_burger database. Return a list of all orders and their associated product items.

select orders.*, products.product_name
from orders
inner join order_items on orders.id = order_items.order_id
inner join products on (order_items.product_id = products.id);


select distinct orders.id as "orders that include fries"
from orders
inner join order_items on orders.id = order_items.order_id
where order_items.product_id = 5;

select distinct c.customer_name as "Customers who like fries"
from customers c
join orders o on o.customer_id = c.id
join order_items oi on o.id = oi.order_id
join products p on oi.product_id = p.id
where p.product_name like '%Fries%';

select sum(p.product_cost) from products p
join order_items oi on oi.product_id = p.id
join orders o on o.id = oi.order_id
join customers c on c.id = o.customer_id
where c.customer_name = 'Natasha O''Shea';

select p.product_name, count(oi.product_id)
from products p join order_items oi on p.id = oi.product_id
group by product_name;
