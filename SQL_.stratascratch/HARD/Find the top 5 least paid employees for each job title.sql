City of San Francisco
Hard
ID 9986

#Find the top 5 least paid employees for each job title.
#Output the employee name, job title and total pay with benefits for the first 5 least paid employees. Avoid gaps in ranking.

select 
   employeename,
   jobtitle,
   totalpaybenefits
from (
    select 
    employeename,jobtitle,totalpaybenefits,
    dense_rank() OVER(partition by jobtitle order by totalpaybenefits) as top5L
    from sf_public_salaries) x
where top5L<=5;
