#Find the top 10 users that have traveled the greatest distance. Output their id, name and a total distance traveled.

select 
   lyft_users.id,
   lyft_users.name,
   sum(lyft_rides_log.distance) as total_distance
from lyft_users
LEFT JOIN lyft_rides_log
     ON lyft_rides_log.user_id =lyft_users.id
GROUP BY 1
ORDER BY 3 desc
LIMIT 10;
