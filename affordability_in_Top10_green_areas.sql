
WITH TopTreeZips AS (
    SELECT zipcode, COUNT(*) AS tree_count
    FROM trees
    GROUP BY zipcode
    ORDER BY tree_count DESC
    LIMIT 10
)
SELECT zipcode, CAST(ROUND(CAST(AVG(h."Rent") AS NUMERIC), 2) AS float8)
FROM TopTreeZips t JOIN historical_rent h 
ON t.zipcode = h."RegionName"
WHERE h."Date" = '2023-08-31' 
GROUP BY t.zipcode, t.tree_count
ORDER BY t.tree_count DESC;
