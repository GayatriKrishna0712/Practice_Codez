Meta/Facebook
Hard
ID 10297

#Write a query to calculate the distribution of comments by the count of users that joined Meta/Facebook between 2018 and 2020, for the month of January 2020.
#The output should contain a count of comments and the corresponding number of users that made that number of comments in Jan-2020. For example, you'll be counting how many users made 1 comment, 2 comments, 3 comments, 4 comments, etc in Jan-2020. Your left column in the output will be the number of comments while your right column in the output will be the number of users. Sort the output from the least number of comments to highest.
#To add some complexity, there might be a bug where an user post is dated before the user join date. You'll want to remove these posts from the result.

with cte1 as(
     SELECT 
           fb_users.id,
           COUNT(fb_comments.body) as n_comments
     FROM fb_comments
     INNER JOIN fb_users
          ON fb_users.id = fb_comments.user_id
     WHERE 
         fb_comments.created_at BETWEEN '2020-01-02' and '2020-01-31'
        AND DATE_FORMAT(fb_users.joined_at,'%Y') BETWEEN 2018 and 2020
        AND fb_comments.created_at>fb_users.joined_at
     GROUP BY fb_users.id),

     cte2 as(
     SELECT
           n_comments,
           COUNT(*) as n_users
     FROM cte1
     GROUP BY n_comments)

SELECT * FROM cte2 order by n_comments;
     
