-- 02_analysis_queries.sql

-- Basic Analysis

SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS churned_customers 
FROM customers 
WHERE churn = 'Yes';

SELECT 
ROUND((COUNT(CASE WHEN churn='Yes' THEN 1 END)*100.0)/COUNT(*),2) AS churn_rate
FROM customers;

SELECT ROUND(AVG(monthly_charges),2) AS avg_monthly_charges
FROM customers;

-- Behavioral Analysis

SELECT 
plan_type,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY plan_type;

SELECT 
gender,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY gender;

SELECT 
customer_id,
DATEDIFF(CURDATE(), join_date) AS tenure_days
FROM customers;

SELECT *
FROM customers
WHERE monthly_charges > 1000;
