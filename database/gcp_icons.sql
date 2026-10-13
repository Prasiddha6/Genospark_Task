-- Genospark EMS
-- GCP SVG icon coverage checks
-- Provider ID: 3
-- Target database: emsdb_test

USE emsdb_test;

-- Overall icon coverage
SELECT
    COUNT(*) AS total_gcp_services,
    SUM(icon_url IS NOT NULL AND TRIM(icon_url) <> '') AS services_with_icons,
    SUM(icon_url IS NULL OR TRIM(icon_url) = '') AS services_without_icons
FROM cloud_services
WHERE provider_id = 3;

-- Services missing icon mappings
SELECT service_id, service_code, service_name
FROM cloud_services
WHERE provider_id = 3
  AND (icon_url IS NULL OR TRIM(icon_url) = '')
ORDER BY service_name;

-- Existing icon mappings
SELECT service_id, service_code, service_name, icon_url
FROM cloud_services
WHERE provider_id = 3
  AND icon_url IS NOT NULL
  AND TRIM(icon_url) <> ''
ORDER BY service_name;
