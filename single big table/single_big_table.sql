--single big table 

CREATE TABLE single_big_table AS
SELECT 
    -- Sales Information
    fs.sls_ord_num, 
    fs.sls_order_dt, 
    fs.sls_ship_dt, 
    fs.sls_due_dt,
    fs.sls_sales, 
    fs.sls_quantity, 
    fs.sls_price,
	
    dc.cst_id, 
    dc.cst_key, 
    dc.cst_firstname, 
    dc.cst_lastname,
    dc.cst_marital_status, 
    dc.cst_gndr, 
    dc.cst_create_date, 
    ca.BDATE AS customer_bdate, 
    l.CNTRY AS customer_country, 

    --  Product Information
    dp.prd_id, 
    dp.prd_key, 
    dp.prd_nm, 
    dp.prd_cost, 
    dp.prd_line, 
    dp.prd_start_dt, 
    dp.prd_end_dt,

    --  Product Category Information
    c.cat AS product_category, 
    c.subcat AS product_subcategory, 
    c.Maintenance AS product_maintenance

FROM fact_sales fs

JOIN dim_customers dc 
    ON fs.sls_cst_key = dc.cst_key
JOIN dim_products dp 
    ON fs.sls_prd_key = dp.prd_key
LEFT JOIN LOC_A101 l 
    ON dc.cst_key = l.CID
	
LEFT JOIN PX_CAT_G1V2 c 
	ON dp.prd_key LIKE c.ID || '%'

LEFT JOIN CUST_AZ12 ca 
    ON dc.cst_key = ca.CID;


select * from single_big_table;