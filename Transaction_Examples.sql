-- Begin a transaction
BEGIN TRANSACTION;

BEGIN TRY
    -- Example 1: Inserting data into the 'Employees' table
    INSERT INTO Employees (employee_id, first_name, last_name, department_id, salary) 
    VALUES (1, 'John', 'Doe', 1, 50000);
    INSERT INTO Employees (employee_id, first_name, last_name, department_id, salary) 
    VALUES (2, 'Jane', 'Smith', 2, 60000);

    -- Example 2: Updating salary of an employee
    UPDATE Employees SET salary = 55000 WHERE employee_id = 1;

    -- If the execution reaches here, commit the transaction
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    -- If an error occurs, rollback the transaction
    ROLLBACK TRANSACTION;
    
    -- Log error information
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    
    PRINT 'Error Message: ' + @ErrorMessage;
    PRINT 'Error Severity: ' + CAST(@ErrorSeverity AS NVARCHAR);
    PRINT 'Error State: ' + CAST(@ErrorState AS NVARCHAR);
END CATCH;


-- Begin a transaction
BEGIN TRANSACTION;

BEGIN TRY
    -- Example 3: Deleting an employee
    DELETE FROM Employees WHERE employee_id = 2;

    -- Example 4: Inserting data into another table within the same transaction
    INSERT INTO Departments (department_id, department_name) VALUES (1, 'IT');

    -- If the execution reaches here, commit the transaction
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    -- If an error occurs, rollback the transaction
    ROLLBACK TRANSACTION;
    
    -- Log error information
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    
    PRINT 'Error Message: ' + @ErrorMessage;
    PRINT 'Error Severity: ' + CAST(@ErrorSeverity AS NVARCHAR);
    PRINT 'Error State: ' + CAST(@ErrorState AS NVARCHAR);
END CATCH;
