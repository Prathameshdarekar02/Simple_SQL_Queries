-- Create a new database
CREATE DATABASE my_database;
-- Comments can explain what each step does

-- Use the newly created database
USE my_database;

-- Create a new table called 'users'
CREATE TABLE users (
    id INT,
    username VARCHAR(50),
    email VARCHAR(100)
);
-- This table will store information about users, including their username and email

-- Insert some sample data into the 'users' table
INSERT INTO users (id, username, email) VALUES (1, 'user1', 'user1@example.com'), (2, 'user2', 'user2@example.com');
-- This adds two rows of data to the 'users' table

-- Select all data from the 'users' table
SELECT * FROM users;
-- This retrieves all the data stored in the 'users' table
