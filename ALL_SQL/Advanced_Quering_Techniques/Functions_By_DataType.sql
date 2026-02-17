-- Connect to database


-- ASSIGNMENT 1: Numeric functions

-- Calculate the total spend for each customer
-- Put the spend into bins of $0-$10, $10-20, etc.
-- Number of customers in each spend bin

WITH cust_spent AS (SELECT o.customer_id, sum(o.units * p.unit_price)  AS customer_spent
					FROM orders AS o INNER JOIN products AS P
					ON o.product_id = p.product_id
					GROUP BY o.customer_id)
                    SELECT FLOOR( customer_spent/10) AS floor , count( cust_spent.customer_id) AS cust_count
                    FROM cust_spent
                    GROUP BY floor
                    ORDER BY floor


-- ASSIGNMENT 2: Datetime functions

-- Extract just the orders from Q2 2024

-- Add a column called ship_date that adds 2 days to each order date

WITH quarter_calc AS (SELECT order_id, order_date, MONTH(order_date) as month_ind, 
						CASE 
						WHEN MONTH(order_date)  BETWEEN 1 AND 3 THEN CONCAT('Q',1)
						WHEN MONTH(order_date) BETWEEN 4 AND 6 THEN CONCAT('Q',2)
						WHEN MONTH(order_date) BETWEEN 7 AND 9 THEN CONCAT('Q',3)
						WHEN MONTH(order_date) BETWEEN 10 AND 12 THEN CONCAT('Q',4)
						ELSE 'unknown' END AS 'QUARTER' 
						FROM orders)
                        
                        SELECT order_id, order_date,
                        DATE_ADD( order_date, INTERVAL 2 DAY) AS shipping_date
                        FROM quarter_calc
                        WHERE QUARTER = 'Q2' AND YEAR (order_date) =2024

-- ASSIGNMENT 3: String functions

-- View the current factory names and product IDs
SELECT factory, product_id
FROM products;

-- Remove apostrophes and replace spaces with hyphens
SELECT factory, REPLACE(TRIM(REPLACE(factory, "'", '')),' ', "-") new_fac,  product_id
FROM products;

-- Create new ID column called factory_product_id

WITH new_fact AS(SELECT factory, REPLACE(TRIM(REPLACE(factory, "'", '')),' ', "-") new_fac,  product_id
					FROM products)
                    SELECT factory, product_id, CONCAT(new_fac, "-", product_id) AS new_id
                    FROM new_fact

-- ASSIGNMENT 4: Pattern matching

-- View the product names
SELECT product_name
FROM products

-- Only extract text after the hyphen for Wonka Bars
SELECT product_name, REPLACE(product_name, 'Wonka Bar - ', '') AS new_name
FROM products

-- Alternative using substrings
SELECT product_name,
CASE 
WHEN INSTR(product_name, '-')=0 THEN product_name
ELSE 
SUBSTR(product_name, INSTR(product_name, '-')+2)  END AS new_name
FROM products

-- ASSIGNMENT 5: Null functions

-- View the columns of interest
SELECT product_name, factory, division
FROM products

-- Replace NULL values with Other
SELECT product_name, factory, division, COALESCE(division, 'other') AS with_Other
FROM products

-- Find the most common division for each factory
SELECT  factory, division, count(product_id) AS count_id
FROM products
WHERE division IS NOT NULL
GROUP BY factory, division

-- Replace NULL values with top division for each factory

WITH null_val AS (SELECT  factory, division, count(product_id) AS count_id
					FROM products
					WHERE division IS NOT NULL
					GROUP BY factory, division),
 ro AS(SELECT factory, division, count_id,
				 ROW_NUMBER () OVER (PARTITION BY factory ORDER BY count_id DESC) AS rank_order
				 FROM null_val),
top_dev AS (SELECT factory, division 
FROM ro 
WHERE rank_order =1)


SELECT p.product_name, p.factory, p.division, 
COALESCE(p.division, 'other') AS with_Other, 
COALESCE(p.division, td.division) AS top_dev_new
FROM products AS p
LEFT JOIN top_dev as td
ON p.factory = td.factory



