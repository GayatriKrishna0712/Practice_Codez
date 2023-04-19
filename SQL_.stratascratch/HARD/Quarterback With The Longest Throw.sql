ESPN
Hard
ID 9966

#Find the quarterback who threw the longest throw in 2016. Output the quarterback name along with their corresponding longest throw. The 'lg' column contains the longest completion by the quarterback.

with t1 as
    (select qb,
        regexp_replace(lg,'t','') as lg_num
    from qbstats_2015_2016
    where year = 2016)

select qb, 
    lg_num
from t1
where lg_num in (select MAX(lg_num) from t1);
