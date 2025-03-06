SELECT column1,
       CASE
         WHEN column1 > 100 THEN 'High'
         WHEN column1 > 50 THEN 'Medium'
         ELSE 'Low'
       END AS result
FROM table1;