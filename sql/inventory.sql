/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
*/

/*
Requirements:
- referential integrity is enforced
- tables are created with appropriate data types and constraints
- sample data is populated in the tables
*/


/*
Steps:
1) Check if the database 'Inventory' exists, if it does exist, drop it and create a new one.
2) Set the default database to 'Inventory'.
3) Create a 'suppliers' table. Use the following columns:
- id: integer, primary key
- name: 50 characters, not null
- address: 255 characters, nullable
- city: 50 characters, not null
- state: 2 characters, not null
- zip: 10 characters, not null
4) Create the 'categories' table with a one-to-many relation to the 'suppliers'. Use the following columns:
- id:  integer, primary key
- name: 50 characters, not null
- description:  255 characters, nullable
- supplier_id: int, foreign key references suppliers(id)
5) Create the 'products' table with a one-to-many relation to the 'categories' table. Use the following columns:
- id: integer, primary key
- name: 50 characters, not null
- price: decimal (10, 2), not null
- category_id: int, foreign key references categories(id)
6) Populate the 'suppliers' table with sample data.
7) Populate the 'categories' table with sample data.
8) Populate the 'products' table with sample data.
9) Create a view named 'product_list' that displays the following columns:
- product_id
- product_name
- category_name
- supplier_name
10) Create a stored procedure named 'get_product_list' that returns the product list view.
11) Create a trigger that updates the 'products' table when a 'categories' record is deleted.
12) Create a function that returns the total number of products in a category.
13) Create a function that returns the total number of products supplied by a supplier.
*/


-- Check if the database 'Inventory' exists, if it does exist, drop it and create a new one.
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Inventory')
BEGIN
    DROP DATABASE Inventory;
END
GO

CREATE DATABASE Inventory;
GO

USE Inventory;
GO

-- Create the 'suppliers' table
CREATE TABLE suppliers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    CONSTRAINT chk_zip CHECK (LEN(zip) <= 10),
    -- Add a 'description' column as optional with length 255 characters
    description VARCHAR(255) NULL
);

-- Create the 'categories' table
CREATE TABLE categories (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NULL,
    supplier_id INT,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Create the 'products' table
CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Step 6: Populate the 'suppliers' table with sample data
INSERT INTO suppliers (name, address, city, state, zip, description) VALUES
('Acme Corp', '123 Main St', 'Boston', 'MA', '02110', 'General supplier'),
('Global Supplies', '456 Elm St', 'New York', 'NY', '10001', 'International supplier'),
('TechSource', '789 Oak Ave', 'San Francisco', 'CA', '94105', 'Electronics supplier');

-- Step 7: Populate the 'categories' table with sample data
INSERT INTO categories (name, description, supplier_id) VALUES
('Electronics', 'Electronic devices and gadgets', 3),
('Office Supplies', 'Stationery and office essentials', 1),
('Industrial', 'Industrial equipment and tools', 2);

-- Step 8: Populate the 'products' table with sample data
INSERT INTO products (name, price, category_id) VALUES
('Laptop', 1200.00, 1),           -- Electronics
('Smartphone', 800.00, 1),        -- Electronics
('Tablet', 450.00, 1),            -- Electronics
('Wireless Mouse', 30.00, 1),     -- Electronics
('Printer Paper', 25.00, 2),      -- Office Supplies
('Stapler', 15.00, 2),            -- Office Supplies
('Desk Chair', 120.00, 2),        -- Office Supplies
('Notebook', 5.00, 2),            -- Office Supplies
('Drill', 150.00, 3),             -- Industrial
('Wrench Set', 45.00, 3),         -- Industrial
('Safety Gloves', 12.00, 3),      -- Industrial
('Toolbox', 60.00, 3);            -- Industrial





