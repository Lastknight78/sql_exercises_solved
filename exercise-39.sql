select distinct num as ConsecutiveNums from (
    select
    id,
    num, 
    lead(num,1) over(order by id) as next_num,
    lag(num,1) over(order by id) as prev_num,
    lead(id,1) over(order by id) as next_id,
    lag(id,1) over(order by id) as prev_id
from Logs
) as subquery
where id-prev_id = 1 and next_id - id = 1 and num = next_num and num = prev_num


