-- Connect to database


-- ASSIGNMENT 1: Window function basics

-- View the orders table
SELECT *
FROM orders;

-- View the columns of interest
SELECT customer_id, order_id, order_date, transaction_id
FROM orders;

-- For each customer, add a column for transaction number
SELECT customer_id, order_id, order_date, transaction_id,
ROW_NUMBER() OVER ( PARTITION BY customer_id) as transaction_number
FROM orders;

-- ASSIGNMENT 2: Row Number vs Rank vs Dense Rank

-- View the columns of interest
SELECT order_id, product_id, units
FROM orders;

-- Try ROW_NUMBER to rank the units
SELECT order_id, product_id, units,
ROW_NUMBER() OVER ( PARTITION BY order_id ) as order_rank
FROM orders;


-- For each order, rank the products from most units to fewest units

SELECT order_id, product_id, units,
ROW_NUMBER() OVER ( PARTITION BY order_id ORDER BY units DESC) as order_rank
FROM orders


-- If there's a tie, keep the tie and don't skip to the next number after
SELECT order_id, product_id, units,
DENSE_RANK () OVER ( PARTITION BY order_id ORDER BY units DESC) as order_rank
FROM orders
ORDER BY order_id

-- Check the order id that ends with 44262 from the results preview
SELECT order_id, product_id, units,
DENSE_RANK () OVER ( PARTITION BY order_id ORDER BY units DESC) as order_rank
FROM orders
WHERE order_id LIKE "%44262"

-- ASSIGNMENT 3: First Value vs Last Value vs Nth Value

-- View the rankings from the last assignment


-- Add a column that contains the 2nd most popular product


-- Return the 2nd most popular product for each order


-- Alternative using DENSE RANK

-- Add a column that contains the rankings


-- Return the 2nd most popular product for each order


-- ASSIGNMENT 4: Lead & Lag

-- View the columns of interest


-- For each customer, return the total units within each order


-- Add on the transaction id to keep track of the order of the orders


-- Turn the query into a CTE and view the columns of interest


-- Create a prior units column


-- For each customer, find the change in units per order over time


-- ASSIGNMENT 5: NTILE

-- Calculate the total amount spent by each customer


-- View the data needed from the orders table


-- View the data needed from the products table


-- Combine the two tables and view the columns of interest

        
-- Calculate the total spending by each customer and sort the results from highest to lowest


-- Turn the query into a CTE and apply the percentile calculation


-- Return the top 1% of customers in terms of spending


