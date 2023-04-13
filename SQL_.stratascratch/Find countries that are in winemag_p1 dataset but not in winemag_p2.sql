
# Find countries that are in winemag_p1 dataset but not in winemag_p2.
#Output distinct country names.Order records by the country in ascending order.

#Tables: winemag_p1, winemag_p2

select distinct
   winemag_p1.country 
from winemag_p1
left join winemag_p2 
     on winemag_p1.id = winemag_p2.id
WHERE winemag_p2.country is null
ORDER BY 1 ASC;
