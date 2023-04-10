#Which partners have ‘pizza’ in their name and are located in Boston? And what is the average order amount? Output the partner name and the average order amount.

#Tables: postmates_orders, postmates_markets, postmates_partners

select pp.name, avg(po.amount) from postmates_orders as po
join postmates_partners as pp on pp.id = po.seller_id
where pp.name like '%pizza%' 
and city_id in(select id from postmates_markets where name ='Boston')
group by pp.name
