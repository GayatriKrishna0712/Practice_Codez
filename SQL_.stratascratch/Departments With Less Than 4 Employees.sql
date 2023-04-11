# Find departments with less than 4 employees.

select 
   department,
   COUNT(worker_id) as n_workers
from worker
group by department
HAVING COUNT(worker_id)<4;
