-- 1. Select all employees with a salary greater than 50000. and  belongs to the department HR.
-- OR 
-- 2. Select all employees who belong to the department Engineering.
SELECT * 
FROM employees 
WHERE (salary > 50000 AND department = 'HR') 
   OR department = 'Engineering';


-- If the employees table contains the following data:

-- id	first_name	salary	department
-- 1	John	60000	HR
-- 2	Jane	45000	HR
-- 3	Alice	70000	Engineering
-- 4	Bob	55000	Sales
-- 5	Charlie	80000	Engineering

-- The query will return:

-- id	first_name	salary	department
-- 1	John	60000	HR
-- 3	Alice	70000	Engineering
-- 5	Charlie	80000	Engineering
