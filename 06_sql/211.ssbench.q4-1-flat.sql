set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE

SELECT 
    date_part('year', lo_orderdate) as year,
    C_NATION,
    SUM(LO_REVENUE - LO_SUPPLYCOST) AS profit
FROM lineorder_flat
WHERE
    C_REGION = 'AMERICA'
  AND S_REGION = 'AMERICA'
  AND P_MFGR IN ('MFGR#1', 'MFGR#2')
GROUP BY YEAR, C_NATION
ORDER BY YEAR ASC, C_NATION ASC;