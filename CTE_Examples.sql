-- Example 1: Simple CTE
-- Declare a CTE named EmployeeCTE to select data from the Employees table
WITH EmployeeCTE AS (
    SELECT employee_id, first_name, last_name, department_id
    FROM Employees
)
-- Select data from the CTE
SELECT * FROM EmployeeCTE;



-- Example 2: Recursive CTE
-- Declare a recursive CTE named DepartmentHierarchyCTE to represent department hierarchy
WITH DepartmentHierarchyCTE AS (
    -- Anchor member: Select top-level departments
    SELECT department_id, department_name, parent_department_id, 0 AS depth
    FROM Departments
    WHERE parent_department_id IS NULL

    UNION ALL

    -- Recursive member: Join with children departments
    SELECT d.department_id, d.department_name, d.parent_department_id, depth + 1
    FROM Departments d
    INNER JOIN DepartmentHierarchyCTE cte ON d.parent_department_id = cte.department_id
)
-- Select data from the recursive CTE
SELECT * FROM DepartmentHierarchyCTE;



-- Example 3: CTE with aggregation
-- Declare a CTE named DepartmentSummaryCTE to calculate department-wise summary
WITH DepartmentSummaryCTE AS (
    SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY department_id
)
-- Select data from the CTE
SELECT * FROM DepartmentSummaryCTE;



-- Example 4: CTE with Ranking Function
-- Declare a CTE named TopEmployeesCTE to rank employees by salary
WITH TopEmployeesCTE AS (
    SELECT employee_id, first_name, last_name, department_id, salary,
           ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
    FROM Employees
)
-- Select top 3 highest paid employees
SELECT * FROM TopEmployeesCTE WHERE rank <= 3;



-- Example 5: CTE with Joins
-- Declare a CTE named EmployeeDepartmentCTE to join Employees and Departments tables
WITH EmployeeDepartmentCTE AS (
    SELECT e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
    FROM Employees e
    INNER JOIN Departments d ON e.department_id = d.department_id
)
-- Select employee details with department names
SELECT * FROM EmployeeDepartmentCTE;
