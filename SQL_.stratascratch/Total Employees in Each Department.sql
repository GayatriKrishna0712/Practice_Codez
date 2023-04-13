#Find the number of employees in each department. Output the department name along with the corresponding number of employees.
select department,count(*) "no of emp" from worker group by department;
