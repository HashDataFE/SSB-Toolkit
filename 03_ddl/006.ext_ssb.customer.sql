CREATE EXTERNAL TABLE ext_ssb.customer (
    c_custkey       bigint,
    c_name          text,
    c_address       text,
    c_city          text,
    c_nation        text,
    c_region        text,
    c_phone         text,
    c_mktsegment    text,
    dummy text
)
LOCATION (:LOCATION)
FORMAT 'CSV' (DELIMITER ',');
