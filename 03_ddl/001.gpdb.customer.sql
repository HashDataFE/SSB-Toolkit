CREATE TABLE :DB_SCHEMA_NAME.customer
(
    c_custkey       bigint,
    c_name          text,
    c_address       text,
    c_city          text,
    c_nation        text,
    c_region        text,
    c_phone         text,
    c_mktsegment    text
)
:ACCESS_METHOD
:STORAGE_OPTIONS
:DISTRIBUTED_BY;