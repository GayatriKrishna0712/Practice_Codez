#Find the number of employees in each department.
#Output the department name along with the corresponding number of employees.
#Sort records based on the number of employees in descending order.

select distinct
  department,
  COUNT(id) OVER(partition by department) as cnt_dept
from employee
order by cnt_dept DESC
