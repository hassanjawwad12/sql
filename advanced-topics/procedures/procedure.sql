--Imagine you're building a Company Payroll System**.
--Instead of writing this query every time:

SELECT first_name, salary FROM employees WHERE department = 'IT';

--You can create a procedure like this:
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT first_name, salary 
    FROM employees
    WHERE department = dept_name;
END;

CALL GetEmployeesByDept('IT');