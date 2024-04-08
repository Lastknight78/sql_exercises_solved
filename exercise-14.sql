select product_id, year as first_year, quantity, price
from Sales
where (product_id,year) in (select p.product_id,min(year) from Sales s
    join Product p on
        s.product_id = p.product_id
    group by p.product_id)