Salesforce
LinkedIn
Hard
ID 9919

#Find the highest salary among salaries that appears only once.

select MAX(salary) as uniq_max_salary
from 
    (select salary,
        count(*) as freq
    from employee
    group by salary) b
where freq = 1;
