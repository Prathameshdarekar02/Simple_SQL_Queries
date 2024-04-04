-- Create a table 'Employees' to store employee data
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Create an index on the 'department_id' column of the 'Employees' table
CREATE INDEX IX_DepartmentId ON Employees(department_id);

-- Insert sample data into the 'Employees' table
INSERT INTO Employees VALUES (1, 'Ajay', 'Rathod', 1, 50000);
INSERT INTO Employees VALUES (2, 'Dashrath', 'Reddy', 2, 60000);
INSERT INTO Employees VALUES (3, 'Aniket', 'Patil', 1, 55000);
INSERT INTO Employees VALUES (4, 'Prathamesh', 'Darekar', 3, 45000);

-- Retrieve data from the 'Employees' table using an index seek
SELECT * FROM Employees WHERE department_id = 2;

-- Create a clustered index on the 'employee_id' column of the 'Employees' table
CREATE CLUSTERED INDEX IX_EmployeeId ON Employees(employee_id);

-- Retrieve data from the 'Employees' table using a clustered index seek
SELECT * FROM Employees WHERE employee_id = 2;

-- Drop the index on the 'department_id' column
DROP INDEX IX_DepartmentId ON Employees;

-- Drop the clustered index on the 'employee_id' column
DROP INDEX IX_EmployeeId ON Employees;

-- Drop the 'Employees' table when no longer needed
DROP TABLE Employees;
