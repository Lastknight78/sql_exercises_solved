select subs1.query_name,quality,ifnull(poor_query_percentage,0) as poor_query_percentage from (
    select query_name, ROUND(AVG(rating/position),2) AS quality
from Queries
where query_name is not null
group by query_name
) as subs1
left join (
    select sub1.query_name,round((count1/count2)*100,2) as poor_query_percentage from (
    select query_name,count(rating) as count1 from Queries
    where rating < 3
    group by query_name
    ) as sub1
    join (
    select query_name,count(rating) as count2 from Queries
    group by query_name
    ) as sub2 on sub1.query_name = sub2.query_name
) as subs2 on subs1.query_name = subs2.query_name
