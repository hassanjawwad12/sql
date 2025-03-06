CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    job_type ENUM('Full-Time', 'Part-Time', 'Intern') DEFAULT 'Intern'
);


INSERT INTO employees (first_name, job_type) 
VALUES ('Alice', 'Full-Time');
