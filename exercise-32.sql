select department,employee,salary
from (select department,employee,salary,dense_rank() over(partition by department order by salary desc ) AS ranks
        from (select d.name as department,e.name as employee,e.salary
                from Employee e
                join Department d on
                    e.departmentId = d.id) as tables) as tables2
where ranks <= 3
