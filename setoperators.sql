--Combines results of two queries and removes duplicates.
   SELECT column1 FROM table1
   UNION
   SELECT column1 FROM table2;

-- Combines results of two queries and keeps duplicates.
   SELECT column1 FROM table1
   UNION ALL
   SELECT column1 FROM table2;

-- Returns common rows from two queries.
   SELECT column1 FROM table1
   INTERSECT
   SELECT column1 FROM table2;

-- Returns rows from the first query that are not in the second query.
   SELECT column1 FROM table1
   EXCEPT
   SELECT column1 FROM table2;
