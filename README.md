# Data Analyst  Task 4: SQL- Ecommerce-Consumer-Analysis
## Overview
This repository contains 10 MySQL queries for the `Ecommerce_Consumer_Analysis_Data.csv` dataset.

## Repository Structure
- **`Task 4- Ecommerce_Consumer_Analysis.sql`**: Contains SQL queries for database setup, data cleaning, and analysis.
- **`Ecommerce_Consumer_Analysis_Data.csv`**: The dataset used for analysis.
- **`screenshots/`**: Screenshots of query outputs from MySQL Workbench.
- **`README.md`**: This file, providing an overview of the project.
  
4. **Data Cleaning**:
   - Removed `$` from `Purchase_Amount` and cast to `DECIMAL(10,2)`.
   - Converted `Time_of_Purchase` from `MM/DD/YYYY` format to MySQL `DATE` format.
   - Queries for cleaning are included in `Task 4- Ecommerce_Consumer_Analysis.sql`.
     
## Queries
The `Task 4- Ecommerce_Consumer_Analysis.sql` file contains the following queries:

1. **Filter Electronics Purchases by High-Income Customers**:
   - Filters purchases in the "Electronics" category by customers with high income, sorted by purchase amount.
   
2. **Total and Average Purchase Amount by Category**:
   - Aggregates total revenue, average purchase amount, and purchase count per category.
   
3. **Subquery for Above-Average Book Purchases**:
   - Identifies "Books" purchases exceeding the category’s average purchase amount.
   
4. **Create View for Category Satisfaction**:
   - Creates a view `category_satisfaction` to show average customer satisfaction per category.
   
5. **Handle NULLs in Purchase_Amount**:
   - Replaces `NULL` values in `Purchase_Amount` with 0 using `COALESCE`.
   
6. **Average Revenue Per User**:
   - Calculates the average revenue per customer using a subquery.
   
7. **Categories with High Satisfaction**:
   - Finds categories with more than 5 purchases and average satisfaction greater than 5.
   
8. **Purchases by Month in 2024**:
   - Analyzes purchases in 2024, grouped by month.
   
9. **Payment Method Analysis for High-Income Customers**:
   - Aggregates total spend by payment method for high-income customers.
   
10. **High Return Rate Categories**:
    - Identifies categories with an average return rate greater than 1.

## Setup
- Database: MySQL, `ecommerce` database.
- Table: `ecommerce_data`.
-  Import CSV using Table Data Import Wizard,
  
## Conclusion
  This project demonstrates SQL skills in data cleaning and analysis using MySQL. 
  the work showcases problem-solving and analytical abilities.
  
