-- Task 6: Business KPIs Queries

-- 1 Total Sales by Country

CREATE VIEW Total_Sales_By_Country AS
SELECT customer_country, SUM(sls_sales) AS total_sales
FROM single_big_table
GROUP BY customer_country
ORDER BY total_sales DESC;

select * from Total_Sales_By_Country;


-- 2  Top 5 Customers by Revenue

CREATE VIEW Top_5_Customers_By_Revenue AS
SELECT cst_id, cst_firstname, cst_lastname, SUM(sls_sales) AS total_revenue
FROM single_big_table
GROUP BY cst_id, cst_firstname, cst_lastname
ORDER BY total_revenue DESC
LIMIT 5;

select * from Top_5_Customers_By_Revenue;


--3 Best_Selling_Products

CREATE VIEW Best_Selling_Products AS
SELECT prd_id, prd_nm, SUM(sls_quantity) AS total_units_sold
FROM single_big_table
GROUP BY prd_id, prd_nm
ORDER BY total_units_sold DESC
LIMIT 10;

select * from Best_Selling_Products;


---4 Customer Retention Rate

CREATE VIEW Customer_Retention_Rate AS
SELECT 
    cst_id, 
    cst_firstname, 
    cst_lastname, 
    COUNT(DISTINCT sls_ord_num) AS total_orders,
    CASE 
        WHEN COUNT(DISTINCT sls_ord_num) > 1 THEN 'Returning Customer'
        ELSE 'New Customer'
    END AS customer_type
FROM single_big_table
GROUP BY cst_id, cst_firstname, cst_lastname;

select * from Customer_Retention_Rate;



--- Category-wise Sales Performance

CREATE VIEW Category_Wise_Sales_Performance AS
SELECT product_category, SUM(sls_sales) AS total_sales
FROM single_big_table
GROUP BY product_category
ORDER BY total_sales DESC;


select * from Category_Wise_Sales_Performance ;