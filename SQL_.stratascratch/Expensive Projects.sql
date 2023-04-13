#Given a list of projects and employees mapped to each project, calculate by the amount of project budget allocated to each employee . 
#The output should include the project title and the project budget rounded to the closest integer.
#Order your list by projects with the highest budget per employee firs

SELECT 
    title,
    (budget/no_employees) as budget_per_emp
FROM (SELECT DISTINCT title,
           budget,
           -- find the total employee per project
           COUNT(*) OVER(PARTITION BY title) no_employees
    FROM ms_projects
    JOIN ms_emp_projects
        ON ms_projects.id = ms_emp_projects.project_id)
budget_emps
-- sort them by desc order
ORDER BY 2 DESC
