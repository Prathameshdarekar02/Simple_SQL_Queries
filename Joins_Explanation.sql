-- Create 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

-- Insert sample data into 'departments' table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

-- Create 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    hire_date DATE DEFAULT '2024-03-11',
    salary DECIMAL(10, 2) CHECK (salary > 0),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data into 'employees' table
INSERT INTO employees(employee_id, first_name, last_name, email, department_id, salary) VALUES
(1, 'Ajay', 'Rathos', 'ajay.rathod@example.com', 3, 70000), -- Assuming 3 represents the IT department and salary is in INR
(2, 'Dashrath', 'Reddy', 'dashrath.reddy@example.com', 1, 60000), -- Assuming 1 represents the HR department and salary is in INR
(3, 'Rohit', 'Yadav', 'rohit.yadav@example.com', 2, 75000); -- Assuming 2 represents the Finance department and salary is in INR
 
-- Inner join: Select data from both tables where there is a match
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

-- Left join: Select all data from the left table and matching data from the right table
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

-- Right join: Select all data from the right table and matching data from the left table
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

-- Full outer join: Select all data when there is a match in either table
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

-- Cross join: Generate all possible combinations of rows from both tables
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
CROSS JOIN departments d;
