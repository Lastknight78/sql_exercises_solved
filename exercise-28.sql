select employee_id,department_id 
from Employee
where (employee_id,primary_flag) in (select employee_id,
    case when count(primary_flag) = 1 and primary_flag = "N" then "N"
         when count(primary_flag) = 1 and primary_flag = "Y" then "Y"
         else "Y"
    end as primary_flag
    from Employee
    group by employee_id)
