CREATE TABLE :DB_SCHEMA_NAME.supplier
(
    s_suppkey       bigint,
    s_name          text,
    s_address       text,
    s_city          text,
    s_nation        text,
    s_region        text,
    s_phone         text
)
:ACCESS_METHOD
:STORAGE_OPTIONS
:DISTRIBUTED_BY;