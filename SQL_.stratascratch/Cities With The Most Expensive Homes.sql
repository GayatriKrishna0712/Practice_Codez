#Write a query that identifies cities with higher than average home prices when compared to the national average. Output the city names.

Select distinct x.city from (

select city,
avg(mkt_price) over (partition by city) as avgHomePrice,
avg(mkt_price) over () as nationalAvg
from zillow_transactions
) x
where x.avgHomePrice > x.nationalAvg
