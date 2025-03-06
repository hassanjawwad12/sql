-- A scalar subquery returns only one value.
--Get employees whose salary is greater than the average salary.
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--A table subquery returns multiple rows that are used with IN, ANY, or ALL.
-- The subquery gets all department IDs where the department name is HR.
-- The outer query selects employees whose department_id matches those IDs.
SELECT first_name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name = 'HR'
);

-- Find employees whose salary is greater than any salary in the 'HR' department.
-- The ANY operator checks if the condition is true for any value in the subquery.
-- This query returns employees whose salary is greater than at least one salary in the 'HR' department.
SELECT first_name
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE department_name = 'HR'
    )
);

--Find employees whose salary is greater than all salaries in the 'HR' department.
-- The ALL operator checks if the condition is true for all values in the subquery.
-- This query returns employees whose salary is greater than every salary in the 'HR' department.
SELECT first_name
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE department_name = 'HR'
    )
);

--A Correlated Subquery uses values from the outer query inside the subquery.
-- The subquery calculates the average salary for each employee's department.
-- The outer query compares the employee's salary to the department's average salary.
SELECT e.first_name, e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

--Subquery with EXISTS
-- Get all departments that have at least one employee.
SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- Get all departments with no employees.
SELECT department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

--Get employee names and their department names in one query.
SELECT first_name,
       (SELECT department_name FROM departments WHERE department_id = e.department_id) AS department_name
FROM employees e;

