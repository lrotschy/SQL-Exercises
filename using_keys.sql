INSERT INTO films VALUES
('Godzilla', 1998, 'scifi', 'Roland Emmerich', 139),
('Godzilla', 2014, 'scifi', 'Gareth edwards', 123);

CREATE SEQUENCE counter;
SELECT nextval('counter');
DROP SEQUENCE counter;
CREATE SEQUENCE counter
  INCREMENT BY 2
  START WITH 2;
