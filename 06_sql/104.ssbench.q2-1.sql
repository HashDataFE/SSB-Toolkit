set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE


SELECT SUM(lo_revenue), d_year, p_brand
FROM lineorder, date, part, supplier
WHERE
    lo_orderdate = to_date(d_datekey::text, 'YYYYMMDD')
  AND lo_partkey = p_partkey
  AND lo_suppkey = s_suppkey
  AND p_category = 'MFGR#12'
  AND s_region = 'AMERICA'
GROUP BY d_year, p_brand
ORDER BY p_brand;