set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE


SELECT
    SUM(LO_REVENUE),     
    date_part('year', lo_orderdate) as year,
    p_brand
FROM lineorder_flat
WHERE
    P_BRAND >= 'MFGR#2221'
  AND P_BRAND <= 'MFGR#2228'
  AND S_REGION = 'ASIA'
GROUP BY YEAR, P_BRAND
ORDER BY YEAR, P_BRAND;