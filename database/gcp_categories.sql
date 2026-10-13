-- Genospark EMS
-- GCP category reference
-- Provider ID: 3
-- Target database: emsdb_test

USE emsdb_test;

SELECT category_id, provider_id, category_name
FROM cloud_categories
WHERE provider_id = 3
ORDER BY category_id;
