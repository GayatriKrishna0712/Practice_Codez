#Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
#You may have duplicate rows in your results due to a customer ordering several of the same items. Sort records based on the customer's first name and the order details in ascending order.

select 
  customers.first_name,
  customers.last_name,
  customers.city,
  orders.order_details
from customers
left join orders on orders.cust_id = customers.id
order by customers.first_name,orders.order_details ASC;
