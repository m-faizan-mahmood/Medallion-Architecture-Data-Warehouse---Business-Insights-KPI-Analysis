--performance optimization

CREATE INDEX idx_fact_sales_cst_key ON fact_sales (sls_cst_key);


SELECT * FROM fact_sales WHERE sls_cst_key = 'AW00025275';

EXPLAIN ANALYZE 
SELECT * FROM fact_sales WHERE sls_cst_key = 'AW00025275';


SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename = 'fact_sales';
CREATE INDEX idx_fact_sales_prd_key ON fact_sales (sls_prd_key);


SELECT * FROM fact_sales WHERE sls_prd_key = 'BI-RB-BK-R93R-62';

--indexing date 

CREATE INDEX idx_fact_sales_order_dt ON fact_sales (sls_order_dt);

SELECT * FROM fact_sales 
WHERE sls_order_dt BETWEEN '1970-01-01' AND '1970-02-05';


SELECT * FROM fact_sales;
