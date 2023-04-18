Meta/Facebook
Hard
ID 10084

#Calculate the running total (i.e., cumulative sum) energy consumption of the Meta/Facebook data centers in all 3 continents by the date. Output the date, running total energy consumption, and running total percentage rounded to the nearest whole number.

with cte1 as(
     select * from fb_eu_energy
     union all
     select * from fb_na_energy
     union all
     select * from fb_asia_energy),
    cte2 as(
     select 
       date, 
       sum(consumption) as total
     from cte1
     group by date)
select date,
       total,
       sum(total) over(order by date asc) as running_total,
       round(sum(total) over(order by date asc)*100/(select sum(total) from cte2),0) as running_total_percentage 
from cte2;
