-- Scalar Function: Create a scalar function to calculate the total salary of an employee
CREATE FUNCTION CalculateTotalSalary
(
    @EmployeeId INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalSalary DECIMAL(10, 2);
    
    SELECT @TotalSalary = SUM(salary) 
    FROM employees 
    WHERE department_id = @EmployeeId;

    RETURN @TotalSalary;
END;

-- Execute the scalar function to calculate the total salary of employees in department 1
DECLARE @TotalSalaryInDept1 DECIMAL(10, 2);
SET @TotalSalaryInDept1 = dbo.CalculateTotalSalary(1);
SELECT @TotalSalaryInDept1 AS TotalSalaryInDept1;

-- Inline Table-Valued Function: Create an inline function to get employees by department
CREATE FUNCTION GetEmployeesByDepartment
(
    @DepartmentId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM employees WHERE department_id = @DepartmentId
);

-- Execute the inline function to get employees in department 2
SELECT * FROM dbo.GetEmployeesByDepartment(2);

-- Multi-Value Table-Valued Function: Create a multi-value table-valued function to split a string into multiple values
CREATE FUNCTION SplitString
(
    @String NVARCHAR(MAX),
    @Delimiter CHAR(1)
)
RETURNS @Result TABLE (Value NVARCHAR(MAX))
AS
BEGIN
    DECLARE @Value NVARCHAR(MAX);
    DECLARE @Position INT;

    WHILE CHARINDEX(@Delimiter, @String) > 0
    BEGIN
        SELECT @Position = CHARINDEX(@Delimiter, @String);
        SELECT @Value = SUBSTRING(@String, 1, @Position - 1);

        INSERT INTO @Result VALUES (@Value);

        SELECT @String = SUBSTRING(@String, @Position + 1, LEN(@String) - @Position);
    END

    INSERT INTO @Result VALUES (@String);

    RETURN;
END;

-- Execute the multi-value table-valued function to split a string into multiple values
SELECT * FROM dbo.SplitString('apple,banana,orange', ',');
