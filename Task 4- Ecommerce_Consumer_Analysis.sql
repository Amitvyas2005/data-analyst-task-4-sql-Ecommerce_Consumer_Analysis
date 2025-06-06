CREATE DATABASE ecommerce;
USE ecommerce;
-- for confirming dataset is load
SELECT * FROM ecommerce_data LIMIT 5;
-- data cleaning & fix some data types error
ALTER TABLE ecommerce_data ADD COLUMN temp_amount DECIMAL(10,2);
UPDATE ecommerce_data SET temp_amount = CAST(REPLACE(Purchase_Amount, '$', '') AS DECIMAL(10,2));
ALTER TABLE ecommerce_data DROP COLUMN Purchase_Amount;
ALTER TABLE ecommerce_data CHANGE COLUMN temp_amount Purchase_Amount DECIMAL(10,2);

ALTER TABLE ecommerce_data ADD COLUMN temp_date DATE;
UPDATE ecommerce_data SET temp_date = STR_TO_DATE(Time_of_Purchase, '%m/%d/%Y');
ALTER TABLE ecommerce_data DROP COLUMN Time_of_Purchase;
ALTER TABLE ecommerce_data CHANGE COLUMN temp_date Time_of_Purchase DATE;
-- Starting Analysis
-- 1. Filter Electronics Purchases by High-Income Customers
SELECT Customer_ID, Age, Gender, Purchase_Amount, Customer_Satisfaction
FROM ecommerce_data
WHERE Purchase_Category = 'Electronics' AND Income_Level = 'High'
ORDER BY Purchase_Amount DESC;
 -- 2.Total and Average Purchase Amount by Category
SELECT Purchase_Category, 
       COUNT(*) AS purchase_count, 
       SUM(Purchase_Amount) AS total_revenue, 
       AVG(Purchase_Amount) AS avg_purchase_amount
FROM ecommerce_data
GROUP BY Purchase_Category;
-- 3. Subquery for Above-Average Book Purchases
SELECT Customer_ID, Purchase_Amount, Customer_Satisfaction
FROM ecommerce_data
WHERE Purchase_Category = 'Books' 
AND Purchase_Amount > (SELECT AVG(Purchase_Amount) 
FROM ecommerce_data WHERE Purchase_Category = 'Books');
-- 4. Create View for Category Satisfaction
CREATE VIEW category_satisfaction AS
SELECT Purchase_Category, AVG(Customer_Satisfaction) AS avg_satisfaction
FROM ecommerce_data
GROUP BY Purchase_Category;
select * from category_satisfaction;
-- 5. Handle NULLs in Purchase_Amount
SELECT Customer_ID, COALESCE(Purchase_Amount, 0) AS purchase_amount
FROM ecommerce_data
WHERE Purchase_Amount IS NULL;
-- 6. Average Revenue Per User
SELECT AVG(revenue_per_customer) AS avg_revenue_per_user
FROM (
    SELECT Customer_ID, SUM(Purchase_Amount) AS revenue_per_customer
    FROM ecommerce_data
    GROUP BY Customer_ID
) AS subquery;
-- 7. Categories with High Satisfaction
SELECT Purchase_Category, COUNT(*) AS purchase_count, AVG(Customer_Satisfaction) AS avg_satisfaction
FROM ecommerce_data
GROUP BY Purchase_Category
HAVING COUNT(*) > 5 AND AVG(Customer_Satisfaction) > 5; 
-- 8. Purchases by Month in 2024
SELECT MONTH(Time_of_Purchase) AS purchase_month, 
       COUNT(*) AS purchase_count, 
       SUM(Purchase_Amount) AS total_revenue
FROM ecommerce_data
WHERE YEAR(Time_of_Purchase) = 2024
GROUP BY MONTH(Time_of_Purchase)
ORDER BY purchase_month;
-- 9. Payment Method Analysis for High-Income Customers
SELECT Payment_Method, SUM(Purchase_Amount) AS total_spent
FROM ecommerce_data
WHERE Income_Level = 'High'
GROUP BY Payment_Method
ORDER BY total_spent DESC;
-- 10 High Return Rate Categories
SELECT Purchase_Category, AVG(Return_Rate) AS avg_return_rate, COUNT(*) AS purchase_count
FROM ecommerce_data
GROUP BY Purchase_Category
HAVING AVG(Return_Rate) > 1
ORDER BY avg_return_rate DESC;