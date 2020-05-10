CREATE DATABASE web_host_billing;

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2)
);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer REFERENCES customers (id) ON DELETE CASCADE ,
  services_id integer REFERENCES services (id),
  UNIQUE(customer_id, service_id)
);

INSERT INTO customers (name, payment_token) VALUES
('Pat Johnson', 'XHGOAHEQ'),
('Nancy Monreal', 'JKWQPJKL'),
('Lynn Blake', 'KLZXWEEE'),
('Chen Ke-Hua', 'KWETYCVX'),
('Scott Lasko', 'UUEAPWPS'),
('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price) VALUES
('Unix Hosting', 5.95),
('DNS', 4.95),
('Whois Registration', 1.95),
('High Bandwidth', 15.00),
('Business Support', 250.00),
('Dedicated Hosting', 50.00),
('Bulk Email', 250.00),
('One-to-one Training', 999.00);

INSERT INTO customers_services (customer_id, services_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, NULL),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 3),
(5, 1),
(5, 2),
(5, 6),
(6, 1),
(6, 6),
(6, 7);


SELECT DISTINCT customers.name, customers.payment_token FROM
customers INNER JOIN customers_services on customers.id = customers_services.customer_id
WHERE customers_services.services_id IS NOT NULL;

SELECT DISTINCT customers.name, customers.payment_token FROM
customers LEFT OUTER JOIN customers_services on customers.id = customers_services.customer_id
WHERE customers_services.services_id IS NULL;

SELECT DISTINCT customers.name, customers.payment_token, services.description, services.price FROM
customers FULL OUTER JOIN customers_services on customers.id = customers_services.customer_id
FULL OUTER JOIN services ON customers_services.services_id = services.id
WHERE customers_services.services_id IS NULL OR customers.id IS NULL;

SELECT * FROM
customers LEFT OUTER JOIN customers_services on customers.id = customers_services.customer_id
FULL OUTER JOIN services ON customers_services.services_id = services.id;

SELECT services.description FROM
customers_services RIGHT OUTER JOIN services ON customers_services.services_id = services.id
WHERE customers_services.id IS NULL;

SELECT customers.name, string_agg(services.description, ', ') AS services
FROM customers LEFT JOIN customers_services on customers.id = customers_services.customer_id
LEFT JOIN services ON customers_services.services_id = services.id
GROUP BY customers.name;

SELECT services.description, count(customers_services.customer_id)
FROM services JOIN customers_services ON services.id = customers_services.services_id
GROUP BY services.id  /*or by description*/
HAVING count(customers_services.customer_id) >= 3
ORDER BY services.description;


SELECT
  CASE WHEN name = previous THEN NULL
       ELSE name
  END,
  description
FROM (
SELECT customers.name,
       lag(customers.name)
         OVER (ORDER BY customers.name)
         AS previous,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = services_id
) AS services_by_customer;
            -- select name, description from subquery the above
            --  if name and previous are teh same, then don't display name

SELECT
  CASE WHEN (lag(customers.name) OVER (ORDER BY customers.name)) = customers.name THEN NULL
  ELSE customers.name
  END
  , description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = services_id;

SELECT lag(customers.name) OVER (ORDER BY customers.name) FROM customers;

SELECT sum(services.price) AS gross FROM
customers_services INNER JOIN services ON customers_services.services_id = services.id;

INSERT INTO customers (name, payment_token) VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, services_id) VALUES
(8, 1), (8, 2), (8, 3);

SELECT sum(services.price)
FROM customers_services INNER JOIN services ON customers_services.services_id = services.id
WHERE services.price >= 100;

SELECT sum(price)
FROM customers CROSS JOIN services WHERE price > 100;

SELECT
  (SELECT sum(price) FROM services WHERE price > 100) *
  (SELECT count(id) FROM customers)
  AS projected;

DELETE FROM customers WHERE name = 'Chen Ke-Hua';
DELETE FROM customers_services WHERE services_id = 7;
DELETE FROM services WHERE description = 'Bulk Email';
