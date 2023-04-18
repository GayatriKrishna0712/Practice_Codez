City of San Francisco
Hard
ID 9979

#Find the top 5 highest paid and top 5 least paid employees in 2012.
#Output the employee name along with the corresponding total pay with benefits.
#Sort records based on the total payment with benefits in ascending order.


select 
   employeename,
   totalpaybenefits
from (
   SELECT year,employeename,totalpaybenefits,
       RANK() OVER(order by totalpaybenefits desc) Top5H,
       RANK() OVER(order by totalpaybenefits asc) Top5L
    FROM sf_public_salaries
    WHERE year = 2012) x
WHERE  Top5H<=5 or Top5L <=5
ORDER BY totalpaybenefits;

