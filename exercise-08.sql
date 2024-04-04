SELECT round(sum(tiv_2016),2) AS tiv_2016 
FROM Insurance
WHERE (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
) AND tiv_2015 IN 
    (SELECT i.tiv_2015
    FROM Insurance i
    JOIN insurance c ON i.tiv_2015 = c.tiv_2015
    WHERE i.pid <> c.pid)
;