START TRANSACTION;

-- Step 1: Update salaries with nested subquery
UPDATE employees e
SET e.salary = e.salary * 1.10
WHERE e.salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = 2
)
AND e.department_id = 2
RETURNING e.employee_id, OLD.salary, e.salary;

-- Step 2: Insert updated salaries into the log table
INSERT INTO salary_log (employee_id, old_salary, new_salary)
SELECT employee_id, salary / 1.10, salary
FROM employees
WHERE department_id = 2
AND salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = 2
);

-- Step 3: Commit or Rollback
IF (SELECT COUNT(*) FROM salary_log WHERE change_date = NOW()) > 0 THEN
    COMMIT;
    SELECT 'Transaction Successful' AS Status;
ELSE
    ROLLBACK;
    SELECT 'Transaction Failed: No Employees Updated' AS Status;
END IF;
