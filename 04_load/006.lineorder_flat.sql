INSERT INTO :DB_SCHEMA_NAME.lineorder_flat
SELECT
    LO_ORDERDATE,
    LO_ORDERKEY,
    LO_LINENUMBER,
    LO_CUSTKEY,
    LO_PARTKEY,
    LO_SUPPKEY,
    LO_ORDERPRIORITY,
    LO_SHIPPRIORITY,
    LO_QUANTITY,
    LO_EXTENDEDPRICE,
    LO_ORDTOTALPRICE,
    LO_DISCOUNT,
    LO_REVENUE,
    LO_SUPPLYCOST,
    LO_TAX,
    LO_COMMITDATE,
    LO_SHIPMODE,
    C_NAME,
    C_ADDRESS,
    C_CITY,
    C_NATION,
    C_REGION,
    C_PHONE,
    C_MKTSEGMENT,
    S_NAME,
    S_ADDRESS,
    S_CITY,
    S_NATION,
    S_REGION,
    S_PHONE,
    P_NAME,
    P_MFGR,
    P_CATEGORY,
    P_BRAND,
    P_COLOR,
    P_TYPE,
    P_SIZE,
    P_CONTAINER
FROM :DB_SCHEMA_NAME.lineorder l
INNER JOIN :DB_SCHEMA_NAME.customer c
ON (c.c_custkey = l.lo_custkey)
INNER JOIN :DB_SCHEMA_NAME.supplier s
ON (s.s_suppkey = l.lo_suppkey)
INNER JOIN :DB_SCHEMA_NAME.part p
ON (p.p_partkey = l.lo_partkey);