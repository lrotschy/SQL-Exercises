SELECT books.id, books.author, string_agg(categories.name, ', ')
FROM books JOIN books_categories ON books.id = books_categories.book_id
JOIN categories ON books_categories.category_id = categories.id
GROUP BY books.id;

-- Lynn Sherr	Sally Ride: America's First Woman in Space	Biography, Nonfiction, Space Exploration
-- Charlotte Brontë	Jane Eyre	Fiction, Classics
-- Meeru Dhalwala and Vikram Vij	Vij's: Elegant and Inspired Indian Cuisine	Cookbook, Nonfiction, South Asia

ALTER TABLE books ALTER COLUMN title TYPE text;

INSERT INTO categories (name) VALUES
('Space Exploration'), ('Cookbook'), ('South Asian');

INSERT INTO books (title, author) VALUES
('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
('Jane Eyre', 'Charlotte Bronte'),
('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');

INSERT INTO books_categories VALUES
(4, 5), (4, 1), (4, 7),
(5, 2), (5, 4),
(6, 8), (6, 9), (6, 1);

ALTER TABLE books_categories ADD CONSTRAINT SET UNIQUE (book_id, category_id);
ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);

SELECT categories.name, count(books_categories.category_id) AS books_count, string_agg(books.title, ', ') AS book_titles 
FROM categories JOIN books_categories ON categories.id = books_categories.category_id
JOIN books ON books_categories.book_id = books.id
GROUP BY categories.name;
