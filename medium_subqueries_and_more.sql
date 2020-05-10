CREATE DATABASE auction;

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) NOT NULL,
  sales_price numeric(6, 2)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders (id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items (id) ON DELETE CASCADE,
  amount numeric(6, 2) NOT NULL
);

CREATE INDEX bidder_item_idx ON bids (bidder_id, item_id);

-- You have to be in the right directory before you connect to psql.  Duh.

-- \copy bidders from '/Users/lielarotschy/Documents/Programming/BackEnd/180/Exercises/bidders.csv' WITH HEADER CSV;
\copy bidders from 'bidders.csv' WITH HEADER CSV;

-- \copy items from '/Users/lielarotschy/Documents/Programming/BackEnd/180/Exercises/items.csv' WITH HEADER CSV;
\copy items from 'items.csv' WITH HEADER CSV;

-- \copy bids from '/Users/lielarotschy/Documents/Programming/BackEnd/180/Exercises/bids.csv' WITH HEADER CSV;
\copy bids from 'bids.csv' WITH HEADER CSV;

SELECT name as "Bid-on Items" FROM items WHERE id IN (SELECT DISTINCT item_id FROM bids);

SELECT name as "Not Bid-on" FROM items WHERE id NOT IN (SELECT DISTINCT item_id FROM bids);

SELECT name FROM bidders WHERE EXISTS (SELECT 'pineapple' FROM bids WHERE bids.bidder_id = bidders.id);

SELECT DISTINCT bidders.name FROM bidders RIGHT JOIN bids ON bidders.id = bids.bidder_id;

SELECT name FROM items WHERE ANY (SELECT bids.item_id from bids where bids.amount < 100)

SELECT items.name AS "Bids Less Than 100 Dollars" FROM items WHERE 100 > ANY
(SELECT bids.amount FROM bids WHERE bids.item_id = items.id);

SELECT items.name AS "Bids Less Than 100 Dollars" FROM items WHERE 100 > ALL
(SELECT bids.amount FROM bids WHERE bids.item_id = items.id);

SELECT items.name AS "Bids Less Than 100 Dollars" FROM items WHERE 100 > ALL
(SELECT bids.amount FROM bids WHERE bids.item_id = items.id) AND
EXISTS (SELECT 1 FROM bids WHERE bids.item_id = items.id);

-- THis returns the one item with no bids ????
SELECT items.name AS "Bids Less Than 100 Dollars" FROM items WHERE 100 > ALL
(SELECT bids.amount FROM bids WHERE
EXISTS (SELECT 1 FROM bids WHERE bids.item_id = items.id));
-- This returns no items ????
SELECT items.name AS "Bids Less Than 100 Dollars" FROM items WHERE 100 > ALL
(SELECT bids.amount FROM bids JOIN items ON bids.item_id = items.id
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.item_id = items.id));

Find largest number of bids from an individual bidder
SELECT max(bids_count.count) FROM
(SELECT count(bids.id) AS count , bidders.name FROM bids JOIN bidders on bids.bidder_id = bidders.id
GROUP BY bidders.name) AS bids_count;

SELECT max(count) FROM
(SELECT count(id) FROM bids GROUP BY bidder_id) AS bids_count;

SELECT name, (SELECT count(id) FROM bids WHERE bids.bidder_id = bidders.id) FROM bidders;

SELECT name, (SELECT count(id) FROM bids WHERE bids.item_id = items.id) FROM items;

SELECT items.name, count(bids.item_id)
FROM items LEFT OUTER JOIN bids on items.id = bids.item_id
GROUP BY items.name;

SELECT id FROM items WHERE row(name, initial_price, sales_price) = ('Painting', 100.00, 250.00);

/*
EXPLAIN and ANALYZE
From reading the documentation, it appears that both commands are NOT SQL statements. If that is true, the only SQL statement was the SELECT query.

When I ran EXPLAIN plus the query, it returned an estimate that the startup cost would be 33.38 and the total cost would be 66.47. It estimated 635 rows, which I find confusing since there are only a few rows in the table. It planned to do a sequential scan on all rows in the bids table and then group them by bidder_id. It would then execute a sequential scan of bidders.

ANALYZE gave the additional information that the actual time was .194 ms to start up and .146 ms to execute. The actual number of rows was 16.


In the first query, the total cost is 37.16, and the actual time is .137 ms. In the second,
the cost is 35.65, and the actual time is .162. So second is less efficient.

*/

SELECT name from bidders where id NOT IN (SELECT id from bidders where id > 2 and id < 6);
