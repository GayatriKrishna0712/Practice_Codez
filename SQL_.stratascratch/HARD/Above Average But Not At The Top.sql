City of San Francisco
Hard
ID 9985

#Find all people who earned more than the average in 2013 for their designation but were not amongst the top 5 earners for their job title. Use the totalpay column to calculate total earned and output the employee name(s) as the result.

with t1 as
    (select employeename,
        jobtitle,
        totalpay,
        rank() over(partition by jobtitle order by totalpay desc) as ranking,
        avg(totalpay) over(partition by jobtitle) as avgpay
    from sf_public_salaries
    where year = 2013)

select employeename
from t1
where totalpay > avgpay and ranking > 5;
