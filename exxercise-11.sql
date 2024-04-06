select customer_id
from Customer c
right join Product p on
    p.product_key = c.product_key
group by customer_id
having count(distinct customer_id,p.product_key) >= (select count(*) from product)