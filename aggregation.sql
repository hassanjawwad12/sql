-- Count the number of employees in the `HR` department:
SELECT COUNT(*) AS hr_employees
FROM employees
WHERE department = 'HR';

--Calculate the total salary for employees in the `Engineering` department:
SELECT SUM(salary) AS engineering_total_salary
FROM employees
WHERE department = 'Engineering';

--Calculate the average salary for employees in the `Sales` department:
SELECT AVG(salary) AS sales_average_salary
FROM employees
WHERE department = 'Sales';

--Find the highest salary in the `Finance` department:
SELECT MAX(salary) AS finance_highest_salary
FROM employees
WHERE department = 'Finance';

--Find the lowest salary in the `IT` department:
SELECT MIN(salary) AS it_lowest_salary
FROM employees
WHERE department = 'IT';

--Get the total number of employees, their average salary, and the highest and lowest salaries:
SELECT 
  COUNT(*) AS total_employees,
  AVG(salary) AS average_salary,
  MAX(salary) AS highest_salary,
  MIN(salary) AS lowest_salary
FROM employees;

--Calculate the total salary and average salary for each department:
SELECT 
  department,
  SUM(salary) AS total_salary,
  AVG(salary) AS average_salary
FROM employees
GROUP BY department;

--Find departments where the total salary is greater than 60,000:
Find departments where the average salary is greater than 60,000:
SELECT 
  department,
  AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

