Twitter
Hard
ID 9898

#Find the top three distinct salaries for each department. Output the department name and the top 3 distinct salaries by each department. Order your results alphabetically by department and then by highest salary to lowest.

with t1 as
    (select distinct department,
        salary,
        dense_rank() over(order by salary desc) as ranking
    from twitter_employee
    group by department)
    

select distinct department,
    salary
from t1
where ranking <=3
order by department, salary desc;
