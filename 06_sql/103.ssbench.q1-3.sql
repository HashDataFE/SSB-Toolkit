set role ssbench;
set search_path=:DB_SCHEMA_NAME,public;
:EXPLAIN_ANALYZE


SELECT
    SUM(lo_extendedprice * lo_discount) AS REVENUE
FROM lineorder, date
WHERE
    lo_orderdate = to_date(d_datekey::text, 'YYYYMMDD')
  AND d_weeknuminyear = 6
  AND d_year = 1994
  AND lo_discount BETWEEN 5 AND 7
  AND lo_quantity BETWEEN 26 AND 35;