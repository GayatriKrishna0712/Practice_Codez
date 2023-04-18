Amazon
Ebay
Best Buy
Hard
ID 10172

#Find the best selling item for each month (no need to separate months by year) where the biggest total invoice was paid. The best selling item is calculated using the formula (unitprice * quantity). Output the description of the item along with the amount paid.

with cte1 as(
     SELECT 
         description,
         DATE_FORMAT(invoicedate,'%m') as months,
         SUM(unitprice*quantity) as total_invoice
     FROM online_retail
     GROUP BY 1,2
     ORDER BY 2,3 DESC),
     
     cte2 as(
     SELECT 
         *,
         RANK() OVER(partition by months order by total_invoice desc) as ranking
     FROM cte1)

SELECT 
    months,
    description,
    total_invoice 
FROM cte2
WHERE ranking =1;
