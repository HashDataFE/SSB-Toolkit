INSERT INTO :DB_SCHEMA_NAME.customer (
    c_custkey,       
    c_name,          
    c_address,       
    c_city,          
    c_nation,        
    c_region,        
    c_phone,         
    c_mktsegment    
) SELECT 
    c_custkey,     
    c_name,        
    c_address,     
    c_city,        
    c_nation,      
    c_region,      
    c_phone,       
    c_mktsegment  
FROM :ext_schema_name.customer;