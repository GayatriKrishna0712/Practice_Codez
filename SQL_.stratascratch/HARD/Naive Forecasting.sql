Uber
Hard
ID 10313

#Some forecasting methods are extremely simple and surprisingly effective. Naïve forecast is one of them; we simply set all forecasts to be the value of the last observation. Our goal is to develop a naïve forecast for a new metric called "distance per dollar" defined as the (distance_to_travel/monetary_cost) in our dataset and measure its accuracy.
#To develop this forecast,  sum "distance to travel"  and "monetary cost" values at a monthly level before calculating "distance per dollar". This value becomes your actual value for the current month. The next step is to populate the forecasted value for each month. This can be achieved simply by getting the previous month's value in a separate column. Now, we have actual and forecasted values. This is your naïve forecast. Let’s evaluate our model by calculating an error matrix called root mean squared error (RMSE). RMSE is defined as sqrt(mean(square(actual - forecast)). Report out the RMSE rounded to the 2nd decimal spot.


WITH cte1 as (
   SELECT 
      EXTRACT(MONTH FROM request_date) as months,
      SUM(distance_to_travel)/sum(monetary_cost) as actual_val
   FROM uber_request_logs
   GROUP BY months)
   
select round(sqrt(avg(SE)),2) AS RMSE
from (select months,
        (actual_val - lag(actual_val) over(order by months asc))^2 as SE
    from cte1) cte2;
