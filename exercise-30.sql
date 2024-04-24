with tables as (select *,sum(weight) over(order by turn,weight) as calc  from queue order by turn desc)
select person_name from tables where calc <=1000
limit 1