# Data Source

**Dataset:** IBM Telco Customer Churn Dataset  
**Source:** [Kaggle - BlastChar](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)  
**Rows:** 7,043 customers  
**Columns:** 21 features  

## Files

| File | Description |
|------|-------------|
| `Telco-Customer-Churn.csv` | Original raw data (not uploaded due to size) |
| `telco_cleaned.csv` | Excel-cleaned version |

## Data Dictionary

| Column | Type | Description |
|--------|------|-------------|
| customerID | Text | Unique identifier |
| gender | Text | Male / Female |
| SeniorCitizen | Number | 0 = No, 1 = Yes |
| Partner | Text | Yes / No |
| Dependents | Text | Yes / No |
| tenure | Number | Months with company (0-72) |
| PhoneService | Text | Yes / No |
| MultipleLines | Text | Yes / No / No phone service |
| InternetService | Text | DSL / Fiber optic / No |
| OnlineSecurity | Text | Yes / No / No internet service |
| OnlineBackup | Text | Yes / No / No internet service |
| DeviceProtection | Text | Yes / No / No internet service |
| TechSupport | Text | Yes / No / No internet service |
| StreamingTV | Text | Yes / No / No internet service |
| StreamingMovies | Text | Yes / No / No internet service |
| Contract | Text | Month-to-month / One year / Two year |
| PaperlessBilling | Text | Yes / No |
| PaymentMethod | Text | Electronic check / Mailed check / Bank transfer (automatic) / Credit card (automatic) |
| MonthlyCharges | Number | Monthly fee ($) |
| TotalCharges | Number | Total paid to date ($) |
| Churn | Text | Yes / No |

## Download

Original dataset available at: https://raw.githubusercontent.com/IBM/telco-customer-churn-on-icp4d/master/data/Telco-Customer-Churn.csv
