# Select the most popular client_id based on a count of the number of users who have at least 50% of their events from the following list: 'video call received', 'video call sent', 'voice call received', 'voice call sent'.
SELECT 
    client_id
FROM fact_events
WHERE user_id in 
        (SELECT  
            user_id
        FROM fact_events
        GROUP BY user_id
        HAVING CAST(SUM(
            CASE
                WHEN event_type IN ('video call received',
                    'video call sent', 'voice call received',
                    'voice call sent')
                    THEN 1
                ELSE 0
            END) AS FLOAT)  / COUNT(event_type) >= 0.5)
GROUP BY 
    client_id
ORDER BY COUNT(user_id) DESC
LIMIT 1
