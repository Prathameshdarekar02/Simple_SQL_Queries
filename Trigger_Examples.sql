-- Create a table 'Employees' to store employee data
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Create a table 'AuditLog' to store audit trail data
CREATE TABLE AuditLog (
    log_id INT PRIMARY KEY IDENTITY,
    action_type VARCHAR(50),
    employee_id INT,
    audit_date DATETIME
);

-- Create a trigger 'AfterInsertEmployee' to log insert operations on the 'Employees' table
CREATE TRIGGER AfterInsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditLog (action_type, employee_id, audit_date)
    SELECT 'INSERT', employee_id, GETDATE()
    FROM inserted;
END;

-- Insert a new employee into the 'Employees' table
INSERT INTO Employees VALUES (1, 'John', 'Doe', 1, 50000);

-- Select data from the 'AuditLog' table to view the audit trail
SELECT * FROM AuditLog;

-- Create a trigger 'AfterUpdateEmployee' to log update operations on the 'Employees' table
CREATE TRIGGER AfterUpdateEmployee
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (action_type, employee_id, audit_date)
    SELECT 'UPDATE', employee_id, GETDATE()
    FROM inserted;
END;

-- Update the salary of an employee in the 'Employees' table
UPDATE Employees SET salary = 55000 WHERE employee_id = 1;

-- Select data from the 'AuditLog' table to view the audit trail after the update
SELECT * FROM AuditLog;

-- Create a trigger 'AfterDeleteEmployee' to log delete operations on the 'Employees' table
CREATE TRIGGER AfterDeleteEmployee
ON Employees
AFTER DELETE
AS
BEGIN
    INSERT INTO AuditLog (action_type, employee_id, audit_date)
    SELECT 'DELETE', employee_id, GETDATE()
    FROM deleted;
END;

-- Delete an employee from the 'Employees' table
DELETE FROM Employees WHERE employee_id = 1;

-- Select data from the 'AuditLog' table to view the audit trail after the delete
SELECT * FROM AuditLog;
