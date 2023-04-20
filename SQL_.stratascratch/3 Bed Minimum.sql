#Find the average number of beds in each neighborhood that has at least 3 beds in total. Output results along with the neighborhood name and sort the results based on the number of average beds in descending order.

select  DISTINCT
   neighbourhood,
   ROUND(AVG(bedrooms),0) as avg_bed
from airbnb_search_details
WHERE neighbourhood is not null
GROUP BY neighbourhood
HAVING SUM(beds) >= 3
ORDER BY avg_bed DESC;
