
## SQL 
1. Explain the difference between inner, left outer, right outer joins
Tables are joined under a join condition, which specifies which columns of each table will be matched to form single rows. 

In an inner join, only those rows that match under the join condition are returned for each table. 

In a left outer join, all rows from the table specifed first (or to the left of the JOIN keywork) in the query are returned, regardless of whether they match the join condition. Only rows that match the join condition are returned for the table specified second (or to the right of the JOIN keyword) in the query. Rows returned in the left table that don't have a match will be given null values in the right table.

A right outer join is the same as a left outer join, mutatis mutandis.


3. Name and define the three sublanguages of sql
DDL: Data Definition Language. This language is used to specify the schema for a database and its tables. It is used to organize the structure of the database and determine the relationships that will exist between relations and the constraints on their attributes or columns.

Examples: `CREATE TABLE`, `DELETE TABLE`, `CREATE DATABASE`, `ALTER TABLE`, `ALTER COLUMN`

DML: Data Manipulation Language. This language is used to access and modify data. 

Examples: `SELECT`, `LIKE`, `WHERE`

DCL: Data Control Language. This language is used to determine what each user is allowed to do

Examples: `GRANT` `REVOKE`

5. Write sql statements using
  - insert -- adds rows of data -- DML
`INSERT INTO table (col, col) VALUES 
(x, y), (x, y), (x, y);`
  - delete -- removes data from tables from schema/structure -- DML
`DELETE FROM table;` removes all values
`DELETE FROM table WHERE name = 'value'` deletes a row
  - update -- sets value of single column, which can be narrowed down with other clauses to a subset of rows-- DML
`UPDATE table SET column = value WHERE...;`

  - create table--creates a new table and defines columns and their constraints and data types -- DDL
`CREATE TABLE table_name (
col_name data_type constraints
...
);`
  - alter table--changes schema by adding or dropping columns, adding or removing constraints, renaming column, renaming table, change datatype DDL
  `ALTER TABLE table_name` ....
  {`ALTER COLUMN col_name`
 ` RENAME TO name`
  `RENAME COLUMN col TO name`
  `ADD COLUMN name data_type constraint `
  `DROP COLUMN col_name}`
  `ADD CONSTRAINT constraint CHECK clause`
  `ALTER TABLE places ADD CHECK (length(name) > 3);`
}

  - drop table -- drops a table from the database DDL 
  `DROP TABLE table_name;`
  - add column -- adds column to table
 ` ALTER TABLE table ADD COLUMN col (name data constraints);`
  - alter column
  `ALTER COLUMN name TYPE data_type`
  `ALTER COLUMN col_name SET built_in constraint`
  `ALTER COLUMN col_name SET DEFAULT value`
  `ALTER COLUMN col_name DROP CONSTRAINT`
  `ALTER COLUMN col_name`  
  - drop column
  `ALTER TABLE table DROP COLUMN col;`

4. understand how to use 
- group by -- allows you to see aggregate results for subsets of rows
- order by -- allows you to order or sort results
- where -- allows you to narrow down results to a subset of rows
- having -- allows you to narrow down results to a subset of subsets of rows--used with group by

## PostgreSQL 
1. DEscribe what a sequence is and what they are used for.
- A sequence is "a special kind of relation that generates a series of numbers. It remembers the last generated and assigns the next"

A sequence is an SQL object that generates a series of numbers, keeping track of the last value and incrementing it by whatever number was specifed when it was created for the next value. Current value or next value can be accessed anywhere in the database.
 
Serial is a PostgreSQL datatype that creates a sequence and uses it to provide default values for a column. However, you must specify UNIQUE or PRIMARY KEY if you want them to be unique, otherwise you can use duplicate values by supplying them in the INSERT INTO ...VALUES clause rather than by default. Serial has a NOT NULL constraint built in. Because serial is a sequence, it can be accessed anywhere.

PRIMARY KEY is a constraint applied to a column. It is equivalent to NOT NULL and UNIQUE. Only one PRIMARY KEY column is allowed per table. It is generally regarded as good practice to have a PRIMARY KEY in every table, though it is not strictly required. PRIMARY KEYS can be assigned at the table-level and comprise a combination of columns e.g. (name, age)

3. Create an auto-incrementing column
Two ways: set the datatype to `serial` (add UNIQUE if you need it to be unique)
``` sql
CREATE TABLE table_name (
id serial 
);
```
or define a sequence and set the default value of the column to the next value of the sequence:
```sql 
CREATE SEQUENCE sequence_name;
CREATE TABLE table_name (
id integer DEFAULT nextval('sequence_name')
);
```

5. Define a default value for a column
`col_name data_type DEFAULT value,`

7. be able to describe the following:
8. 
- primary key: a unique, non-null identifier for rows in a table. Generally good practice to have a primary key in every table, conventionally called 'id'. Primary keys are often integers, but sometimes they are UUID (Universal Unique Identifiers). 

- Foreign key: an identifier for the primary key in a different table. Represents a relationship between tables. The table with the FK is the "many" side; the table with the PK is the "one" side.

- Natural key: a value that is unique and non-null that is not specified expressly for the purpose of a database but could be used as a primary key for a database--i.e. a fingerprint, social security number, driver's license number, product number, VIN, street address, phone number. Most of these are problematic as primary key 

- values because they can change or because they are not actually non-null or unique, so it is usually better to assign a surrogate key.

- surrogate key: a unique, non-null identifier for each row in a table created expressly for the purpose of identifying rows in a database table

9. Create and remove CHECK constraints
create a table with constraints on the column: 

```sql
CREATE TABLE table (
price numeric CHECK (price > 0)
);```



```sql
CREATE TABLE table (
price numeric CONSTRAINT price_check CHECK (price > 0)
);
```

create a table with table constraints: 

```sql
CREATE TABLE table (
price numeric ,
CHECK (price > 0)
);
```

```sql
CREATE TABLE table (
price numeric, 
CONSTRAINT price_check CHECK (price > 0)
);
```

change a table to add or drop constraints: 

`ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK (boolean with reference to column name);`

`ALTER TABLE practice_table ADD CONSTRAINT name_check CHECK (length(name) > 0);
`
`ALTER TABLE practice_table DROP CONSTRAINT name_check;`

10. Create and remove foreign key constraints 
`CREATE TABLE table (
foreign_key_id integer REFERENCES table (col)
);`

`CREATE TABLE table (
foreign_key_id integer,
FOREIGN KEY foreign_key_integer REFERENCES other_table (id) ON DELETE CASCADE
);`

`ALTER TABLE practice_table ADD FOREIGN KEY (people_id) REFERENCES people (id);`

`ALTER TABLE practice_table DROP CONSTRAINT practice_table_people_id_fkey;
`
`ALTER TABLE practice_table ADD CONSTRAINT fkey FOREIGN KEY (people_id) REFERENCES people (id);
`
`ALTER TABLE practice_table DROP CONSTRAINT fkey;
`


## Database Diagrams 
1. Define cardinality and modality
Cardinality is the number of items in one side of a relationship between entities. One, or many. 
Modality is whether or not the relationship is required or optional. 

3. Be able to draw database diagrams using crow's foot notation.
many is represented by the crow's foot, one by a single line. Required is represented by a straight line, optional by an open circle.
