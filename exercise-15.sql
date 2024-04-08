with tables as (select u.user_id,join_date,
    case when order_date between "2019-01-01" and "2019-12-31" then count(*)
         when o.buyer_id is null then 0
         else 0
    end as orders
    from Users u
    left join Orders o on
        u.user_id = o.buyer_id
    left join Items i on
        o.item_id = i.item_id
    group by buyer_id,order_date)
select user_id as buyer_id,join_date,sum(orders) as orders_in_2019 from tables
group by buyer_id