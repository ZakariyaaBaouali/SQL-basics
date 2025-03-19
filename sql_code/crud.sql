-- Inserting data
INSERT INTO customer ( first_name , last_name , email)
VALUES ('John' ,  'Smith' , 'example@gmail.com')


SELECT LAST_INSERT_ID();

-- clone a table
CREATE TABLE order_archived AS
SELECT * FROM order


-- sub quiries
SELECT *
FROM customer
WHERE customer_id IN (
    select customer_id
    from order
    where order_status = "completed"
)

-- UPDATES
UPDATE customer SET first_name = "New Name" WHERE customer_id = 1

UPDATE customer SET first_name = "New Name"
WHERE  customer_id IN (select customer_id from orders where order_status = 'delivered')


--Deleting
DELETE FROM customer where customer_id = 2


-- Functions
SELECT
    product_id,
    SUM(product_prices) as 'total',
    MAX(product_prices) as 'max',
    MIN(product_prices) as 'min',
    AVG(product_prices) as 'avg',
    COUNT(product_id) as 'count'
FROM
    products
GROUP BY product_id
HAVING total > 500



--- example 01
SELECT
    c.customer_id,
    o.order_id,
    SUM(oi.quantity * oi.price) AS total_sales
FROM customer c
JOIN order o USING(customer_id)
JOIN order_items oi USING(order_id)
GROUP BY c.customer_id
HAVING total_sales >= 200


-- WITH  ROLLUP
-- all
SELECT
    *
FROM
    products
where .. > all (10 , 20 , 30 , 40)  -- greater than all of them
where .. > any (10 , 20 , 30 , 40)  -- greater any of them
--
