set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE

SELECT
    C_NATION,
    S_NATION, 
    date_part('year', lo_orderdate) as year,
    SUM(LO_REVENUE) AS revenue
FROM lineorder_flat
WHERE
    C_REGION = 'ASIA'
  AND S_REGION = 'ASIA'
  AND LO_ORDERDATE >= to_date('19920101', 'YYYYMMDD')
  AND LO_ORDERDATE <= to_date('19971231', 'YYYYMMDD')
GROUP BY C_NATION, S_NATION, YEAR
ORDER BY YEAR ASC, revenue DESC;