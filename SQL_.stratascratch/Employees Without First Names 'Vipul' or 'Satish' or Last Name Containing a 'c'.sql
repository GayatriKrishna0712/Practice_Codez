#Find information on employees who do not have the first names 'Vipul' or 'Satish' or a last name that contains a 'c'.

#Table: worker
select * 
from worker
where first_name != 'Vipul' 
    and first_name !='Satish'
    and last_name  NOT LIKE '%c%';
