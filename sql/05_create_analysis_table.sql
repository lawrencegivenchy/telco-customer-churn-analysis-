-- ============================================================
-- 05. CREATE CLEAN ANALYSIS TABLE FOR POWER BI
-- ============================================================

CREATE OR REPLACE TABLE telco_analysis AS
SELECT 
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    CASE 
        WHEN TotalCharges = 0 THEN MonthlyCharges 
        ELSE TotalCharges / tenure 
    END AS avg_monthly_charge,
    (CASE WHEN PhoneService = 'Yes' THEN 1 ELSE 0 END +
     CASE WHEN InternetService != 'No' THEN 1 ELSE 0 END +
     CASE WHEN OnlineSecurity = 'Yes' THEN 1 ELSE 0 END +
     CASE WHEN OnlineBackup = 'Yes' THEN 1 ELSE 0 END +
     CASE WHEN DeviceProtection = 'Yes' THEN 1 ELSE 0 END +
     CASE WHEN TechSupport = 'Yes' THEN 1 ELSE 0 END +
     CASE WHEN StreamingTV = 'Yes' THEN 1 ELSE 0 END +
     CASE WHEN StreamingMovies = 'Yes' THEN 1 ELSE 0 END
    ) AS num_services,
    Churn
FROM telco_raw;

-- Verify
SELECT COUNT(*) AS analysis_table_rows FROM telco_analysis;
-- Expected: 7043

SELECT * FROM telco_analysis LIMIT 10;
