select m.employee_id,m.name,count(e.reports_to) as reports_count,round(avg(e.age)) as average_age from Employees e
join employees m on
    e.reports_to = m.employee_id
group by e.reports_to
order by m.employee_id