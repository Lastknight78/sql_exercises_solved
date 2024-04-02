select e.name as Employee from Employee e
left join Employee b on
    e.managerID = b.id
where e.salary > b.salary