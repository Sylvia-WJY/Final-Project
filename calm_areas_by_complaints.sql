
SELECT incident_zip AS zip_code, COUNT(*) AS complaint_count
FROM complaints_311
WHERE created_date BETWEEN '2022-10-01' AND '2023-11-30'
GROUP BY incident_zip
ORDER BY complaint_count DESC;
