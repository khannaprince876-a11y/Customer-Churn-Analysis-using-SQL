-- 03_advanced_queries.sql

-- Segmentation

SELECT 
customer_id,
CASE 
    WHEN monthly_charges >= 1000 THEN 'High Value'
    WHEN monthly_charges >= 600 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_segment
FROM customers;

-- Churn by Segment

SELECT 
CASE 
    WHEN monthly_charges >= 1000 THEN 'High Value'
    WHEN monthly_charges >= 600 THEN 'Medium Value'
    ELSE 'Low Value'
END AS segment,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY segment;

-- Average Tenure of Churned Customers

SELECT 
ROUND(AVG(DATEDIFF(CURDATE(), join_date)),2) AS avg_tenure_days
FROM customers
WHERE churn='Yes';

-- Ranking Customers

SELECT 
customer_id,
monthly_charges,
RANK() OVER (ORDER BY monthly_charges DESC) AS spending_rank
FROM customers;

-- Retention Revenue

SELECT 
plan_type,
ROUND(AVG(total_charges),2) AS avg_revenue
FROM customers
WHERE churn='No'
GROUP BY plan_type;
