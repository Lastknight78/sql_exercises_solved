select
case when (select count(*) from Employee) = 1 then null
     else (select max(salary) from (select salary,dense_rank() over(order by salary desc) as dense_ranks from Employee) as sub
            where dense_ranks = 2)
end as SecondHighestSalary

