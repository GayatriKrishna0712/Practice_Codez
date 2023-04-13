#You’re given a table of Uber rides that contains the mileage and the purpose for the business expense.  You’re asked to find business purposes that generate the most miles driven for passengers that use Uber for their business transportation. Find the top 3 business purpose categories by total mileage.

select 
    purpose as business_purposes,
    SUM(miles) as total_miles
from my_uber_drives
WHERE category = 'Business'
    and purpose is not null
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;
