-- ============================================================
-- TELCO CUSTOMER CHURN ANALYSIS
-- Databricks SQL Warehouse
-- ============================================================

-- 00. LOAD RAW DATA
-- Using Unity Catalog volume path for IBM Telco dataset
CREATE TABLE telco_raw AS
SELECT * FROM read_files(
    '/Volumes/july2026/default/ibm_telco/Telco-Customer-Churn.csv',
    format => 'csv',
    header => true
);

-- Verify load
SELECT COUNT(*) AS total_rows FROM telco_raw;
-- Expected: 7043


-- ============================================================
-- 01. DATA VALIDATION
-- ============================================================

-- Preview structure
DESCRIBE telco_raw;

-- Check for nulls in key columns
SELECT
    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS null_customerID,
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS null_totalcharges,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS null_churn
FROM telco_raw;

-- Check distinct categorical values
SELECT DISTINCT gender FROM telco_raw;
SELECT DISTINCT Contract FROM telco_raw ORDER BY 1;
SELECT DISTINCT PaymentMethod FROM telco_raw ORDER BY 1;

-- Check numeric ranges
SELECT
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    MIN(MonthlyCharges) AS min_monthly,
    MAX(MonthlyCharges) AS max_monthly,
    MIN(TotalCharges) AS min_total,
    MAX(TotalCharges) AS max_total
FROM telco_raw;

-- Verify overall churn rate
SELECT
    Churn,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct
FROM telco_raw
GROUP BY Churn;
-- Expected: Yes ~26.5%, No ~73.5%
