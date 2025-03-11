
CREATE TABLE cust_info (
    cst_id DECIMAL PRIMARY KEY ,              -- Unique customer ID (integer)
    cst_key VARCHAR(20) UNIQUE,          -- Unique customer key (string)
    cst_firstname VARCHAR(50),           -- First name (string)
    cst_lastname VARCHAR(50),            -- Last name (string)
    cst_marital_status CHAR(1),          -- Marital status ('M', 'S', etc.)
    cst_gndr CHAR(1),                    -- Gender ('M', 'F', etc.)
    cst_create_date DATE                 -- Customer creation date
);

select * from cust_info

CREATE TABLE prd_info (
    prd_id INT PRIMARY KEY,            -- Unique product ID (integer)
    prd_key VARCHAR(50) ,        -- Unique product key (string)
    prd_nm VARCHAR(100),               -- Product name (string)
    prd_cost DECIMAL(10,2),            -- Product cost (decimal with 2 decimal places)
    prd_line CHAR(1),                  -- Product line (single character like 'R', 'S', etc.)
    prd_start_dt DATE,                 -- Product start date
    prd_end_dt DATE                     -- Product end date (nullable)
);

select * from prd_info

CREATE TABLE sales_details (
    sls_ord_num VARCHAR(20) ,  -- Unique sales order number (alphanumeric)
    sls_prd_key VARCHAR(50),              -- Product key (foreign key reference to products)
    sls_cust_id INT,                       -- Customer ID (foreign key reference to customers)
    sls_order_dt DATE,                     -- Order date
    sls_ship_dt DATE,                      -- Shipment date
    sls_due_dt DATE,                        -- Due date
    sls_sales DECIMAL(10,2),               -- Total sales amount
    sls_quantity INT,                      -- Quantity of product sold
    sls_price DECIMAL(10,2)                -- Unit price
);

select * from sales_details;

CREATE TABLE cust_az12 (
    cid VARCHAR(20) PRIMARY KEY,  -- Unique customer ID (alphanumeric)
    bdate DATE,                   -- Birthdate
    gen VARCHAR(10)               -- Gender (Male/Female)
);

select * from cust_az12;

CREATE TABLE loc_a101 (
    cid VARCHAR(20) PRIMARY KEY,   -- Customer ID (alphanumeric, unique)
    cntry VARCHAR(50) NOT NULL     -- Country (string, required)
);

select * from loc_a101;

CREATE TABLE px_cat_g1v2(
    id VARCHAR(20) PRIMARY KEY,   -- Unique product category ID
    cat VARCHAR(50) NOT NULL,     -- Main category
    subcat VARCHAR(50) NOT NULL,  -- Subcategory
    maintenance BOOLEAN NOT NULL  -- Maintenance required (Yes/No)
);

select * from px_cat_g1v2;

