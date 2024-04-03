-- Create a table called 'employees' with sample data including some null values
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Insert sample data into 'employees' table
INSERT INTO employees (employee_id, first_name, last_name, department_id, salary) VALUES
(1, 'Ajay', 'Rathod', 1, 50000),
(2, 'Dashrath', 'Reddy', NULL, 60000), -- Null department_id
(3, 'Aniket', 'Patil', 2, NULL), -- Null salary
(4, 'Prathamesh', 'Darekar', NULL, NULL); -- Null department_id and salary

-- Select all data from the 'employees' table before replacing null values
SELECT * FROM employees;

-- Replace null department_id with a default value of 0 using ISNULL()
UPDATE employees
SET department_id = ISNULL(department_id, 0);

-- Replace null salary with a default value of 0.00 using COALESCE()
UPDATE employees
SET salary = COALESCE(salary, 0.00);

-- Select all data from the 'employees' table after replacing null values using ISNULL() and COALESCE()
SELECT * FROM employees;

-- Replace null department_id with a default value of 0 using CASE statement
UPDATE employees
SET department_id = CASE WHEN department_id IS NULL THEN 0 ELSE department_id END;

-- Replace null salary with a default value of 0.00 using CASE statement
UPDATE employees
SET salary = CASE WHEN salary IS NULL THEN 0.00 ELSE salary END;

-- Select all data from the 'employees' table after replacing null values using CASE statement
SELECT * FROM employees;
