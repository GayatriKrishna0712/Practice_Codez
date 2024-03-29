City of San Francisco
Hard
ID 9989

#Find the top 2 highest paid City employees for each job title. Output the job title along with the corresponding highest and second-highest paid employees.


with t1 as
    (select employeename,
        jobtitle,
        row_number() over(partition by jobtitle order by totalpaybenefits desc) as ranking
    from sf_public_salaries),

hp as
    (select employeename, jobtitle from t1 where ranking = 1),

shp as
    (select employeename, jobtitle from t1 where ranking = 2)

select hp.jobtitle,
    hp.employeename as highest,
    shp.employeename as second_highest
from hp
left join shp
on hp.jobtitle = shp.jobtitle;
