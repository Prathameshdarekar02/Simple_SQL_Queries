-- Create a new table 'EmployeesBackup' by selecting all data from the 'employees' table
-- Note: The new table structure will be based on the columns and data types of the selected columns
SELECT * INTO EmployeesBackup FROM employees;

-- Display data from the newly created table 'EmployeesBackup'
SELECT * FROM EmployeesBackup;

-- Create a new table 'HighSalaryEmployees' by selecting specific columns and rows from the 'employees' table
SELECT employee_id, first_name, last_name, salary 
INTO HighSalaryEmployees 
FROM employees
WHERE salary > 60000;

-- Display data from the newly created table 'HighSalaryEmployees'
SELECT * FROM HighSalaryEmployees;

-- Create a new temporary table 'TemporaryEmployees' by selecting specific columns and rows from the 'employees' table
-- Note: Temporary tables are prefixed with '#' and are automatically dropped at the end of the session
SELECT employee_id, first_name, last_name, salary 
INTO #TemporaryEmployees 
FROM employees
WHERE department_id = 1;

-- Display data from the newly created temporary table 'TemporaryEmployees'
SELECT * FROM #TemporaryEmployees;

-- Create a new table 'EmployeeDepartment' by joining 'employees' and 'departments' tables and selecting specific columns
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
INTO EmployeeDepartment
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Display data from the newly created table 'EmployeeDepartment'
SELECT * FROM EmployeeDepartment;

-- Create a new table 'EmployeeCopy' with the same structure as 'employees' table but without any data
SELECT TOP 0 * INTO EmployeeCopy FROM employees;

-- Display the structure of the newly created table 'EmployeeCopy'
EXEC sp_columns 'EmployeeCopy';

-- Drop the created tables when no longer needed
DROP TABLE EmployeesBackup;
DROP TABLE HighSalaryEmployees;
DROP TABLE #TemporaryEmployees;
DROP TABLE EmployeeDepartment;
DROP TABLE EmployeeCopy;
