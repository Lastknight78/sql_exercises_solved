select sell_date,count(product) as num_sold,group_concat(product order by product separator ",") as products
from (
    select distinct sell_date,product from Activities
) as subquery
group by sell_date