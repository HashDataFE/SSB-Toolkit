CREATE EXTERNAL TABLE ext_ssb.lineorder (
    lo_orderkey             bigint,
    lo_linenumber           smallint,
    lo_custkey              bigint,
    lo_partkey              bigint,
    lo_suppkey              bigint,
    lo_orderdate            date,
    lo_orderpriority        text,
    lo_shippriority         smallint,
    lo_quantity             smallint,
    lo_extendedprice        bigint,
    lo_ordtotalprice        bigint,
    lo_discount             smallint,
    lo_revenue              bigint,
    lo_supplycost           bigint,
    lo_tax                  smallint,
    lo_commitdate           date,
    lo_shipmode             text,
    dummy text
)
LOCATION (:LOCATION)
FORMAT 'CSV' (DELIMITER ',');
