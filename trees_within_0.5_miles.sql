
WITH TreeCounts AS (
    SELECT
        nyc_zipcodes."ZIPCODE",
        COUNT(trees.tree_id) AS tree_count
    FROM
        nyc_zipcodes
    LEFT JOIN
        trees ON ST_Within(trees.geometry, nyc_zipcodes.geometry) and trees."zipcode"=nyc_zipcodes."ZIPCODE"
    GROUP BY
        nyc_zipcodes."ZIPCODE"
    ORDER BY
        tree_count DESC
    LIMIT 10
)

SELECT
    tc."ZIPCODE",
    tc.tree_count
FROM
    TreeCounts tc
ORDER BY
    tc.tree_count DESC;
