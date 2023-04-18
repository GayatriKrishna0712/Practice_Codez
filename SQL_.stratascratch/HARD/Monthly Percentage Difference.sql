Amazon
Hard
ID 10319

#Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.
#The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

select 
    DATE_FORMAT(created_at,'%Y-%m') as ym,
    ROUND((SUM(value)-LAG(SUM(value)) OVER())/LAG(SUM(value)) OVER()*100,2) as pert_diff
from sf_transactions
GROUP BY ym
ORDER BY ym;
