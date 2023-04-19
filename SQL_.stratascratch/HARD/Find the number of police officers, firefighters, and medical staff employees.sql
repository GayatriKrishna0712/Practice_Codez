City of San Francisco
Hard
ID 9977


#Find the number of police officers (job title contains substring police), firefighters (job title contains substring fire), and medical staff employees (job title contains substring medical) based on the employee name.
Output each job title along with the corresponding number of employees.


SELECT 
    'FireFighters' as job_title,
    COUNT(employeename) as cnt
FROM sf_public_salaries
WHERE jobtitle REGEXP 'fire' 
UNION
SELECT 
   'Police Officer' as job_title,
   COUNT(employeename) as cnt
FROM sf_public_salaries
WHERE jobtitle REGEXP 'police'
UNION
SELECT 
   'Medical staff' as job_title,
   COUNT(employeename) as cnt
FROM sf_public_salaries
WHERE jobtitle REGEXP 'medical';
