USE emsdb_test;

-- GCP service count
SELECT COUNT(*) AS gcp_services
FROM cloud_services
WHERE provider_id = 3;

-- GCP challenge count
SELECT COUNT(*) AS gcp_challenges
FROM challenge_services
WHERE provider_id = 3;

-- Challenges by difficulty level
SELECT level, COUNT(*) AS challenge_count
FROM challenge_services
WHERE provider_id = 3
GROUP BY level
ORDER BY level;

-- GCP icon coverage
SELECT
    COUNT(*) AS total_services,
    SUM(icon_url IS NOT NULL AND TRIM(icon_url) <> '') AS services_with_icons,
    SUM(icon_url IS NULL OR TRIM(icon_url) = '') AS services_without_icons
FROM cloud_services
WHERE provider_id = 3;
