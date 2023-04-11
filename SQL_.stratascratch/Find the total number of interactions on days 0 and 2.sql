#Find the total number of interactions on days 0 and 2.
#Output the result alongside the day.

select 
   day,
   COUNT(*) as n_interaction
from facebook_user_interactions
where day in(0,2)
group by day;
