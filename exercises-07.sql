SELECT m.name
FROM Employee AS e 
LEFT JOIN Employee AS m on
    e.managerId = m.id
GROUP BY m.id
HAVING IFNULL(COUNT(m.id),0) >= 5
