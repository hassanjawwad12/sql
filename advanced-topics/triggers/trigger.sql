--This trigger will automatically insert data into the salary_log table whenever an employee's salary is updated.

-- first we create the log table 
CREATE TABLE salary_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- then we create the trigger
CREATE TRIGGER after_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log(employee_id, old_salary, new_salary)
        VALUES (OLD.employee_id, OLD.salary, NEW.salary);
    END IF;
END 

-- this will spwan the trigger
UPDATE employees SET salary = 70000 WHERE employee_id = 1;
--verify with this
SELECT * FROM salary_log;
