# Final Deliverables

## Dataset Used

- Dataset: Bank Customer Churn
- Source selected from Kaggle: https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn
- Reproducible CSV mirror: https://github.com/Lawal-faruq/Customer-Churn-Analysis
- Rows analyzed: 10,000
- Raw features: 18
- Final processed fields: 34
- Target variable: `Exited`, standardized as `churn`

## Features

Raw fields include credit score, geography, gender, age, tenure, balance, number of products, credit card flag, active member flag, estimated salary, churn label, complaint flag, satisfaction score, card type, and loyalty points.

Engineered features include age group, tenure group, balance group, average revenue group, annual value proxy, monthly value proxy, monthly spend category, customer lifetime value, customer value segment, revenue at risk, high-risk customer flag, active status, credit card status, product segment, and payment proxy.

## Models Trained

- Logistic Regression
- Decision Tree
- Random Forest
- XGBoost
- LightGBM

## Best Model And Metrics

Best model by ROC-AUC: XGBoost.

| Model | Accuracy | Precision | Recall | F1 Score | ROC-AUC |
|---|---:|---:|---:|---:|---:|
| XGBoost | 0.870 | 0.826 | 0.458 | 0.589 | 0.870 |
| LightGBM | 0.823 | 0.551 | 0.697 | 0.616 | 0.868 |
| Random Forest | 0.830 | 0.564 | 0.721 | 0.633 | 0.867 |
| Logistic Regression | 0.773 | 0.464 | 0.747 | 0.572 | 0.851 |
| Decision Tree | 0.784 | 0.479 | 0.725 | 0.577 | 0.836 |

The tuned Random Forest achieved ROC-AUC of 0.868 and is included as an explainable retention-prioritization model.

## Business Insights Generated

- Overall churn is 20.4%, equal to 2,038 churned customers.
- Germany has the highest geography-level churn rate at 32.4%.
- The 51-60 age group has the highest churn rate at 56.2%.
- The Platinum segment contributes the largest annual value proxy at risk: $2,229,843.
- Total annual value proxy at risk is $5,724,781.
- Age is the strongest model driver.
- Product segment and customer value fields are important churn predictors.
- Inactive customers and low-satisfaction customers require proactive outreach.
- Cross-sell alone should not be treated as proof of loyalty.
- High-risk customers should be prioritized using both churn probability and customer lifetime value.

## Files Included

- `data/raw/Customer-Churn-Records.csv`
- `data/processed/customer_churn_processed.csv`
- `data/processed/model_metrics.csv`
- `data/processed/feature_importance.csv`
- `data/processed/statistical_tests.csv`
- Six Jupyter notebooks in `notebooks/`
- SQL schema and analysis queries in `sql/`
- Power BI-ready CSV, DAX measures, and build guide in `powerbi/`
- Executive PDF report in `reports/`
- Dashboard, chart, notebook preview, and banner images in `images/`
- `README.md`
- `requirements.txt`
- `PROJECT_SOURCES.md`

## Resume Bullets Enabled

- Analyzed 10,000 customer records using SQL and Python to identify churn drivers across demographics, geography, tenure, product usage, satisfaction, and customer value segments.
- Built and compared Logistic Regression, Decision Tree, Random Forest, XGBoost, and LightGBM models to predict churn, with XGBoost achieving 0.870 ROC-AUC.
- Designed Power BI-ready dashboard assets tracking churn rate, customer lifetime value, revenue at risk, high-risk customers, and retention opportunities.
- Generated data-driven retention recommendations by identifying high-value churn segments, key attrition factors, and $5.72M in annual value proxy at risk.
