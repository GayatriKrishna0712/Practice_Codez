# Find the number of reviews received by Lo-Lo's Chicken & Waffles for each star. Output the number of stars along with the corresponding number of reviews. Sort records by stars in ascending order.
select 
   stars,
   COUNT(*) OVER(partition by stars order by stars ASC) as reviews_received
from yelp_reviews
where business_name like '%Lo-Lo%';

