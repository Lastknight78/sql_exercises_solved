with tables as (select student,
case when id % 2 = 0 then id - 1
     when id % 2 = 1 and id = (select max(id) from Seat) then id 
     else id+1
end as id
from Seat)
select t.id,t.student from seat s
left join tables t
on s.id = t.id
union
select t.id,t.student from seat s
left join tables t
on s.id = t.id
