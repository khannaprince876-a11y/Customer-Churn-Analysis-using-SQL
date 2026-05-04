-- 01_dataset.sql
CREATE TABLE customers (
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    join_date DATE,
    plan_type VARCHAR(20),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    churn VARCHAR(5)
);

INSERT INTO customers VALUES
(1,'Male',25,'2022-01-01','Basic',500,12000,'No'),
(2,'Female',35,'2021-05-10','Premium',1200,30000,'Yes'),
(3,'Male',40,'2020-03-15','Standard',800,20000,'No'),
(4,'Female',28,'2023-01-20','Basic',450,5000,'Yes'),
(5,'Male',50,'2019-07-12','Premium',1500,60000,'No'),
(6,'Female',30,'2022-09-01','Standard',700,15000,'Yes'),
(7,'Male',45,'2021-11-11','Premium',1300,40000,'No'),
(8,'Female',23,'2023-02-05','Basic',400,3000,'Yes');
