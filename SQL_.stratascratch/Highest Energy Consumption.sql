#Find the date with the highest total energy consumption from the Meta/Facebook data centers. Output the date along with the total energy consumption across all data centers.

WITH 
    unioned as (
         SELECT * FROM fb_eu_energy
         UNION
         SELECT * FROM fb_asia_energy
         UNION 
         SELECT * FROM fb_na_energy),
    totals as (
         SELECT date,
         SUM(consumption) as tc 
         FROM unioned
         GROUP BY date
         ORDER BY tc DESC)
SELECT * FROM totals 
WHERE tc =(SELECT max(tc) FROM totals);
         
