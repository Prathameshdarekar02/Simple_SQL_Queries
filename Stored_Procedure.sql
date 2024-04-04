-- Create a stored procedure named 'GetAllEmployees' to retrieve all employees
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM employees;
END;

-- Execute the stored procedure to retrieve all employees
EXEC GetAllEmployees;

-- Create a stored procedure named 'GetEmployeeById' to retrieve employee details by ID
CREATE PROCEDURE GetEmployeeById
    @EmployeeId INT
AS
BEGIN
    SELECT * FROM employees WHERE employee_id = @EmployeeId;
END;

-- Execute the stored procedure to retrieve employee details for ID 1
EXEC GetEmployeeById 1;

-- Create a stored procedure named 'AddEmployee' to insert a new employee into the 'employees' table
CREATE PROCEDURE AddEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentId INT,
    @Salary DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO employees (first_name, last_name, department_id, salary)
    VALUES (@FirstName, @LastName, @DepartmentId, @Salary);
END;

-- Execute the stored procedure to add a new employee
EXEC AddEmployee 'Rohit', 'Yadav', 1, 50000;

-- Create a stored procedure named 'UpdateEmployeeSalary' to update the salary of an employee
CREATE PROCEDURE UpdateEmployeeSalary
    @EmployeeId INT,
    @NewSalary DECIMAL(10, 2)
AS
BEGIN
    UPDATE employees SET salary = @NewSalary WHERE employee_id = @EmployeeId;
END;

-- Execute the stored procedure to update the salary of employee with ID 1
EXEC UpdateEmployeeSalary 1, 55000;

-- Create a stored procedure named 'DeleteEmployeeById' to delete an employee by ID
CREATE PROCEDURE DeleteEmployeeById
    @EmployeeId INT
AS
BEGIN
    DELETE FROM employees WHERE employee_id = @EmployeeId;
END;

-- Execute the stored procedure to delete employee with ID 1
EXEC DeleteEmployeeById 1;
