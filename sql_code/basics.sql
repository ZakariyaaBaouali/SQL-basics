-- select data

SELECT *
FROM customer
WHERE customer_id = 1
ORDER BY first_name



-- no duplicate
SELECT DISTINCT state
FROM customer


-- different ways to select data

SELECT name , unit_price , unit_price * 1.1  AS "new price"
FROM products


SELECT *
FROM customer
WHERE state <> 'va'

-- != is same as <>


SELECT *
FROM orders
WHERE placed_at >= 'Year-Month-Day'


-- put conditions on select statement

SELECT *
FROM orders
WHERE placed_at >= 'Year-Month-Day' AND unit_price > 10


SELECT *
FROM order_items
WHERE order_id = 6 AND unit_price * quantity > 30 AS 'total_price'

SELECT *
FROM customer
WHERE NOT state = 'NY'


SELECT *
FROM customer
WHERE state IN ('VA' , 'NY')


SELECT *
FROM customer
WHERE points BETWEEN 1000 AND 3000


SELECT *
FROM customer
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'


-- like mathing
-- 1. get all customers where the first name should start with a 'b'
SELECT *
FROM customer
WHERE first_name LIKE 'b%'


-- 2. get all customers where the first name should contain a 'b'
SELECT *
FROM customer
WHERE first_name LIKE '%b%'

-- '%' means a sequence of characters , while '_' means a single character

-- 3. get all customers where the first name should end a 'b'
SELECT *
FROM customer
WHERE first_name LIKE '%b'


-- 4. get all customers where the first name should have a 'b' in position 2
SELECT *
FROM customer
WHERE first_name LIKE '_b%'


-- 5. use regexp (mysql)
SELECT *
FROM customer
WHERE address REGEXP 'field'


-- Nullable values
SELECT *
FROM customer
WHERE phone IS NULL;


SELECT *
FROM orders
WHERE shipped_date IS NULL


-- sorting
SELECT *
FROM customer
ORDER BY first_name ASC  -- a -> z

SELECT *
FROM customer
ORDER BY first_name DESC  -- z -> a


-- for mysql
SELECT id , unit_price * quanity AS total_price
FROM products
ORDER BY total_price ASC


-- limiting
SELECT *
FROM orders
LIMIT 2


-- pagination
SELECT *
FROM orders
LIMIT 6 , 3  -- ✔ means skip 6 rows and take 3



-- works with multiple columns

-- 1. get all customers that they order something
SELECT order_id , c.customer_id , first_name , last_name
FROM orders o
    JOIN customers c
    ON o.customer_id = c.customer_id


--
SELECT porder_id , p.product_id , product_name , quantity , unit_price
FROM order_items oi
    JOIN products p
    ON oi.product_id = p.product_id


-- self join
SELECT
    e.employee_id,
    e.first_name AS 'employee name',
    m.first_name AS 'manager name'
FROM employee e JOIN employee m
    ON e.reports_to = m.employee_id



-- multi joining
-- orders -> customer
-- orders -> status
SELECT order_id, order_date , first_name , last_name , os.status
FROM orders o
    JOIN customer c ON o.customer_id = c.customer_id
    JOIN order_status os ON os.status_id = o.status


-- outer joining ( Left , Right)
-- Left Join

-- 1. get all customers whatever they have orders or not ( Get All Left Data ✅)
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customer c
     LEFT JOIN order o
     ON c.customer_id = o.customer_id
GROUP BY c.customer_id

-- 2. get all customers whatever they have orders or not (Get All Right Data ✅)
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM order o
     RIGHT JOIN customer c
     ON c.customer_id = o.customer_id
GROUP BY c.customer_id



--
SELECT *
FROM product p
LEFT JOIN  order_items oi
ON oi.product_id = p.product_id
GROUP BY p.product_id


-- multi outer joining ✅✅✅
-- select all customer , whatever they order or not
-- select all orders , whatever they shipped or not
SELECT
    c.customer_name,
    c.customer_id,
    o.order_id,
    sh.name AS 'shipper'
FROM customer c
LEFT JOIN order o
ON c.customer_id = o.customer_id
LEFT JOIN shipper sh
ON o.shipper_id = sh.shipper_id


-- Using clause 🚩🚩🚩
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customer c
JOIN order o
USING(customer_id) --this is equal to 💁‍♂️ ON c.customer_id = o.customer_id ''


















