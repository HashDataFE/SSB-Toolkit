set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE


SELECT
    SUM(LO_REVENUE), 
    date_part('year', lo_orderdate) as year
     , p_brand
FROM lineorder_flat
WHERE P_CATEGORY = 'MFGR#12' AND S_REGION = 'AMERICA'
GROUP BY YEAR, P_BRAND
ORDER BY YEAR, P_BRAND;