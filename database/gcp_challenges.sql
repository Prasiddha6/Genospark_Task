-- Genospark EMS
-- GCP challenge validation
-- Provider ID: 3
-- Target database: emsdb_test

USE emsdb_test;

-- Total GCP challenge rows
SELECT COUNT(*) AS total_gcp_challenges
FROM challenge_services
WHERE provider_id = 3;

-- Count challenges per level
SELECT level, COUNT(*) AS challenge_count
FROM challenge_services
WHERE provider_id = 3
GROUP BY level
ORDER BY level;

-- Find challenges outside levels 1–10
SELECT service_id, level
FROM challenge_services
WHERE provider_id = 3
  AND (level < 1 OR level > 10);

-- Find challenges with missing options
SELECT service_id, level
FROM challenge_services
WHERE provider_id = 3
  AND (options IS NULL OR JSON_VALID(options) = 0);
