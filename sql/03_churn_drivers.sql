-- ============================================================
-- 03. CHURN DRIVERS ANALYSIS
-- ============================================================

-- 03a. Churn by Contract Type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_raw
GROUP BY Contract
ORDER BY churn_rate DESC;


-- 03b. Churn by Tenure Group
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_raw
GROUP BY 
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END
ORDER BY 
    CASE 
        WHEN tenure_group = '0-12 months' THEN 1
        WHEN tenure_group = '13-24 months' THEN 2
        WHEN tenure_group = '25-48 months' THEN 3
        ELSE 4
    END;


-- 03c. Churn by Monthly Charges (Quartiles)
WITH charge_quartiles AS (
    SELECT 
        customerID,
        MonthlyCharges,
        NTILE(4) OVER (ORDER BY MonthlyCharges) AS quartile
    FROM telco_raw
)
SELECT 
    q.quartile,
    CONCAT('$', ROUND(MIN(q.MonthlyCharges), 2), ' - $', ROUND(MAX(q.MonthlyCharges), 2)) AS charge_range,
    COUNT(*) AS total,
    SUM(CASE WHEN t.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN t.Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_raw t
JOIN charge_quartiles q ON t.customerID = q.customerID
GROUP BY q.quartile
ORDER BY q.quartile;


-- 03d. Churn by Internet Service + Security
SELECT 
    InternetService,
    OnlineSecurity,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_raw
GROUP BY InternetService, OnlineSecurity
ORDER BY InternetService, OnlineSecurity;


-- 03e. Churn by Payment Method
SELECT 
    PaymentMethod,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM telco_raw
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- 03f. Churn by Senior Citizen + Partner Status
SELECT 
    CASE WHEN SeniorCitizen = 1 THEN 'Senior' ELSE 'Non-Senior' END AS senior_status,
    Partner,
    COUNT(*) AS total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM telco_raw
GROUP BY senior_status, Partner
ORDER BY senior_status, Partner;
