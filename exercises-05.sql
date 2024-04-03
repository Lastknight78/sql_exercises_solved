select Department.name as Department,Employee.name as Employee,Employee.salary as Salary
from department
inner join Employee on
    department.id = Employee.departmentId
where (Employee.departmentId,Salary) in (select Employee.departmentId, max(Salary)
from department
inner join Employee on
    department.id = Employee.departmentId
group by Department.name
)
