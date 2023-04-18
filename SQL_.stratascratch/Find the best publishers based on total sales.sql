#Find the best publishers based on total sales made by each publisher. Output publishers alongside their total sales. Order records based on the sales in descending order.

select distinct
   publisher,
   SUM(total) as total_sales
from global_weekly_charts_2013_2014
GROUP BY 1
ORDER BY 2 desc;
