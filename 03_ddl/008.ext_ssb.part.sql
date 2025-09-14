CREATE EXTERNAL TABLE ext_ssb.part (
    p_partkey       bigint,
    p_name          text,
    p_mfgr          text,
    p_category      text,
    p_brand         text,
    p_color         text,
    p_type          text,
    p_size          smallint,
    p_container     text,
    dummy text
)
LOCATION (:LOCATION)
FORMAT 'CSV' (DELIMITER ',');
