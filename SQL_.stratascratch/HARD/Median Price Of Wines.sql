Wine Magazine
Hard
ID 10043

#Find the median price for each wine variety across both datasets. Output distinct varieties along with the corresponding median price.

with t1 as
    (select variety, price from winemag_p1
    union all
    select variety, price from winemag_p2),
    
    t2 as(
    select *,
    ROW_NUMBER() OVER(order by price asc) as asc_price,
    ROW_NUMBER() OVER(order by price desc) as desc_price
    from t1)
SELECT distinct
    variety,
    avg(price) over(partition by variety) from t2
where abs(asc_price-desc_price)>=0
order by variety;
