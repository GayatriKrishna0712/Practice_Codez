Uber
Hard
ID 10302


#You’re given a dataset of uber rides with the traveling distance (‘distance_to_travel’) and cost (‘monetary_cost’) for each ride. For each date, find the difference between the distance-per-dollar for that date and the average distance-per-dollar for that year-month. Distance-per-dollar is defined as the distance traveled divided by the cost of the ride.


#The output should include the year-month (YYYY-MM) and the absolute average difference in distance-per-dollar (Absolute value to be rounded to the 2nd decimal).
You should also count both success and failed request_status as the distance and cost values are populated for all ride requests. Also, assume that all dates are unique in the dataset. Order your results by earliest request date first.


with cte1 as
    (select DATE_FORMAT(request_date,'%Y-%m') as ym,
        abs(distance_to_travel/monetary_cost - avg(distance_to_travel/monetary_cost) over(partition by DATE_FORMAT(request_date,'%Y-%m'))) as abs_diff
    from uber_request_logs)

select date,
    ROUND(avg(abs_diff),2) as abs_avg_diff
from cte1
group by ym
order by ym;
