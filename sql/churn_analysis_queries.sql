-- Customer Churn SQL Analysis
-- Use this file after loading data/processed/customer_churn_processed.csv into customer_churn.

-- 1. Churn rate by gender
SELECT
    gender,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY gender
ORDER BY churn_rate_pct DESC;

-- 2. Churn rate by age group
SELECT
    age_group,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY age_group
ORDER BY churn_rate_pct DESC;

-- 3. Churn rate by tenure
SELECT
    tenure_group,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate_pct DESC;

-- 4. Revenue loss by churn segment
WITH segment_loss AS (
    SELECT
        customer_value_segment,
        SUM(revenue_at_risk) AS value_at_risk,
        SUM(customer_lifetime_value) AS total_customer_value
    FROM customer_churn
    GROUP BY customer_value_segment
)
SELECT
    customer_value_segment,
    value_at_risk,
    total_customer_value,
    ROUND(100.0 * value_at_risk / NULLIF(SUM(value_at_risk) OVER (), 0), 2) AS share_of_value_at_risk_pct
FROM segment_loss
ORDER BY value_at_risk DESC;

-- 5. High-value customer churn
SELECT
    customer_value_segment,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct,
    ROUND(AVG(customer_lifetime_value), 2) AS avg_clv
FROM customer_churn
WHERE customer_value_segment IN ('Gold', 'Platinum')
GROUP BY customer_value_segment
ORDER BY churn_rate_pct DESC;

-- 6. Product-wise churn
SELECT
    product_segment,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct
FROM customer_churn
GROUP BY product_segment
ORDER BY churn_rate_pct DESC;

-- 7. Payment method analysis using card type as the payment proxy available in this banking dataset
SELECT
    payment_proxy AS payment_method_proxy,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct,
    ROUND(AVG(point_earned), 1) AS avg_points_earned
FROM customer_churn
GROUP BY payment_proxy
ORDER BY churn_rate_pct DESC;

-- 8. Geography-wise churn
SELECT
    geography,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(100.0 * AVG(churn), 2) AS churn_rate_pct,
    RANK() OVER (ORDER BY AVG(churn) DESC) AS churn_rank
FROM customer_churn
GROUP BY geography
ORDER BY churn_rank;

-- 9. Customer lifetime value analysis
SELECT
    customer_value_segment,
    COUNT(*) AS customers,
    ROUND(AVG(customer_lifetime_value), 2) AS avg_clv,
    ROUND(SUM(customer_lifetime_value), 2) AS total_clv,
    ROUND(SUM(CASE WHEN churn = 1 THEN customer_lifetime_value ELSE 0 END), 2) AS churned_clv
FROM customer_churn
GROUP BY customer_value_segment
ORDER BY avg_clv DESC;

-- 10. High-risk customer identification
WITH customer_risk AS (
    SELECT
        customerid,
        geography,
        gender,
        age,
        tenure,
        customer_value_segment,
        annual_value_proxy,
        customer_lifetime_value,
        high_risk_customer_flag,
        CASE
            WHEN complain = 1 THEN 'Complaint raised'
            WHEN isactivemember = 0 AND satisfaction_score <= 2 THEN 'Inactive with low satisfaction'
            WHEN age >= 45 AND numofproducts >= 3 THEN 'Older multi-product customer'
            ELSE 'Monitor'
        END AS primary_risk_reason
    FROM customer_churn
)
SELECT *
FROM customer_risk
WHERE high_risk_customer_flag = 1
ORDER BY customer_lifetime_value DESC
LIMIT 100;
