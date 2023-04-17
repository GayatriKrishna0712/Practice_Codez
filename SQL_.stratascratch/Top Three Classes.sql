#The marketing department wants to launch a new promotion for the most successful product classes. What are the top 3 product classes by number of sales?
#Tables: facebook_products, facebook_sales

select 
   product_class,
   facebook_sales.units_sold as n_sales
from facebook_products
LEFT JOIN facebook_sales 
     ON facebook_products.product_id = facebook_sales.product_id
GROUP BY product_class
ORDER BY n_sales DESC
LIMIT 3;
