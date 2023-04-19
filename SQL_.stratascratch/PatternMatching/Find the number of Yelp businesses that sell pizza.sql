
#Find the number of Yelp businesses that sell pizza

select 
  COUNT(*) as n_business_men
from yelp_business
WHERE categories REGEXP 'pizza';
