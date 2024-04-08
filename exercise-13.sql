select product_id,product_name from Product
where product_id not in (select p.product_id
    from Product p
    join Sales s on p.product_id = s.product_id
    where not sale_date between "2019-01-01" and "2019-03-31")
and product_id in (select product_id from Sales)