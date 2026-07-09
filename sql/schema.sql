-- Schema for the Customer Churn Prediction & Retention Analytics project.
-- Dialect: PostgreSQL-compatible SQL. Works with minor changes in most SQL engines.

DROP TABLE IF EXISTS customer_churn;

CREATE TABLE customer_churn (
    rownumber INTEGER,
    customerid INTEGER PRIMARY KEY,
    surname VARCHAR(100),
    creditscore INTEGER,
    geography VARCHAR(50),
    gender VARCHAR(20),
    age INTEGER,
    tenure INTEGER,
    balance NUMERIC(14, 2),
    numofproducts INTEGER,
    hascrcard INTEGER,
    isactivemember INTEGER,
    estimatedsalary NUMERIC(14, 2),
    exited INTEGER,
    complain INTEGER,
    satisfaction_score INTEGER,
    card_type VARCHAR(30),
    point_earned INTEGER,
    churn INTEGER,
    age_group VARCHAR(20),
    tenure_group VARCHAR(20),
    monthly_spend_category VARCHAR(20),
    customer_value_segment VARCHAR(20),
    average_revenue_group VARCHAR(20),
    annual_value_proxy NUMERIC(14, 2),
    monthly_value_proxy NUMERIC(14, 2),
    customer_lifetime_value NUMERIC(14, 2),
    revenue_at_risk NUMERIC(14, 2),
    high_risk_customer_flag INTEGER,
    active_status VARCHAR(20),
    credit_card_status VARCHAR(30),
    product_segment VARCHAR(30),
    payment_proxy VARCHAR(30)
);
