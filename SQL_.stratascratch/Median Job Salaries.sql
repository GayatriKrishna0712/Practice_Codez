City of San Francisco
Hard
ID 9983

#Find the median total pay for each job. Output the job title and the corresponding total pay, and sort the results from highest total pay to lowest.



with cte1 as(
    select *,
    ROW_NUMBER() OVER(order by totalpay asc) as asc_pay,
    ROW_NUMBER() OVER(order by totalpay desc) as desc_pay
    from sf_public_salaries)
SELECT distinct
    jobtitle,
    avg(totalpay) over(partition by jobtitle)  as median_sal
from cte1
where abs(desc_pay-asc_pay)>=0
order by median_sal desc;
