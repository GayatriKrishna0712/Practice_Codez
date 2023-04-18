Amazon
Hard
ID 10314

#Find the 3-month rolling average of total revenue from purchases given a table with users, their purchase amount, and date purchased. Do not include returns which are represented by negative purchase values. Output the year-month (YYYY-MM) and 3-month rolling average of revenue, sorted from earliest month to latest month.

SELECT m.month_year,
       	 AVG(m.revenue_month) OVER(ORDER BY m.month_year ROWS 
BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_avg
FROM
  (SELECT to_char(created_at::date, 'YYYY-MM') AS month_year,
          sum(purchase_amt) AS revenue_month
   FROM amazon_purchases
   WHERE purchase_amt>=0
         GROUP BY month_year) m
