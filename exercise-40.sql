select visited_on,amount,average_amount from
(
    select 
    visited_on,
    row_number() over(order by visited_on) as ranks,
    sum(amount2)  over(order by visited_on rows between 6 preceding and current row) as amount,
    round(avg(amount2) over(order by visited_on rows between 6 preceding and current row),2) as average_amount
    from (
        select amount2, visited_on 
        from (
            select visited_on, sum(amount) as amount2
            from Customer
            group by visited_on
        ) as subquery
    )as subquery2 
)as subquery3 where ranks >= 7