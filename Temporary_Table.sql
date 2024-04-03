-- Temporary table will be automatically dropped at the end of the session or transaction

-- The ‘#’ symbol prefixing a table name indicates that it is a temporary table,
-- Create a temporary table called '#temp_employees' to store employee data temporarily
CREATE TABLE #temp_employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Insert sample data into the temporary table
INSERT INTO #temp_employees (employee_id, first_name, last_name, department_id, salary) VALUES
(1, 'Ajay', 'Rathod', 1, 50000),
(2, 'Dashrath', 'Reddy', 2, 60000),
(3, 'Aniket', 'Patil', 1, 55000);

-- Select data from the temporary table
SELECT * FROM #temp_employees;

-- Update data in the temporary table
UPDATE #temp_employees
SET salary = salary * 1.1 -- Increase salary by 10%
WHERE department_id = 1;

-- Select data from the temporary table after the update
SELECT * FROM #temp_employees;

-- Delete data from the temporary table
DELETE FROM #temp_employees
WHERE department_id = 2;

-- Select data from the temporary table after the deletion
SELECT * FROM #temp_employees;

-- Drop the temporary table when no longer needed
DROP TABLE #temp_employees;
