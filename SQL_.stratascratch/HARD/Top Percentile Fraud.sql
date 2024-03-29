Google
Netflix
Hard
ID 10303

#ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
#Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.




select * 
from (
   SELECT DISTINCT *,
   PERCENT_RANK()OVER(partition by state order by fraud_score DESC) as percentiles
   FROM fraud_score) x
where percentiles<=0.05;
