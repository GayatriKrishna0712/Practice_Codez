# Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

select distinct
    a.user_id
from amazon_transactions a
JOIN amazon_transactions b on a.user_id = b.user_id
WHERE a.created_at-b.created_at between 0 and 7
AND a.id<>b.id
ORDER BY 1 ASC;
