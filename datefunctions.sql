
-- Returns the current date and time.
   SELECT NOW();
  
-- Returns the current date.
   SELECT CURRENT_DATE();
  
-- Formats a date as specified.
   SELECT DATE_FORMAT(date_column, '%Y-%m-%d') FROM table1;

-- Returns the difference in days between two dates.
   SELECT DATEDIFF(date1, date2) FROM table1;

-- Extracts the year from a date.
   SELECT YEAR(date_column) FROM table1;

-- Extracts the month from a date.
  SELECT MONTH(date_column) FROM table1;
   
 --Extracts the day from a date.
   SELECT DAY(date_column) FROM table1;
   