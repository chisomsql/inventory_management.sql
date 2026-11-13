CREATE DATABASE inventory_management; 
USE inventory_management; -- Create Products Table 
CREATE TABLE products ( 
product_id INT PRIMARY KEY, 
product_name VARCHAR(255), 
category VARCHAR(50), 
price DECIMAL(10, 2) 
); -- Create Sales Table 
CREATE TABLE sales ( 
sale_id INT PRIMARY KEY, 
product_id INT, 
quantity INT, 
total_price DECIMAL(10, 2), 
FOREIGN KEY (product_id) REFERENCES products(product_id) 
); -- Insert Sample Data into Products Table 
INSERT INTO products (product_id, product_name, category, price) 
VALUES 
(1, 'Smartphone', 'Electronics', 500.00), 
(2, 'Jeans', 'Apparel', 40.00), 
(3, 'Desk', 'Furniture', 200.00), 
(4, 'Running Shoes', 'Footwear', 90.00); -- Insert Sample Data into Sales Table 
INSERT INTO sales (sale_id, product_id, quantity, total_price) 
VALUES 
(201, 1, 3, 1500.00), 
(202, 2, 2, 80.00), 
(203, 4, 5, 450.00), 
(204, 3, 1, 200.00);


-- 1. Retrieve all products
SELECT *
FROM products;

-- 2. Find the total number of sales
SELECT COUNT(sale_id) AS total_sales
FROM sales;

-- 3. Products with price greater than $50
SELECT *
FROM products
WHERE price > 50;

-- 4. Sale ID, product name and total price
SELECT s.sale_id, p.product_name, s.total_price
FROM sales AS s
JOIN products AS p
ON s.product_id = p.product_id;

-- 5. Calculate total revenue
SELECT SUM(total_price) AS total_revenue
FROM sales;

-- 6. Get the average product price
SELECT AVG(price) AS average_price
FROM products;

-- 7. Find the highest total price among sales
SELECT MAX(total_price) AS highest_total_price
FROM sales;

-- 8. List products with their categories
SELECT product_name, category
FROM products;

-- 9. Find product(s) with the highest price
SELECT product_name, price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

-- 10. Sales where total price is greater than $200
SELECT sale_id, quantity
FROM sales
WHERE total_price > 200;

-- 11. Find the product with the lowest price
SELECT product_name, price
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products
);

-- 12. Categories with number of products
SELECT category, COUNT(product_id) AS total_products
FROM products
GROUP BY category;

-- 13. Calculate total quantity of products sold
SELECT SUM(quantity) AS total_quantity_sold
FROM sales;

-- 14. Products in the Electronics category --
SELECT product_name, price
FROM products
WHERE category = 'Electronics';
 