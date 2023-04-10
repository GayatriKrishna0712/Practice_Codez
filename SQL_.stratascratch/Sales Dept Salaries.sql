# Find employees in the Sales department who achieved a target greater than 150.
#Output first names of employees.
#Sort records by the first name in descending order.

select 
 first_name as name
from employee
where department = 'Sales'
      AND target>150 
order by first_name DESC;
