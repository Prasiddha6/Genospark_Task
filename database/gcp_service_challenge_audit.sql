USE emsdb_test;

SELECT
    cs.service_id,
    cs.service_code,
    cs.service_name,
    COUNT(ch.level) AS challenge_count,
    GROUP_CONCAT(ch.level ORDER BY ch.level) AS assigned_levels
FROM cloud_services cs
LEFT JOIN challenge_services ch
    ON ch.service_id = cs.service_id
    AND ch.provider_id = 3
WHERE cs.provider_id = 3
GROUP BY cs.service_id, cs.service_code, cs.service_name
ORDER BY cs.service_name;

SELECT
    cs.service_id,
    cs.service_code,
    cs.service_name
FROM cloud_services cs
LEFT JOIN challenge_services ch
    ON ch.service_id = cs.service_id
    AND ch.provider_id = 3
WHERE cs.provider_id = 3
  AND ch.service_id IS NULL
ORDER BY cs.service_name;
