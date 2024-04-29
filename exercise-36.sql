select user_id,
case when counts = 0 then 0
     else round(cases/counts,2)
end as confirmation_rate
from (
    select s.user_id,count(action) as counts,
sum(case when action = "null" then 0
when action = "confirmed" then 1 else 0 end) as cases
from Signups s
left join Confirmations c on
    s.user_id = c.user_id
group by s.user_id 
) as subquery