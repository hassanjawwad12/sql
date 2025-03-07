-- I have the following two tables:
-- 1. Lecturers (LectID, Fname, Lname, degree).
-- 2. Lecturers_Specialization (LectID, Expertise).
-- I want to find the lecturer with the most Specialization. 

-- When I try this, it is not working:
-- The issue is with the COUNT() function in the WHERE clause.
-- The COUNT() function is an aggregate function that only works with GROUP BY or HAVING.
-- You can't directly use COUNT() in the WHERE clause without grouping the rows first.
-- Without grouping, the COUNT() function doesn't know how to group the rows
SELECT
  L.LectID, 
  Fname, 
  Lname 
FROM Lecturers L, Lecturers_Specialization S
WHERE L.LectID = S.LectID
AND COUNT(S.Expertise) >= ALL (
SELECT COUNT(Expertise)
FROM Lecturers_Specialization
GROUP BY LectID);

--But when I try this, it works:

SELECT
  L.LectID,
  Fname,
  Lname 
FROM Lecturers L,Lecturers_Specialization S
WHERE L.LectID = S.LectID
GROUP BY L.LectID, Fname,Lname 
HAVING COUNT(S.Expertise) >= ALL (SELECT
COUNT(Expertise)
FROM Lecturers_Specialization
GROUP BY LectID); 
-- The GROUP BY clause groups the rows by LectID, Fname, and Lname.
-- The COUNT(S.Expertise) function works correctly because now SQL knows how to 
-- group the specializations.
-- The HAVING clause filters the groups based on the COUNT() value.
-- The ALL subquery checks if the lecturer's specialization count is greater than or 
-- equal to the highest specialization count.