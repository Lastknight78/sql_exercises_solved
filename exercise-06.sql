select round(count(*)/(select count(distinct player_id) from Activity),2) as fraction
from activity a,activity b 
where a.event_date - b.event_date = 1 
    and a.player_id = b.player_id 
group by a.player_id
