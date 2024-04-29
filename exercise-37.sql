select request_at as day, round(cancelled_count/total_count,2) as "Cancellation Rate"
from (
    select request_at,count(status) as total_count,
sum(case when status != "completed" then 1 else 0 end) as cancelled_count
from (
    select * from Trips where client_id in (select users_id from Users where banned != "Yes")
    and driver_id in (select users_id from Users where banned != "Yes")
)as sub
where request_at between "2013-10-01" and "2013-10-03"
group by request_at
) as sub