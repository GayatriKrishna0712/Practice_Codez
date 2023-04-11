# How many orders were shipped by Speedy Express in total?

select 
  count(so.order_id) as orders_shipped
from shopify_orders so
join shopify_carriers sc on so. carrier_id = sc.id 
 AND sc.name = 'Speedy Express';
 
