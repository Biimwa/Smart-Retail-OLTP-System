-- Task 1: Create the database
CREATE DATABASE IF NOT EXISTS sales;
USE sales;

-- Task 2: Create the sales_data table
CREATE TABLE IF NOT EXISTS sales_data (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity_sold INT,
    price_per_unit DECIMAL(10, 2),
    sale_date DATE,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Task 4: List tables in the database
SHOW TABLES;

-- Task 5: Count rows in sales_data
SELECT COUNT(*) AS total_sales_records FROM sales_data;

-- Task 6: Create index on timestamp field
CREATE INDEX ts ON sales_data (timestamp);

-- Task 7: List indexes on sales_data table
SHOW INDEXES FROM sales_data;


