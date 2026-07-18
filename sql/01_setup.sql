-- 01_setup.sql
-- Create raw table from uploaded CSV

CREATE TABLE IF NOT EXISTS telco_raw
USING CSV
OPTIONS (
  path '/FileStore/tables/telco_cleaned.csv',
  header 'true',
  inferSchema 'true'
);

-- Verify load
SELECT COUNT(*) AS total_rows FROM telco_raw;
-- Expected: 7043
