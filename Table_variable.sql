--The '@' symbol prefixing a variable name in SQL indicates that it is a variable
-- Declare a table variable named @EmployeeTable to store employee data
DECLARE @EmployeeTable TABLE (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Insert sample data into the table variable
INSERT INTO @EmployeeTable (employee_id, first_name, last_name, department_id, salary) VALUES
(1, 'Ajay', 'Rathod', 1, 50000),
(2, 'Dashrath', 'Reddy', 2, 60000),
(3, 'Aniket', 'Patil', 1, 55000);

-- Select data from the table variable
SELECT * FROM @EmployeeTable;

-- Update data in the table variable
UPDATE @EmployeeTable
SET salary = salary * 1.1 -- Increase salary by 10%
WHERE department_id = 1;

-- Select data from the table variable after the update
SELECT * FROM @EmployeeTable;

-- Delete data from the table variable
DELETE FROM @EmployeeTable
WHERE department_id = 2;

-- Select data from the table variable after the deletion
SELECT * FROM @EmployeeTable;
