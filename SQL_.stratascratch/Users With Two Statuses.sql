#Find users who are both a viewer and streamer.
select 
    user_id as users
from twitch_sessions
WHERE session_type in ('viewer','streamer')
GROUP BY users;
