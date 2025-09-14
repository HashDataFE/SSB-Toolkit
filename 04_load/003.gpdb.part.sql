INSERT INTO :DB_SCHEMA_NAME.part 
(
    p_partkey  ,
    p_name     ,
    p_mfgr     ,
    p_category ,
    p_brand    ,
    p_color    ,
    p_type     ,
    p_size     ,
    p_container
)
SELECT 
    p_partkey  ,
    p_name     ,
    p_mfgr     ,
    p_category ,
    p_brand    ,
    p_color    ,
    p_type     ,
    p_size     ,
    p_container
FROM :ext_schema_name.part;
