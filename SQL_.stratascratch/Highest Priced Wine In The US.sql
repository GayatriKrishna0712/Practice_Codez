# Find the highest price in US country for each variety produced in English speaking regions, but not in Spanish speaking regions, with taking into consideration varieties that have earned a minimum of 90 points for every country they're produced in.
Output both the variety and the corresponding highest price.
#Let's assume the US is the only English speaking region in the dataset, and Spain, Argentina are the only Spanish speaking regions in the dataset. Let's also assume that the same variety might be listed under several countries so you'll need to remove varieties that show up in both the US and in Spanish speaking countrie

select
   variety,
   MAX(price)
from winemag_p1
WHERE country = 'US'
   AND variety NOT IN (
        SELECT DISTINCT variety from winemag_p1
        WHERE country in('Spain','Argentina') 
           and points>=90)
GROUP BY variety;
