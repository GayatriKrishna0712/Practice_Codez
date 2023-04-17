#Calculate the percentage of the total spend a customer spent on each order. Output the customer’s first name, order details, and percentage of the order cost to their total spend across all orders.



select first_name,
order_details,
round(cast(total_order_cost/ sum(total_order_cost) over (partition by first_name) as float)*100)  AS PERCENTAGE_TOTAL_SPENT
from Orders o INNER JOIN
Customers c ON
o.cust_id=c.id
order by first_name
