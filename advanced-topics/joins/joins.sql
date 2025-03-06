-- INNER JOIN returns only the rows where there is a match between both tables.
-- Get all employees with their department names.
SELECT e.first_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- LEFT JOIN returns all rows from the left table + matching rows from the right table.
-- If no match is found, it fills unmatched columns with NULL.
-- Get all employees with their department names (even if they don't have a department).
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;


-- RIGHT JOIN returns all rows from the right table + matching rows from the left table.
-- Get all departments and their employees.
SELECT d.department_name, e.first_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- FULL JOIN returns all records from both tables (both matching and unmatched rows).
-- Get all employees and their department names.
SELECT e.first_name, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.department_id;

-- A SELF JOIN joins a table with itself.
-- Find employees with their managers.
SELECT e.first_name AS Employee, m.first_name AS Manager
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;

-- A CROSS JOIN returns all possible combinations between two tables.
-- Get all employees with all departments.
SELECT e.first_name, d.department_name
FROM employees e
CROSS JOIN departments d;

