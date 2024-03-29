#Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output customer's first name, total cost of their items, and the date.
# For simplicity, you can assume that every first name in the dataset is unique.

select distinct
   customers.first_name,
   orders.order_date,
   SUM(orders.total_order_cost) 
from customers 
inner join orders 
     on customers.id = orders.cust_id
where orders.order_date between '2019-02-01' and  '2019-05-01'
group by customers.first_name,orders.cust_id,orders.order_date
order by SUM(orders.total_order_cost) DESC
LIMIT 1;
