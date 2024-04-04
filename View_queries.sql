-- Create a view named 'EmployeeView' to display employee data from the 'employees' table
CREATE VIEW EmployeeView AS
SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees;

-- Select data from the view
SELECT * FROM EmployeeView;

-- Update the view to display only employees from the Sales department
ALTER VIEW EmployeeView AS
SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees
WHERE department_id = 1;

-- Select data from the updated view
SELECT * FROM EmployeeView;


-- Joining Views: Create a view that joins EmployeeView with the departments table
CREATE VIEW EmployeeDepartmentView AS
SELECT 
    ev.employee_id,
    ev.first_name,
    ev.last_name,
    ev.department_id,
    d.department_name
FROM EmployeeView ev
JOIN departments d ON ev.department_id = d.department_id;

-- Select data from the joined view
SELECT * FROM EmployeeDepartmentView;

-- Aggregating View: Create a view that aggregates salary data by department
CREATE VIEW DepartmentSalarySummary AS
SELECT 
    department_id,
    COUNT(employee_id) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS avg_salary
FROM EmployeeView
GROUP BY department_id;

-- Select data from the aggregated view
SELECT * FROM DepartmentSalarySummary;

-- Indexed View: Create an indexed view to improve query performance
-- Note: Indexed views are not supported in all database systems
CREATE INDEX IX_DepartmentSalarySummary_DepartmentId ON DepartmentSalarySummary (department_id);

-- Drop the views when no longer needed
DROP VIEW EmployeeView;
DROP VIEW EmployeeDepartmentView;
DROP VIEW DepartmentSalarySummary;
