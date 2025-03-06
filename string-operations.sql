-- Converts a string to uppercase.
   SELECT UPPER(column1) FROM table1;

-- Converts a string to lowercase.
   SELECT LOWER(column1) FROM table1;

-- Concatenates two or more strings.
   SELECT CONCAT(column1, ' ', column2) FROM table1;
  
-- Removes leading and trailing spaces from a string.
   SELECT TRIM(column1) FROM table1;
  
-- Extracts a portion of a string.
   SELECT SUBSTRING(column1, 1, 3) FROM table1;

-- Replaces occurrences of a substring within a string.
   SELECT REPLACE(column1, 'old', 'new') FROM table1;
  