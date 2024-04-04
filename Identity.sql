-- Create a new table 'Products' with an identity column 'product_id'
CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Insert data into the 'Products' table
INSERT INTO Products (product_name, price) VALUES ('Laptop', 999.99);
INSERT INTO Products (product_name, price) VALUES ('Smartphone', 599.99);
INSERT INTO Products (product_name, price) VALUES ('Tablet', 299.99);

-- Display data from the 'Products' table
SELECT * FROM Products;

-- Insert a new product without specifying the 'product_id'
INSERT INTO Products (product_name, price) VALUES ('Headphones', 99.99);

-- Display data from the 'Products' table after inserting a new product
SELECT * FROM Products;

-- Update the price of a product
UPDATE Products SET price = 1099.99 WHERE product_name = 'Laptop';

-- Display data from the 'Products' table after updating the price
SELECT * FROM Products;

-- Delete a product from the 'Products' table
DELETE FROM Products WHERE product_name = 'Tablet';

-- Display data from the 'Products' table after deleting a product
SELECT * FROM Products;

-- Reset the identity column seed to 1000
DBCC CHECKIDENT ('Products', RESEED, 1000);

-- Display the current identity column value
DBCC CHECKIDENT ('Products', NORESEED);

-- Drop the 'Products' table when no longer needed
DROP TABLE Products;
