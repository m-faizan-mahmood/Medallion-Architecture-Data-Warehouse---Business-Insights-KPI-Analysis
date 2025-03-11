--golden layer 


-- Customers Dimension Table

CREATE TABLE dim_customers (
    cst_id SERIAL PRIMARY KEY,
    cst_key VARCHAR(50) UNIQUE NOT NULL,
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status CHAR(1),
    cst_gndr CHAR(1),
    cst_create_date DATE,
    bdate DATE,
    country VARCHAR(50)
);


-- Creating Products Dimension Table
CREATE TABLE dim_products (
    prd_id SERIAL PRIMARY KEY,
    prd_key VARCHAR(50) UNIQUE NOT NULL,
    prd_nm VARCHAR(100),
    prd_cost NUMERIC(10,2),
    prd_line CHAR(1),
    prd_start_dt DATE,
    prd_end_dt DATE,
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(10)
);

-- Creating Fact Sales Table
CREATE TABLE fact_sales (
    sls_ord_num VARCHAR(50) PRIMARY KEY,
    sls_prd_key VARCHAR(50) NOT NULL,
    sls_cst_key VARCHAR(50) NOT NULL,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales NUMERIC(10,2),
    sls_quantity INTEGER,
    sls_price NUMERIC(10,2),
    FOREIGN KEY (sls_prd_key) REFERENCES dim_products (prd_key),
    FOREIGN KEY (sls_cst_key) REFERENCES dim_customers (cst_key)
);



---- loading data 


---dim_customers


--REMOVING "-" FROM LOC_A101

UPDATE LOC_A101
SET CID = REPLACE(CID, '-', '');

--INSERING VALUES 

INSERT INTO dim_customers (cst_key, cst_firstname, cst_lastname, cst_marital_status, cst_gndr, cst_create_date, bdate, country)
SELECT 
    ci.cst_key, 
    ci.cst_firstname, 
    ci.cst_lastname, 
    ci.cst_marital_status, 
    ci.cst_gndr, 
    ci.cst_create_date, 
    ca.bdate, 
    la.cntry
FROM cust_info ci
JOIN CUST_AZ12 ca ON ci.cst_key = ca.CID  
JOIN LOC_A101 la ON ci.cst_key = la.CID; 



select *from dim_customers;



---inserting values dim_product table

select * from dim_products;

--  updating table PX_CAT_g1v2 for right prioduct key values 

UPDATE PX_CAT_g1v2 
SET ID = REPLACE(ID, '_', '-');

select * from PX_CAT_g1v2 ;


-- inserting values in dim_product table


INSERT INTO dim_products (prd_key, prd_nm, prd_cost, prd_line, prd_start_dt, prd_end_dt, category, subcategory, maintenance)
SELECT 
    pi.prd_key, 
    pi.prd_nm, 
    pi.prd_cost, 
    pi.prd_line, 
    pi.prd_start_dt, 
    pi.prd_end_dt, 
    pc.CAT, 
    pc.SUBCAT, 
    pc.MAINTENANCE
FROM prd_info pi
LEFT JOIN PX_CAT_G1V2 pc 
ON LEFT(pi.prd_key, LENGTH(pc.ID)) = pc.ID
ON CONFLICT (prd_key) DO NOTHING;

SELECT * FROM dim_products ;



---- loading data to fact table sales 


--checking for suffex

SELECT sd.sls_prd_key, dp.prd_key
FROM sales_details sd
LEFT JOIN dim_products dp 
    ON dp.prd_key LIKE '%' || sd.sls_prd_key || '%'
LIMIT 10;


ALTER TABLE fact_sales DROP CONSTRAINT fact_sales_pkey;



--- inserting values 

INSERT INTO fact_sales (sls_ord_num, sls_prd_key, sls_cst_key, sls_order_dt, sls_ship_dt, sls_due_dt, sls_sales, sls_quantity, sls_price)
SELECT 
    sd.sls_ord_num, 
    dp.prd_key,  -- Use full product key from dim_products
    dc.cst_key, 
    TO_DATE(sd.sls_order_dt::text, 'YYYY-MM-DD'), 
    TO_DATE(sd.sls_ship_dt::text, 'YYYY-MM-DD'), 
    TO_DATE(sd.sls_due_dt::text, 'YYYY-MM-DD'), 
    sd.sls_sales, 
    sd.sls_quantity, 
    sd.sls_price
FROM sales_details sd
INNER JOIN dim_customers dc ON sd.sls_cust_id = dc.cst_id
INNER JOIN dim_products dp ON dp.prd_key LIKE '%' || sd.sls_prd_key
WHERE sd.sls_ord_num IS NOT NULL;


select * from fact_sales;


---- sales agregation : 

SELECT 
    fs.sls_prd_key,
    DATE_TRUNC('month', fs.sls_order_dt) AS sales_month,
    SUM(fs.sls_sales) AS total_sales,
    SUM(fs.sls_quantity) AS total_quantity,
    AVG(fs.sls_price) AS avg_price
FROM fact_sales fs
GROUP BY fs.sls_prd_key, DATE_TRUNC('month', fs.sls_order_dt)
ORDER BY sales_month, total_sales DESC;


