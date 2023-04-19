#Find the number of employees who received the bonus and who didn't. Bonus values in employee table are corrupted so you should use  values from the bonus table. Be aware of the fact that employee can receive more than bonus.
#Output value inside has_bonus column (1 if they had bonus, 0 if not) along with the corresponding number of employees for each.


SELECT 
    has_bonus,
    COUNT(id) as n_employees
FROM(
     SELECT distinct employee.id,
     (CASE WHEN bonus.worker_ref_id is null THEN 0 ELSE 1 END)as has_bonus
     FROM employee 
     LEFT JOIN bonus
          ON employee.id = bonus.worker_ref_id) x
GROUP BY 1;
