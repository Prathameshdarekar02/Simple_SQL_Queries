-- Conditional Statements --

-- Create a table called 'employees' with sample data
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert sample data into 'employees' table
INSERT INTO employees (employee_id, first_name, last_name, salary) VALUES
(1, 'Dashrath', 'Reddy', 50000),
(2, 'Ajay', 'Rathod', 60000),
(3, 'Aniket', 'Patil', 70000),
(4, 'Prathamesh', 'Darekar', 80000);

-- Example 1: Using CASE expression to categorize employees based on salary --
-- Select data from 'employees' with a CASE expression to categorize salary levels
SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
    CASE 
        WHEN salary < 60000 THEN 'Low'
        WHEN salary >= 60000 AND salary < 80000 THEN 'Medium'
        ELSE 'High'
    END AS salary_level
FROM employees;

-- Example 2: Using IF statement in a stored procedure to handle different conditions
-- (Since SQL Server does not directly support IF statements outside stored procedures, this example is for illustration purposes)

-- Create a stored procedure to check if an employee's salary is above a certain threshold
CREATE PROCEDURE CheckSalaryThreshold @emp_id INT
AS
BEGIN
    DECLARE @salary DECIMAL(10, 2);

    SELECT @salary = salary FROM employees WHERE employee_id = @emp_id;

    IF @salary > 60000
    BEGIN
        PRINT 'Employee salary is above the threshold.';
    END
    ELSE
    BEGIN
        PRINT 'Employee salary is below or equal to the threshold.';
    END
END;

-- Example 3: Using COALESCE function to replace null department_id with a default value of 0
SELECT 
    employee_id,
    first_name,
    last_name,
    COALESCE(department_id, 0) AS department_id,
    salary
FROM employees;

-- Example 4: Using NULLIF function to replace specific values with null (e.g., division by zero)
SELECT 
    employee_id,
    first_name,
    last_name,
    salary / NULLIF(department_id, 0) AS salary_per_department
FROM employees;

-- Example 5: Using Boolean expressions to filter data
SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees
WHERE department_id IS NOT NULL AND salary > 0;
