# Customer Churn Analysis using-SQL

## 📌 Project Overview

This project focuses on analyzing customer churn using SQL to understand customer behavior and retention patterns. It simulates a real-world business scenario where organizations aim to identify customers likely to leave their services and take proactive measures to retain them.

The analysis leverages customer demographic and financial data to evaluate churn trends, segment customers, and generate actionable insights for improving customer retention strategies.

---

## 🎯 Project Objective

* Analyze customer churn patterns using SQL
* Identify factors influencing customer retention and attrition
* Segment customers based on value and behavior
* Calculate churn-related KPIs
* Provide insights to improve customer retention strategies

---

## ❓ Key Questions

* What is the overall churn rate?
* Which customer segments have the highest churn?
* Does plan type impact churn behavior?
* Are high-paying customers less likely to churn?
* What is the average tenure of churned customers?
* How do demographic factors (age, gender) affect churn?

---

## 📂 Dataset Description

The dataset represents customer information from a subscription-based business model (such as telecom or SaaS). It includes details related to customer demographics, subscription plans, and billing information.

### 📊 Key Features:

* **customer_id** → Unique identifier for each customer
* **gender** → Customer gender
* **age** → Age of the customer
* **join_date** → Date when the customer joined
* **plan_type** → Subscription plan (Basic, Standard, Premium)
* **monthly_charges** → Monthly subscription cost
* **total_charges** → Total revenue generated from the customer
* **churn** → Indicates whether the customer left the service (Yes/No)

### ⚠️ Dataset Characteristics:

* Structured relational data
* Designed to simulate real-world churn scenarios
* Suitable for segmentation and KPI analysis

---

## 🛠️ Tools & Technologies Used

* **SQL (MySQL / PostgreSQL)** → Data analysis and KPI generation
* **Git & GitHub** → Version control and portfolio hosting
* **DBMS Tools (MySQL Workbench / pgAdmin)** → Query execution
* **Excel (Optional)** → Data validation and visualization

---
## 🔍 SQL Analysis Queries

### 🟢 Basic Metrics

#### 1. Total Customers

```sql
SELECT COUNT(*) AS total_customers
FROM customers;
```

---

#### 2. Total Churned Customers

```sql
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE churn = 'Yes';
```

---

#### 3. Churn Rate (%)

```sql
SELECT 
ROUND(
(COUNT(CASE WHEN churn = 'Yes' THEN 1 END) * 100.0) 
/ COUNT(*),2
) AS churn_rate
FROM customers;
```

---

#### 4. Average Monthly Charges

```sql
SELECT ROUND(AVG(monthly_charges),2) AS avg_monthly_charges
FROM customers;
```

---

### 🟡 Customer Behavior Analysis

#### 5. Churn by Plan Type

```sql
SELECT 
plan_type,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY plan_type;
```

---

#### 6. Churn by Gender

```sql
SELECT 
gender,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY gender;
```

---

#### 7. Customer Tenure (Days)

```sql
SELECT 
customer_id,
DATEDIFF(CURDATE(), join_date) AS tenure_days
FROM customers;
```

---

#### 8. High Value Customers

```sql
SELECT *
FROM customers
WHERE monthly_charges > 1000;
```

---

### 🔴 Advanced Insights

#### 9. Churn Rate by Plan Type (%)

```sql
SELECT 
plan_type,
ROUND(
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2
) AS churn_rate
FROM customers
GROUP BY plan_type;
```

---

#### 10. Average Tenure of Churned Customers

```sql
SELECT 
ROUND(AVG(DATEDIFF(CURDATE(), join_date)),2) AS avg_tenure_days
FROM customers
WHERE churn = 'Yes';
```

---

#### 11. Customer Segmentation (Value-Based)

```sql
SELECT 
customer_id,
CASE 
    WHEN monthly_charges >= 1000 THEN 'High Value'
    WHEN monthly_charges >= 600 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_segment
FROM customers;
```

---

#### 12. Churn Distribution by Segment

```sql
SELECT 
CASE 
    WHEN monthly_charges >= 1000 THEN 'High Value'
    WHEN monthly_charges >= 600 THEN 'Medium Value'
    ELSE 'Low Value'
END AS segment,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY segment;
```

---
## 🔍  Advanced Queries

This section includes both fundamental and advanced SQL queries used to analyze customer churn and generate business insights.

---

### 🟢 Customer Segmentation

#### 13. Customer Segmentation (Value-Based)

```sql id="seg1"
SELECT 
customer_id,
CASE 
    WHEN monthly_charges >= 1000 THEN 'High Value'
    WHEN monthly_charges >= 600 THEN 'Medium Value'
    ELSE 'Low Value'
END AS customer_segment
FROM customers;
```

**Insight:**
Segments customers based on spending behavior for targeted retention strategies.

---

### 📊 Churn Analysis by Segment

#### 14. Churn Rate by Customer Segment

```sql id="seg2"
SELECT 
CASE 
    WHEN monthly_charges >= 1000 THEN 'High Value'
    WHEN monthly_charges >= 600 THEN 'Medium Value'
    ELSE 'Low Value'
END AS segment,
COUNT(*) AS total_customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customers
GROUP BY segment;
```

**Insight:**
Helps identify which customer segment has the highest churn risk.

---

### 📅 Customer Behavior Analysis

#### 15. Average Tenure of Churned Customers

```sql id="seg3"
SELECT 
ROUND(AVG(DATEDIFF(CURDATE(), join_date)),2) AS avg_tenure_days
FROM customers
WHERE churn = 'Yes';
```

**Insight:**
Shows how long customers stay before churning, useful for retention planning.

---

### 🏆 Customer Ranking

#### 16. Ranking Customers by Monthly Spending

```sql id="seg4"
SELECT 
customer_id,
monthly_charges,
RANK() OVER (ORDER BY monthly_charges DESC) AS spending_rank
FROM customers;
```

**Insight:**
Identifies top-paying customers for premium service or loyalty programs.

---

### 💡 Retention Analysis

#### 17. Retention Revenue by Plan Type

```sql id="seg5"
SELECT 
plan_type,
ROUND(AVG(total_charges),2) AS avg_revenue
FROM customers
WHERE churn = 'No'
GROUP BY plan_type;
```

**Insight:**
Analyzes revenue generated by retained customers across different plans.

---


## 💡 Key Insights

* Customers on higher-value plans tend to have lower churn rates
* Customers with shorter tenure are more likely to churn
* Monthly charges significantly influence customer retention
* Certain customer segments (low-value users) show higher churn
* Retention strategies should focus on early-stage customers

---

## 📌 Conclusion

This project demonstrates how SQL can be effectively used to analyze customer churn and generate meaningful business insights. By identifying patterns in customer behavior, organizations can take proactive steps to reduce churn and improve customer retention.

The analysis highlights the importance of customer segmentation, pricing strategies, and tenure-based engagement in minimizing churn. Overall, this project showcases practical data analysis skills and real-world problem-solving approaches relevant to data analyst roles.

---
