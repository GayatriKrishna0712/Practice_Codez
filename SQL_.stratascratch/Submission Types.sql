#Write a query that returns the user ID of all users that have created at least one ‘Refinance’ submission and at least one ‘InSchool’ submission.

SELECT 
   user_id,
   COUNT(DISTINCT type) as cnt
FROM loans
WHERE type in ('Refinance', 'InSchool')
GROUP BY user_id
HAVING cnt>=1
