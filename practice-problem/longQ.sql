-- Write an SQL query to display the customer name, country, and the total amount of 
-- completed orders for each customer where:
-- The country is 'USA' (WHERE with Nested Subquery on the Customers table).
-- Only completed orders should be considered (WHERE on the Orders table).
-- Group the data by CustomerName and Country (GROUP BY).
-- Show only those customers whose total completed order amount is greater than 
-- the average total amount of their own country 
-- Sort the results by Total Amount in descending order (ORDER BY).
-- SELECT c.CustomerName, c.Country, SUM(o.Amount) AS TotalAmount

SELECT c.CustomerName, c.Country, SUM(o.Amount) AS TotalAmount
FROM Customers c join Orders o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA' AND o.Status = 'Completed'
GROUP BY c.CustomerName, c.Country
-- In your HAVING clause, SQL expects the subquery to return a 
-- single scalar value (one number) — not multiple rows.
HAVING SUM(o.Amount) > (
    SELECT AVG(o.Amount)
    FROM Customers c join Orders o
    ON c.CustomerID = o.CustomerID
    WHERE c.Country = 'USA' AND o.Status = 'Completed'
   -- GROUP BY c.Country
)
ORDER BY TotalAmount DESC;