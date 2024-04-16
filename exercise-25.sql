SELECT 
    CONCAT(YEAR(trans_date), '-', LPAD(MONTH(trans_date), 2, '0')) AS month,
    country,count(*) as trans_count,
    sum(case when state = "approved" then 1 else 0 end) as approved_count,
    sum(amount) as trans_total_amount,
    sum(case when state = "approved" then amount else 0 end) as approved_total_amount
FROM Transactions
group by country,CONCAT(YEAR(trans_date), '-', LPAD(MONTH(trans_date), 2, '0'))