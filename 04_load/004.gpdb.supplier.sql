INSERT INTO :DB_SCHEMA_NAME.supplier 
(
    s_suppkey,
    s_name   ,
    s_address,
    s_city   ,
    s_nation ,
    s_region ,
    s_phone  
)
SELECT 
    s_suppkey,
    s_name   ,
    s_address,
    s_city   ,
    s_nation ,
    s_region ,
    s_phone  
FROM :ext_schema_name.supplier;
