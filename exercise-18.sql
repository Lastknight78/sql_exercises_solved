with tables as (select requester_id id
from RequestAccepted
union all
select accepter_id id
from RequestAccepted)
select id,count(*) as num from tables
group by id
order by num desc
limit 1