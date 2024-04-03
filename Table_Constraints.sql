-- Create a new table called 'employees' with various constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY, -- Primary key constraint to ensure uniqueness

    first_name VARCHAR(50) NOT NULL, -- Not null constraint to ensure the column cannot be empty

    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) UNIQUE, -- Unique constraint to ensure email addresses are unique

    department_id INT,

    hire_date DATE DEFAULT CURRENT_DATE, -- Default value for hire date set to the current date

    salary DECIMAL(10, 2) CHECK (salary > 0), -- Check constraint to ensure salary is positive

    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id), -- Foreign key constraint to link to another table

    CONSTRAINT composite_key UNIQUE (first_name, last_name) -- Composite key constraint ensures the combination of first name and last name is unique
);
-- Comments provide explanations for each constraint
