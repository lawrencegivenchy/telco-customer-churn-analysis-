# Power BI Dashboard

## File
`Telco_Churn_Dashboard.pbix`

## Contents
- **1 page** — Executive Summary
- **6 KPI cards** (Total Customers, Churn Rate, Revenue at Risk, Retention Rate, etc.)
- **6 charts** (bar, line, donut, gauge, dual-axis)
- **Cross-filtering slicers** (Contract, Tenure, Payment Method, Internet Service, etc.)

## Data Source
- `telco_analysis` table from Databricks SQL
- Exported as CSV and imported into Power BI

## Key Measures
| Measure | Description |
|---------|-------------|
| `Total Customers` | Count of all customers |
| `Churn Rate` | Percentage of customers who churned |
| `Revenue at Risk` | Monthly revenue from churned customers |
| `Retention Rate` | 1 - Churn Rate |

## How to Open
1. Download `Telco_Churn_Dashboard.pbix`
2. Open in Power BI Desktop
3. Data is embedded — no additional setup needed
