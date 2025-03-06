-- Write a query to display the first_name, salary, and department_name of all employees 
-- who earn more than 55,000. Use an appropriate join.

SELECT e.first_name, e.salary, d.department_name
FROM employees e
JOIN departments d on e.department_id = d.department_id
WHERE e.salary > 55000;

-- Write a query to find the customer_name and city of customers who have placed orders with a 
-- total amount greater than 300. Use a nested query.

SELECT c.customer_name, c.city 
FROM customers c 
WHERE c.customer_id IN (
    SELECT o.customer_id 
    FROM orders o 
    GROUP BY o.customer_id 
    HAVING SUM(o.total_amount) > 300
);