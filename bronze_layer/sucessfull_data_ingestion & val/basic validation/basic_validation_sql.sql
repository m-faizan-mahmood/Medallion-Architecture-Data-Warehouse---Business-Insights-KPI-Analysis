-- BASIC VALIDATION FOR TABLE CUST_AZ12 :

SELECT cid, COUNT(*) AS null_count
FROM cust_az12
WHERE cid IS NULL
GROUP BY cid;


SELECT cid, COUNT(*) AS duplicate_count
FROM cust_az12
GROUP BY cid
HAVING COUNT(*) > 1;

SELECT cid, gen,bdate COUNT(*) AS empty_count
FROM cust_az12
WHERE cid = ''
GROUP BY cid;

SELECT 
    SUM(CASE WHEN cid IS NULL OR cid = '' THEN 1 ELSE 0 END) AS cid_missing_count,
    SUM(CASE WHEN gen IS NULL OR gen = '' THEN 1 ELSE 0 END) AS gen_missing_count,
    SUM(CASE WHEN bdate IS NULL THEN 1 ELSE 0 END) AS bdate_missing_count
FROM cust_az12;


-- FOR TABLE CUST_INFO :

--duplicates

SELECT cst_id, COUNT(*) AS duplicate_count
FROM cust_info
GROUP BY cst_id 
HAVING COUNT(*) > 1;

SELECT *, COUNT(*) AS duplicate_count
FROM cust_info
GROUP BY cst_gndr,cst_marital_status,cst_id 
HAVING COUNT(*) > 1;

--missing count

SELECT 
    SUM(CASE WHEN cst_id IS NULL THEN 1 ELSE 0 END) AS cid_id_missing_count,
    SUM(CASE WHEN cst_key IS NULL OR cst_key = '' THEN 1 ELSE 0 END) AS cst_key_missing_count,
	SUM(CASE WHEN cst_firstname IS NULL OR cst_firstname = '' THEN 1 ELSE 0 END) AS cst_firstname_missing_count,
	SUM(CASE WHEN cst_lastname IS NULL OR cst_lastname = '' THEN 1 ELSE 0 END) AS cst_lastname_missing_count,
	SUM(CASE WHEN cst_marital_Status IS NULL OR cst_marital_Status = '' THEN 1 ELSE 0 END) AS cst_marital_Status_missing_count,
	SUM(CASE WHEN cst_gndr IS NULL OR cst_gndr = '' THEN 1 ELSE 0 END) AS cst_gndr_missing_count,
	SUM(CASE WHEN cst_create_date IS NULL THEN 1 ELSE 0 END) AS cst_create_date_missing_count
FROM cust_info;


-- FOR TABLE loca101 :

--duplicates

SELECT *, COUNT(*) AS duplicate_count
FROM loc_a101
GROUP BY cid , cntry 
HAVING COUNT(*) > 1;

--missing count

SELECT 
    SUM(CASE WHEN cid IS NULL THEN 1 ELSE 0 END) AS cid_missing_count,
    SUM(CASE WHEN cntry IS NULL OR cntry = '' THEN 1 ELSE 0 END) AS cntry_missing_count
FROM loc_a101;



-- FOR TABLE prd_info :

--duplicates

SELECT prd_id,prd_key,prd_nm, COUNT(*) AS duplicate_count
FROM prd_info
GROUP BY prd_id,prd_key,prd_nm,prd_cost
HAVING COUNT(*) > 1;

--missing count

SELECT 
    SUM(CASE WHEN prd_id IS NULL THEN 1 ELSE 0 END) AS cid_missing_count,
	SUM(CASE WHEN prd_key IS NULL OR prd_key = '' THEN 1 ELSE 0 END) AS prd_key_missing_count,
	SUM(CASE WHEN prd_nm IS NULL THEN 1 ELSE 0 END) AS prd_nm_missing_count,
	SUM(CASE WHEN prd_cost IS NULL THEN 1 ELSE 0 END) AS prd_cost_missing_count,
	SUM(CASE WHEN prd_line IS NULL THEN 1 ELSE 0 END) AS prd_line_missing_count,
	SUM(CASE WHEN prd_start_dt IS NULL THEN 1 ELSE 0 END) AS prd_start_dt_date_missing_count,
	SUM(CASE WHEN prd_end_dt IS NULL THEN 1 ELSE 0 END) AS prd_end_dt_missing_count
FROM prd_info;


-- FOR TABLE px_cat_g1v2 :

--duplicates

SELECT id ,cat ,subcat,maintenance, COUNT(*) AS duplicate_count
FROM px_cat_g1v2
GROUP BY id,cat,subcat,maintenance
HAVING COUNT(*) > 1;

--missing count

SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS id_missing_count,
	SUM(CASE WHEN cat IS NULL OR cat = '' THEN 1 ELSE 0 END) AS cat_missing_count,
	SUM(CASE WHEN subcat IS NULL THEN 1 ELSE 0 END) AS subcat_missing_count,
	SUM(CASE WHEN maintenance IS NULL THEN 1 ELSE 0 END) AS maintenance_missing_count
FROM px_cat_g1v2;


-- FOR TABLE sales_details :

--duplicates

SELECT id ,cat ,subcat,maintenance, COUNT(*) AS duplicate_count
FROM px_cat_g1v2
GROUP BY id,cat,subcat,maintenance
HAVING COUNT(*) > 1;

--missing count

SELECT 
    SUM(CASE WHEN sls_ord_num IS NULL THEN 1 ELSE 0 END) AS sls_ord_num_missing_count,
	SUM(CASE WHEN sls_prd_key IS NULL OR sls_prd_key = '' THEN 1 ELSE 0 END) AS sls_prd_key_missing_count,
	SUM(CASE WHEN sls_cust_id IS NULL THEN 1 ELSE 0 END) AS sls_cust_id_missing_count,
	SUM(CASE WHEN sls_order_dt IS NULL THEN 1 ELSE 0 END) AS sls_order_dt_missing_count,
	SUM(CASE WHEN sls_ship_dt IS NULL THEN 1 ELSE 0 END) AS sls_ship_dt_missing_count,
	SUM(CASE WHEN sls_due_dt IS NULL THEN 1 ELSE 0 END) AS sls_due_dt_missing_count,
	SUM(CASE WHEN sls_sales IS NULL THEN 1 ELSE 0 END) AS sls_sales_missing_count,
	SUM(CASE WHEN sls_quantity IS NULL THEN 1 ELSE 0 END) AS sls_quantity_missing_count,
	SUM(CASE WHEN sls_price IS NULL THEN 1 ELSE 0 END) AS sls_price_missing_count
FROM sales_details;


