#Find all workers whose salary lies between 100,000 and 500,000 inclusive.
select 
  first_name,last_name
from worker 
where salary between 100000 and 500000;
