#You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.

select 
   company_name,
   (COUNT(CASE WHEN year = 2020 THEN product_name END)-COUNT(CASE WHEN year = 2019 THEN product_name END)) as net_diff
from car_launches
group by company_name
ORDER BY net_diff ASC;
