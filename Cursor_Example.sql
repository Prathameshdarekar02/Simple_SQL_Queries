-- Declare cursor variables
DECLARE @EmployeeID INT;
DECLARE @FirstName VARCHAR(50);
DECLARE @LastName VARCHAR(50);

-- Declare a cursor
DECLARE EmployeeCursor CURSOR FOR
SELECT employee_id, first_name, last_name FROM Employees;

-- Open the cursor
OPEN EmployeeCursor;

-- Fetch the first row from the cursor into variables
FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @FirstName, @LastName;

-- Loop through the cursor results
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process each row
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = 'PRINT ''Employee ID: ' + CAST(@EmployeeID AS VARCHAR) + ', Name: ' + @FirstName + ' ' + @LastName + '''';
    EXEC sp_executesql @SQL;

    -- Fetch the next row from the cursor into variables
    FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @FirstName, @LastName;
END

-- Close the cursor
CLOSE EmployeeCursor;

-- Deallocate the cursor
DEALLOCATE EmployeeCursor;
