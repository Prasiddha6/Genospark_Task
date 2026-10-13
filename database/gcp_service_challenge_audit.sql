-- Genospark EMS
-- GCP service-to-challenge audit
-- Provider ID: 3
-- Read-only audit for emsdb_test

USE emsdb_test;

SELECT
    cs.service_id,
    cs.service_code,
    cs.service_name,
    COUNT(ch.level) AS challenge_count,
    GROUP_CONCAT(ch.level ORDER BY ch.level) AS assigned_levels
FROM cloud_services AS cs
LEFT JOIN challenge_services AS ch
    ON ch.service_id = cs.service_id
    AND ch.provider_id = 3
WHERE cs.provider_id = 3
GROUP BY
    cs.service_id,
    cs.service_code,
    cs.service_name
ORDER BY cs.service_name;

-- GCP services without any challenge rows
SELECT
    cs.service_id,
    cs.service_code,
    cs.service_name
FROM cloud_services AS cs
LEFT JOIN challenge_services AS ch
    ON ch.service_id = cs.service_id
    AND ch.provider_id = 3
WHERE cs.provider_id = 3
  AND ch.service_id IS NULL
ORDER BY cs.service_name;
