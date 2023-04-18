Netflix
Hard
ID 10171

#Find the genre of the person with the most number of oscar winnings. If there are more than one person with the same number of oscar wins, return the first one in alphabetic order based on their name. Use the names as keys when joining the tables.

select 
   top_genre
from nominee_information
where name in (
   select nominee from(
      select nominee,
             RANK() OVER(order by sum(winner) desc, nominee asc) as ranking
      from oscar_nominees
      group by nominee) x
     where ranking = 1);
