#Classify each business as either a restaurant, cafe, school, or other.


•	A restaurant should have the word 'restaurant' in the business name.
•	A cafe should have either 'cafe', 'café', or 'coffee' in the business name.
•	A school should have the word 'school' in the business name.
•	All other businesses should be classified as 'other'.


#Output the business name and their classification.

select DISTINCT business_name, 
case when business_name Ilike '%restaurant%' then 'restaurant'
when business_name Ilike '%cafe%' 
or business_name Ilike '%coffee%' 
or business_name Ilike '%café%' then 'cafe'
when business_name Ilike '%school%' then 'school'
else 'other' end as business_type
from sf_restaurant_health_violations
order by business_type
