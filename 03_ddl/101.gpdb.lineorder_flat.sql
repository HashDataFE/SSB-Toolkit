CREATE TABLE :DB_SCHEMA_NAME.lineorder_flat
(
  LO_ORDERDATE date ,
  LO_ORDERKEY int ,
  LO_LINENUMBER smallint ,
  LO_CUSTKEY int ,
  LO_PARTKEY int ,
  LO_SUPPKEY int ,
  LO_ORDERPRIORITY text ,
  LO_SHIPPRIORITY smallint ,
  LO_QUANTITY smallint ,
  LO_EXTENDEDPRICE int ,
  LO_ORDTOTALPRICE int ,
  LO_DISCOUNT smallint ,
  LO_REVENUE int ,
  LO_SUPPLYCOST int ,
  LO_TAX smallint ,
  LO_COMMITDATE date ,
  LO_SHIPMODE text ,
  C_NAME text ,
  C_ADDRESS text ,
  C_CITY text ,
  C_NATION text ,
  C_REGION text ,
  C_PHONE text ,
  C_MKTSEGMENT text ,
  S_NAME text ,
  S_ADDRESS text ,
  S_CITY text ,
  S_NATION text ,
  S_REGION text ,
  S_PHONE text ,
  P_NAME text ,
  P_MFGR text ,
  P_CATEGORY text ,
  P_BRAND text ,
  P_COLOR text ,
  P_TYPE text ,
  P_SIZE smallint ,
  P_CONTAINER text 
)
:ACCESS_METHOD
:STORAGE_OPTIONS
:DISTRIBUTED_BY
partition by range(lo_orderdate)
(start('1992-01-01') end('1999-01-01') every (interval '1 year'),
default partition others)
;
