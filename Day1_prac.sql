CREATE TABLE customer1 (
   customer_id serial PRIMARY KEY,
   first_name character varying(100) NOT NULL,
   last_name character varying(100) NOT NULL,
   email character varying(255) UNIQUE NOT NULL,
   created_date timestamp with time zone NOT NULL DEFAULT now(),
   updated_date timestamp with time zone
);

DROP TABLE IF EXISTS customer;


-- Add New Column
ALTER TABLE customer1 ADD COLUMN active boolean;


-- Drop New Column
ALTER TABLE customer1 DROP COLUMN active;

-- After Delete Column - Select Statement
SELECT * from customer1

-- Rename Existing Column
ALTER TABLE customer1 RENAME COLUMN email TO email_address;

-- Select Statement
SELECT * from customer1

ALTER TABLE customer1 RENAME COLUMN email_address TO email;

-- Rename table name
ALTER TABLE customer1 RENAME TO users;





-- Create New Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES customer1(customer_id),
    order_date timestamp with time zone NOT NULL DEFAULT now(),
    order_number CHARACTER VARYING(50) NOT NULL,
    order_amount DECIMAL(10,2) NOT NULL
);








-- Insert Single Customer Record
INSERT INTO customer1(first_name, last_name, email, created_date, updated_date, active)
	VALUES ('Bansi','Sachade','.bansi.sachade@tatvasoft.com',now(),NULL,true);

-- Insert Multiple Customer Records	
INSERT INTO customer1 (first_name, last_name, email, created_date, updated_date,active) VALUES
  ('John', 'Doe', 'johndoe@example.com', NOW(), NULL,true),
  ('Alice', 'Smith', 'alicesmith@example.com', NOW(), NULL,true),
  ('Bob', 'Johnson', 'bjohnson@example.com', NOW(), NULL,true),
  ('Emma', 'Brown', 'emmabrown@example.com', NOW(), NULL,true),
  ('Michael', 'Lee', 'michaellee@example.com', NOW(), NULL,false),
  ('Sarah', 'Wilson', 'sarahwilson@example.com', NOW(), NULL,true),
  ('David', 'Clark', 'davidclark@example.com', NOW(), NULL,true),
  ('Olivia', 'Martinez', 'oliviamartinez@example.com', NOW(), NULL,true),
  ('James', 'Garcia', 'jamesgarcia@example.com', NOW(), NULL,false),
  ('Sophia', 'Lopez', 'sophialopez@example.com', NOW(), NULL,false),
  ('Jennifer', 'Davis', 'jennifer.davis@example.com', NOW(), NULL,true),
  ('Jennie', 'Terry', 'jennie.terry@example.com', NOW(), NULL,true),
  ('JENNY', 'SMITH', 'jenny.smith@example.com', NOW(), NULL,false),
  ('Hiren', 'Patel', 'hirenpatel@example.com', NOW(), NULL,false);
  
-- Insert Customer Order Records
INSERT INTO orders (customer_id, order_date, order_number, order_amount) VALUES
  (1, '2024-01-01', 'ORD001', 50.00),
  (2, '2024-01-01', 'ORD002', 35.75),
  (3, '2024-01-01', 'ORD003', 100.00),
  (4, '2024-01-01', 'ORD004', 30.25),
  (5, '2024-01-01', 'ORD005', 90.75),
  (6, '2024-01-01', 'ORD006', 25.50),
  (7, '2024-01-01', 'ORD007', 60.00),
  (8, '2024-01-01', 'ORD008', 42.00),
  (9, '2024-01-01', 'ORD009', 120.25),
  (10,'2024-01-01', 'ORD010', 85.00),
  (1, '2024-01-02', 'ORD011', 55.00),
  (1, '2024-01-03', 'ORD012', 80.25),
  (2, '2024-01-03', 'ORD013', 70.00),
  (3, '2024-01-04', 'ORD014', 45.00),
  (1, '2024-01-05', 'ORD015', 95.50),
  (2, '2024-01-05', 'ORD016', 27.50),
  (2, '2024-01-07', 'ORD017', 65.75),
  (2, '2024-01-10', 'ORD018', 75.50);

-- Select Statement
SELECT customer_id, first_name, last_name, email, created_date, updated_date, active
FROM customer1;
  
-- Update Statement
UPDATE customer1
SET first_name='bansi',
last_name='sachade', 
email='bansi.sachade@tatvasoft.com'
WHERE customer_id = 1;
	
-- Delete Statement
DELETE FROM customer1
WHERE customer_id = 11;


PostgreSQL SELECT examples

1) Using PostgreSQL SELECT statement to query data from one column example

SELECT first_name FROM customer1;

2) Using PostgreSQL SELECT statement to query data from multiple columns example

SELECT
   first_name,
   last_name,
   email
FROM
   customer1;

3) Using PostgreSQL SELECT statement to query data from all columns of a table example

SELECT * FROM customer1;


PostgreSQL ORDER BY examples

1) Using PostgreSQL ORDER BY clause to sort rows by one column

SELECT
	first_name,
	last_name
FROM
	customer1
ORDER BY
	first_name ASC;

2) Using PostgreSQL ORDER BY clause to sort rows by one column in descending order

SELECT
       first_name,
       last_name
FROM
       customer1
ORDER BY
       last_name DESC;

3) Using PostgreSQL ORDER BY clause to sort rows by multiple columns

SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer1
ORDER BY
	first_name ASC,
	last_name DESC;
    
    
    PostgreSQL WHERE

1) Using WHERE clause with the equal (=) operator example

SELECT
	last_name,
	first_name
FROM
	customer1
WHERE
	first_name = 'Hiren';
	
2) Using WHERE clause with the AND operator example

SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer1
WHERE
	first_name = 'Hiren' AND last_name = 'Parejiya';
	
3) Using WHERE clause with the IN operator example

SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer1
WHERE first_name IN ('John','David','James');


4) PostgreSQL LIKE
-- LIKE operator matches value case-sensitively.

SELECT
	first_name,
    last_name
FROM
	customer1
WHERE
	first_name LIKE '%EN%';
	
	
5) PostgreSQL ILIKE
-- ILIKE operator matches value case-insensitively.

SELECT
	first_name,
    last_name
FROM
	customer1
WHERE
	first_name LIKE '%EN%';
    
    








