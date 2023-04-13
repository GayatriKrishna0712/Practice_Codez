# Find the number of orders, the number of customers, and the total cost of orders for each city. Only include cities that have made at least 5 orders and count all customers in each city even if they did not place an order.
# Output each calculation along with the corresponding city name.

select 
 city,
 COUNT(o.id) as no_orders,
 COUNT(c.id) as no_customer,
 COALESCE(SUM(total_order_cost),0) as total_order_cost
FROM customers c
LEFT JOIN orders o on c.id = o.cust_id
GROUP BY city
HAVING COUNT(o.id) >=5;
