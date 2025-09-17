set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE

SELECT
    C_CITY,
    S_CITY, 
    date_part('year', lo_orderdate) as year,
    SUM(LO_REVENUE) AS revenue
FROM lineorder_flat
WHERE
    C_NATION = 'UNITED STATES'
  AND S_NATION = 'UNITED STATES'
  AND LO_ORDERDATE >= to_date('19920101', 'YYYYMMDD')
  AND LO_ORDERDATE <= to_date('19971231', 'YYYYMMDD')
GROUP BY C_CITY, S_CITY, YEAR
ORDER BY YEAR ASC, revenue DESC;