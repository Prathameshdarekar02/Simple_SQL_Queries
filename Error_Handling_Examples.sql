--EXAMPLE 1
-- Enable XACT_ABORT to ensure transactions are rolled back on error
SET XACT_ABORT ON;

-- Begin a transaction
BEGIN TRANSACTION;

BEGIN TRY
    -- Insert a record into a table that does not exist (intentional error)
    INSERT INTO NonExistentTable (column1) VALUES ('value1');
    
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


--EXAMPLE 2
-- Enable XACT_ABORT to ensure transactions are rolled back on error
SET XACT_ABORT ON;

-- Begin a transaction
BEGIN TRANSACTION;

BEGIN TRY
    -- Example 1: Divide by zero error
    DECLARE @Result INT;
    SET @Result = 10 / 0;

    -- Example 2: Conversion error
    DECLARE @String VARCHAR(10);
    SET @String = 'ABC';
    SET @Result = CAST(@String AS INT);

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
