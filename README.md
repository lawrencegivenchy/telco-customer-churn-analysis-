# 📡 Telco Customer Churn Analysis

&gt; Interactive executive dashboard identifying churn drivers and quantifying revenue at risk for a telecom provider.

![Dashboard Overview](docs/dashboard_screenshots/Telco.png)

---

## 🎯 Business Problem

A telecom company is experiencing a **26.5% customer churn rate**, resulting in **$139.1K in monthly revenue at risk**. This project analyzes 7,043 customer records to identify key churn drivers and recommend actionable retention strategies.

---

## 🔑 Key Findings

| Metric | Value |
|--------|-------|
| Total Customers | 7,043 |
| Churn Rate | 26.54% |
| Monthly Revenue at Risk | $139,130 |
| Retention Rate | 73.46% |

### Top Churn Drivers

1. **Contract Type**: Month-to-month customers churn at **43%** vs. 3% for two-year contracts
2. **Payment Method**: Electronic check users churn at **45%** — highest of any method
3. **Internet Service**: Fiber optic customers without security bundles churn at **42%**
4. **Tenure**: First 12 months are critical — **47% churn rate** among new customers

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Excel** | Data cleaning, type conversion, missing value handling |
| **Databricks SQL** | Analytical queries, customer segmentation, feature engineering |
| **Power BI** | Interactive dashboard with cross-filtering |

---

## 📊 Dashboard Features

- **6 KPI Cards** with dynamic metrics
- **6 Interactive Charts** (bar, line, donut, gauge, dual-axis)
- **Cross-Filtering Slicers** for real-time segment analysis
- **Revenue at Risk Quantification**

---

## 🚀 Business Recommendations

| Priority | Action | Potential Impact |
|----------|--------|----------------|
| 🔴 High | Convert month-to-month to annual contracts | 30% churn reduction |
| 🔴 High | Incentivize electronic check → auto-pay | 45% → 15% churn rate |
| 🟡 Medium | Bundle security with fiber plans | 42% → 20% churn rate |
| 🟡 Medium | Enhanced onboarding for first-year customers | 47% → 30% churn rate |

---

## 📁 Repository Structure


---

## 👤 Author

**[Lawrence Tebogo Makhafola]** — Data Analyst

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](http://linkedin.com/in/lawrence-tee-makhafola)
[![Website](https://img.shields.io/badge/Website-000000?style=flat&logo=About.me&logoColor=white)](https://lawrence-makhafola.vercel.app/)
[![Email](https://img.shields.io/badge/Email-D14836?style=flat&logo=gmail&logoColor=white)](mailto:lawrencegivenchy@yahoo.com)

---

## 📄 License

This project uses the IBM Telco Customer Churn dataset for educational purposes.
