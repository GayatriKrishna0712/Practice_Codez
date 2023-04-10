# Find the 3 most profitable companies in the entire world. Output the result along with the corresponding company name. Sort the result based on profits in descending order.
with cte1 as(
   select
      company,
      profits,
      rank() over(order by profits DESC) as rnk_profts
   from forbes_global_2010_2014) 
select company,profits from cte1 where cte1.rnk_profts < 4;
   
