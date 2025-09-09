create table :tname
 ( 
   lo_orderkey      :dynaint
 , lo_linenumber    smallint                  
 , lo_custkey       int                       
 , lo_partkey       int                       
 , lo_suppkey       int                       
 , lo_orderdate     date                          
 , lo_orderpriority text       
 , lo_shippriority  smallint                  
 , lo_quantity      smallint                  
 , lo_extendedprice int                       
 , lo_ordtotalprice int
 , lo_discount      smallint                  
 , lo_revenue       int                       
 , lo_supplycost    int                       
 , lo_tax           smallint                  
 , lo_commitdate    date                      
 , lo_shipmode      text            
 , c_name           text                      
 , c_address        text                      
 , c_city           text               
 , c_nation         text               
 , c_region         text               
 , c_phone          text                      
 , c_mktsegment     text           
 , s_name           text                      
 , s_address        text                      
 , s_city           text               
 , s_nation         text               
 , s_region         text               
 , s_phone          text                      
 , p_name           text                      
 , p_mfgr           text             
 , p_category       text             
 , p_brand          text             
 , p_color          text             
 , p_type           text             
 , p_size           smallint                  
 , p_container      text            
 )
 using ao_column with (compresstype=zstd)
 distributed by (lo_orderkey)
 partition by range (lo_orderdate)
 ( start('1992-01-01') end('1999-01-01') every(interval :par) )
;