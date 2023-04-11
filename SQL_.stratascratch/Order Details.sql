#Find order details made by Jill and Eva.
#Consider the Jill and Eva as first names of customers.
#Output the order date, details and cost along with the first name.
#Order records based on the customer id in ascending order.

select 
   customers.first_name,
   orders.order_date,
   orders.order_details,
   orders.total_order_cost
from orders left join customers on customers.id = orders.cust_id
where customers.first_name in ('Jill','Eva')
order by orders.cust_id;
