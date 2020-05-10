ALTER TABLE orders ADD CONSTRAINT fk_products
FOREIGN KEY (product_id) REFERENCES products(id);

INSERT INTO products (name) VALUES
('small bolt'), ('large bolt');

INSERT INTO orders (product_id, quantity) VALUES
(1, 10), (1, 25), (2, 15);

SELECT o.quantity, p.name AS products FROM orders AS o JOIN products AS p ON o.product_id = p.id;

INSERT INTO orders (product_id, quantity) VALUES (NULL, 2);

ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;

DELETE FROM orders WHERE quantity = 2;

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  product_id integer REFERENCES products(id),
  body text NOT NULL
);

INSERT INTO reviews (body, product_id) VALUES
('a little small', 1),
('very round!', 1),
('could have been smaller', 2);
