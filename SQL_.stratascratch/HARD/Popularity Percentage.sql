Meta/Facebook
Hard
ID 10284


#Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.
#Output each user along with their popularity percentage. Order records in ascending order by user id.
#The 'user1' and 'user2' column are pairs of friends.

with cte1 as(
     SELECT 
          user1 as user_id,
          user2 as frnd_id
     FROM facebook_friends
    UNION
     SELECT 
          user2,
          user1
     FROM facebook_friends)

SELECT 
    cte1.user_id,
    ROUND(COUNT(cte1.frnd_id)*100/(select COUNT(distinct cte1.user_id)from cte1),2) as Popularity_Percentage
FROM cte1
GROUP by 1
ORDER by 1;
