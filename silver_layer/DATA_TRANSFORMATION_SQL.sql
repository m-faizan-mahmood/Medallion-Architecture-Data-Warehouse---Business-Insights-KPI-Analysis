-- standardizing table cust_az12

SELECT gen, COUNT(*) AS duplicate_count
FROM cust_az12
GROUP BY gen
HAVING COUNT(*) > 1; -- 4 values found ( M,F,Male, female) standardizing to only 2 (male,female)

-- value standardizing 

UPDATE cust_az12
SET gen = 
    CASE 
        WHEN gen = 'M' THEN 'Male'
        WHEN gen = 'F' THEN 'Female'
        ELSE gen
    END;
	
UPDATE cust_az12
SET gen = 
    CASE 
        WHEN gen = 'M ' THEN 'Male'
        WHEN gen = 'F ' THEN 'Female'
        ELSE gen
    END;

--checking for changes 



SELECT DISTINCT gen FROM cust_az12;

SELECT gen, COUNT(*) AS count_per_gender
FROM cust_az12
GROUP BY gen;


-- cid (cust_az12)

SELECT cid, COUNT(*) AS duplicate_count
FROM cust_az12
GROUP BY cid
HAVING COUNT(*) > 1;






---- for table cust_info ( no need for transformation)

SELECT cst_key, COUNT(*) AS duplicate_count
FROM cust_info
GROUP BY cst_key
HAVING COUNT(*) > 1;



---- for table loc_A101 ( no need for transformation aswell)

SELECT cid, COUNT(*) AS duplicate_count
FROM loc_a101
GROUP BY cid
HAVING COUNT(*) > 1;

SELECT DISTINCT cntry FROM loc_a101;

SELECT cntry, COUNT(*) AS count_of_cntry
FROM loc_a101
GROUP BY cntry;


---- for table prd_info ( no need for transformation)

SELECT prd_id, COUNT(*) AS duplicate_count
FROM prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1;


SELECT prd_key, COUNT(*) AS duplicate_count
FROM prd_info
GROUP BY prd_key
HAVING COUNT(*) > 1;




---- for table px_cat_g1v2 ( no need for transformation)

SELECT id, COUNT(*) AS duplicate_count
FROM px_cat_g1v2
GROUP BY id
HAVING COUNT(*) > 1;

SELECT id, COUNT(*) AS count_of_id
FROM px_cat_g1v2
GROUP BY id;

SELECT subcat, COUNT(*) AS count_of_subcat
FROM px_cat_g1v2
GROUP BY id;


---- for table sales_details ( no need for transformation)

SELECT sls_ord_num, COUNT(*) AS duplicate_count
FROM sales_details
GROUP BY sls_ord_num
HAVING COUNT(*) > 1;

SELECT * 
FROM sales_details 
WHERE sls_ord_num = 'SO67487';




