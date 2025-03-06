CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

-- composite index
CREATE INDEX idx_name ON employees(first_name, last_name);

--query 
SELECT * FROM employees WHERE first_name = 'Alice' AND last_name = 'Smith';
-- without index The database checks every row in the table (slow).
-- with Index: ✅ The database jumps directly to the row where first_name = 'Alice' and last_name = 'Smith'.

-- unique index
CREATE UNIQUE INDEX idx_employee_email ON employees(email);
INSERT INTO employees (email) VALUES ('alice@email.com');
INSERT INTO employees (email) VALUES ('alice@email.com');
-- The second query will fail.

-- full-text index
CREATE FULLTEXT INDEX idx_description ON products(description);

-- The database uses the full-text index to quickly find products that contain the word 'Laptop' in the description column.
SELECT * FROM products WHERE MATCH(description) AGAINST('Laptop');

-- drop index
DROP INDEX idx_firstname ON employees;

-- view index 
SELECT * FROM pg_indexes WHERE tablename = 'employees';