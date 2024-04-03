-- Create a new table called 'departments' with primary key constraint
CREATE TABLE departments (
    department_id INT PRIMARY KEY, -- Primary key constraint for department ID
    department_name VARCHAR(50) NOT NULL 


-- Create a new table called 'employees' with foreign key constraint referencing 'departments'
CREATE TABLE employees (
    employee_id INT PRIMARY KEY, -- Primary key constraint for employee ID
    first_name VARCHAR(50) NOT NULL, -- Not null constraint for first name
    last_name VARCHAR(50) NOT NULL, -- Not null constraint for last name
    email VARCHAR(100) UNIQUE, -- Unique constraint for email address
    department_id INT, -- Foreign key constraint referencing department ID
    hire_date DATE DEFAULT CURRENT_DATE, -- Default value for hire date set to the current date
    salary DECIMAL(10, 2) CHECK (salary > 0), -- Check constraint to ensure salary is positive

    CONSTRAINT fk_department 
        FOREIGN KEY (department_id) 
        REFERENCES departments(department_id) 
        ON DELETE NO ACTION, -- No action will be taken on deletion

    CONSTRAINT fk_department_set_null 
        FOREIGN KEY (department_id) 
        REFERENCES departments(department_id) 
        ON DELETE SET NULL, -- Set the foreign key column to NULL on deletion

    CONSTRAINT fk_department_set_default 
        FOREIGN KEY (department_id) 
        REFERENCES departments(department_id) 
        ON DELETE SET DEFAULT, -- Set the foreign key column to its default value on deletion

    CONSTRAINT fk_department_cascade 
        FOREIGN KEY (department_id) 
        REFERENCES departments(department_id) 
        ON DELETE CASCADE -- Cascade the deletion to associated records in the 'employees' table
);
-- Comments provide explanations for each constraint
