#Find all users that have performed at least one scroll_up event.

select 
  user_id as users
from facebook_web_log
where action = 'scroll_up'
group by users
HAVING COUNT(*)>=1
