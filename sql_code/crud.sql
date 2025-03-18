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
    SUM(product_prices) as 'total',
    MAX(product_prices) as 'max',
    MIN(product_prices) as 'min',
    AVG(product_prices) as 'avg',
    COUNT(product_id) as 'count'
FROM
    products


