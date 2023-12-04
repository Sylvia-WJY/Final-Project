
WITH RentTreeCounts AS (
    SELECT
        hr."RegionName" AS zip_code,
        AVG(hr."Rent") AS average_rent,
        COUNT(t.tree_id) AS tree_count
    FROM
        historical_rent hr
    LEFT JOIN
        trees t ON hr."RegionName" = t.zipcode
    WHERE
        EXTRACT(MONTH FROM hr."Date") = 1
    GROUP BY
        hr."RegionName"
),

ComplaintCounts AS (
    SELECT
        c.incident_zip AS zip_code,
        COUNT(c.id) AS complaint_count
    FROM
        complaints_311 c
    WHERE
        EXTRACT(MONTH FROM c.created_date) = 1 
    GROUP BY
        c.incident_zip
)

(SELECT
    rtc.zip_code,
    TO_CHAR(ROUND(AVG(rtc.average_rent)::numeric, 2), '9,999.99') AS average_rent,
    rtc.tree_count,
    COALESCE(cc.complaint_count, 0) AS complaint_count
FROM
    RentTreeCounts rtc
LEFT JOIN
    ComplaintCounts cc ON rtc.zip_code = cc.zip_code
GROUP BY
    rtc.zip_code, rtc.tree_count, cc.complaint_count
ORDER BY
    AVG(rtc.average_rent) ASC
LIMIT 5)

UNION

(SELECT
    rtc.zip_code,
    TO_CHAR(ROUND(AVG(rtc.average_rent)::numeric, 2), '9,999.99') AS average_rent,
    rtc.tree_count,
    COALESCE(cc.complaint_count, 0) AS complaint_count
FROM
    RentTreeCounts rtc
LEFT JOIN
    ComplaintCounts cc ON rtc.zip_code = cc.zip_code
GROUP BY
    rtc.zip_code, rtc.tree_count, cc.complaint_count
ORDER BY
    AVG(rtc.average_rent) DESC
LIMIT 5);
    
