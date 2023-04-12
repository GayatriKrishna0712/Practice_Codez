#You have been asked to find the job titles of the highest-paid employees. Your output should include the highest-paid title or multiple titles with the same salary.

Tables: worker, title

select 
    title.worker_title as job_titles 
from title
join worker on worker.worker_id = title.worker_ref_id
where salary in(select 
                   max(salary) 
                from worker)
group by job_titles;
