use tranzact_test;
select * from tranzact_test.list_of_orders;

alter table order_details
rename column `Order ID` to Order_ID;

-- 1. STATISTICS REGARDING DATASET --
-- Total Number of orders  
select count(*) as total_order
 from tranzact_test.order_details;
 
 -- Total Quantity of products sold 
 select sum(quantity) as total_sold_quantity
 from order_details;
 
 -- Total profit made by the store 
 select sum(profit) as total_profit
 from order_details;
 
 -- No of customers 
 select count(distinct CustomerName) as  uniqu_customers
 from list_of_orders;
 
 -- Average price of products in the store 
 
 select avg(Amount) as average_price
 from order_details;
 
-- Least and the most expensive products in the store 

select 'least expensive product',min(Amount) as price
from order_details;

select 'most expensive product',max(Amount) as price 
from order_details;

select 'most expensive product ccategory', Category ,max(amount) as expensive_product
from order_details;

-- 2. ANALYTICAL QUESTIONS ---
-- status of the order 
SELECT *, 
CASE WHEN profit > 0 THEN 'Profit' 
	 WHEN profit < 0 THEN 'Loss' 
	 ELSE 'None' END AS Status 
FROM order_details; 

-- No of orders resulting in profit vs no of orders resulting in loss 
WITH cte_status AS
( SELECT *, 
CASE WHEN profit > 0 THEN 'Profit' 
	 WHEN profit < 0 THEN 'Loss' 
	 ELSE 'None' END AS Status 
FROM order_details) 

SELECT status, COUNT(1) AS counts 
FROM cte_status
GROUP BY status
ORDER BY counts DESC;




