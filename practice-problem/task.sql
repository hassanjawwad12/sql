-- Orders
-- OrderID	CustomerID	Amount	OrderDate	Status
-- 101	1	500	2024-06-10	Completed
-- 102	2	1500	2024-06-12	Pending
-- 103	3	700	2024-06-11	Completed
-- 104	1	2000	2024-06-15	Completed
-- 105	2	800	2024-06-13	Completed
-- Customers
-- CustomerID	CustomerName	Country
-- 1	Alice	USA
-- 2	Bob	Canada
-- 3	Charlie	USA

-- Task:
-- Write an SQL query to display the customer name, country, and the 
-- total amount of completed orders for each customer where:
-- The country is 'USA'.
-- Only completed orders should be considered (WHERE).
-- Group the data by CustomerName and Country (GROUP BY).
-- Show only those customers whose total completed order amount is greater than 1000 (HAVING).
-- Sort the results by Total Amount in descending order (ORDER BY).

SELECT c.CustomerName, c.Country, SUM(o.Amount) AS TotalAmount
FROM Customers c join Orders o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND o.Status = 'Completed'
GROUP BY c.CustomerName, c.Country
HAVING SUM(o.Amount) > 1000
ORDER BY TotalAmount DESC;