# Excel Data Cleaning Steps

## Dataset
**Source:** IBM Telco Customer Churn Dataset  
**Original Rows:** 7,043  
**Original Columns:** 21

---

## Step-by-Step Cleaning

### 1. Initial Inspection
- Verified 7,043 rows + 1 header row
- Confirmed 21 columns match data dictionary
- Saved as `.xlsx` format immediately

### 2. Missing Value Handling
| Column | Missing | Action |
|--------|---------|--------|
| TotalCharges | 11 | Replaced with 0 (new customers, 0 months tenure) |

### 3. Data Type Corrections
| Column | Original | Corrected |
|--------|----------|-----------|
| SeniorCitizen | Number (0/1) | Kept as number |
| TotalCharges | Text (blanks) | Number (filled blanks) |
| MonthlyCharges | Number | Kept as number |

### 4. Consistency Checks
- Verified `Churn` = "Yes" always has reason, "No" never does
- Cross-checked: `PhoneService` = "No" → `MultipleLines` = "No phone service"
- Cross-checked: `InternetService` = "No" → all service columns = "No internet service"

### 5. Feature Engineering
| New Feature | Formula |
|-------------|---------|
| tenure_group | `=IF(tenure&lt;=12,"0-12 months",IF(tenure&lt;=24,"13-24 months",IF(tenure&lt;=48,"25-48 months","49+ months")))` |

### 6. Export
- Saved cleaned data as `telco_cleaned.csv` (UTF-8)
- Uploaded to Databricks for SQL analysis
