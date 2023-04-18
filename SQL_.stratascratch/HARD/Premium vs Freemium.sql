Microsoft
Hard
ID 10300

#Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

#Tables: ms_user_dimension, ms_acc_dimension, ms_download_facts


WITH cte1 as(
    SELECT
         ms_download_facts.date,
         ms_download_facts.downloads,
         ms_acc_dimension.paying_customer
    FROM ms_download_facts
    INNER JOIN ms_user_dimension 
          ON ms_user_dimension.user_id = ms_download_facts.user_id
    INNER JOIN ms_acc_dimension
          ON ms_acc_dimension.acc_id = ms_user_dimension.acc_id),
    
    cte2 as(
    SELECT 
       date,
       SUM(case when paying_customer = 'no' THEN downloads else 0 END) as non_paying,
       SUM(case when paying_customer = 'yes' THEN downloads else 0 END) as paying
    FROM cte1
    GROUP BY date)
    
SELECT * from cte2 WHERE non_paying>paying ORDER BY date;
     
