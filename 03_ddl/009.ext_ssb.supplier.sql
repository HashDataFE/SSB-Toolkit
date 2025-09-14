CREATE EXTERNAL TABLE ext_ssb.supplier (
    s_suppkey       bigint,
    s_name          text,
    s_address       text,
    s_city          text,
    s_nation        text,
    s_region        text,
    s_phone         text,
    dummy text
)
LOCATION (:LOCATION)
FORMAT 'CSV' (DELIMITER ',');
