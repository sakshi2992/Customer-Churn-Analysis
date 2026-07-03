# Power BI Dashboard Build Guide

Power BI Desktop is required to create the final `.pbix` file. It was not available in this local environment, so this folder contains the complete Power BI-ready dataset, DAX measures, and dashboard blueprint.

## Dataset

Import `../data/processed/customer_churn_processed.csv`.

## Pages

1. Executive Overview
2. Customer Segmentation
3. Churn Drivers
4. Revenue Impact
5. Retention Opportunities

## KPI Cards

- Total Customers: 10,000
- Churn Rate: 20.4%
- Customer Lifetime Value: average $12,686
- Revenue at Risk: $5,724,781
- High-Risk Customers: 3,462

## Recommended Visuals

- Churn rate by geography, age group, gender, tenure group, product segment, and card type.
- Revenue at risk by customer value segment.
- High-risk customer count by geography and value segment.
- Feature importance chart from `../data/processed/feature_importance.csv`.
- Model comparison chart from `../data/processed/model_metrics.csv`.

Use `powerbi_model_measures.dax` for the core DAX measures.
