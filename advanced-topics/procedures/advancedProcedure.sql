CREATE PROCEDURE GetAvgSalaryByDept(
    IN dept_name VARCHAR(50),
    OUT avg_salary DECIMAL(10,2)
)
BEGIN
    -- Check if dept_name is NULL or empty
    IF dept_name IS NULL OR dept_name = '' THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Invalid department name. Please provide a valid department name.';
    ELSE
        -- Calculate the average salary
        SELECT AVG(e.salary) INTO avg_salary
        FROM employees e
        JOIN departments d ON e.department_id = d.department_id
        WHERE d.department_name = dept_name;

        -- Check if no result found
        IF avg_salary IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No employees found for this department.';
        END IF;
    END IF;
END

-- calling the procedure
SET @avg_salary = 0; -- Declare variable to store output
CALL GetAvgSalaryByDept('HR', @avg_salary);
SELECT @avg_salary AS AvgSalary;
