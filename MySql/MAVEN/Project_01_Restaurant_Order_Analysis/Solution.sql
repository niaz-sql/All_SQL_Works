USE restaurant_db

-- Objective 1 Explore the items table
-- Your first objective is to better understand the items table by finding the number of rows in the table, the least and most expensive items, and the item prices within each category.

-- 1. View the menu_items table and write a query to find the number of items on the menu
SELECT COUNT(DISTINCT item_name) AS total_items
FROM menu_items

-- What are the least and most expensive items on the menu?
SELECT item_name, price
FROM menu_items
WHERE price = (SELECT max(price) FROM menu_items)
OR price = (SELECT min(price) FROM menu_items)

-- 2. How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
SELECT count(category) AS italian_dishes_count
FROM menu_items
WHERE category = 'Italian'

WITH m_table AS( SELECT item_name, category, price 
FROM menu_items)
SELECT *
			FROM m_table
			WHERE category = 'Italian' AND
			(price = (SELECT min(price) FROM m_table WHERE category = 'Italian')
			OR 
			price = (SELECT max(price) FROM menu_items WHERE category = 'Italian'))
            
-- 3. How many dishes are in each category? What is the average dish price within each category?

SELECT category, count(item_name) AS total_item, avg(price) AS avg_price
FROM menu_items
GROUP BY category
ORDER BY total_item

-- Objective 2
-- Explore the orders table
-- Your second objective is to better understand the orders table by finding the date range, the number of items within each order, and the orders with the highest number of items.

-- 1. View the order_details table. What is the date range of the table?
SELECT *
FROM order_details

SELECT DISTINCT order_date
FROM order_details

-- 2. How many orders were made within this date range? How many items were ordered within this date range?

SELECT  count(order_id) AS total_orders
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31'

SELECT  count(item_id) AS total_orders
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31'

-- 3. Which orders had the most number of items?

SELECT order_id, count(item_id) AS item_count
FROM order_details
GROUP BY order_id
ORDER BY item_count DESC, order_id ASC

-- How many orders had more than 12 items?
SELECT order_id, count(item_id) AS item_count
FROM order_details
GROUP BY order_id
HAVING item_count >12

-- Objective 3
-- Analyze customer behavior
-- Your final objective is to combine the items and orders tables, find the least and most ordered categories, and dive into the details of the highest spend orders.

-- 1. Combine the menu_items and order_details tables into a single table

SELECT *
FROM order_details AS od
INNER JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id

-- 2. What were the least and most ordered items? What categories were they in?
WITH m_table AS(SELECT item_id, COUNT(order_id) AS ordered_item
				FROM order_details 
				GROUP BY item_id
				ORDER BY COUNT(order_id) DESC
                LIMIT 1)
                SELECT item_id, ordered_item, category
                FROM m_table 
                INNER JOIN menu_items AS mi
                ON m_table.item_id = mi.menu_item_id

WITH m_table AS(SELECT item_id, COUNT(order_id) AS ordered_item
				FROM order_details 
				GROUP BY item_id
				ORDER BY COUNT(order_id) ASC
                LIMIT 1)
                SELECT item_id, ordered_item, category
                FROM m_table 
                INNER JOIN menu_items AS mi
                ON m_table.item_id = mi.menu_item_id
                
-- 3. What were the top 5 orders that spent the most money?


WITH m_table AS (SELECT order_id, SUM( mi.price) AS sum_spent
				FROM order_details AS od
				INNER JOIN menu_items AS mi
				ON od.item_id = mi.menu_item_id
                GROUP BY order_id )
                SELECT *
                FROM m_table
                ORDER BY sum_spent DESC
                LIMIT 5

-- 4. View the details of the highest spend order. Which specific items were purchased?



WITH m_table AS (SELECT order_id, item_id, SUM( mi.price) AS sum_spent
				FROM order_details AS od
				INNER JOIN menu_items AS mi
				ON od.item_id = mi.menu_item_id
                GROUP BY order_id, item_id )
                SELECT order_id, item_id,  sum_spent, item_name
                FROM m_table
                INNER JOIN menu_items AS mi
                ON m_table.item_id = mi.menu_item_id
                ORDER BY sum_spent DESC
                LIMIT 5

