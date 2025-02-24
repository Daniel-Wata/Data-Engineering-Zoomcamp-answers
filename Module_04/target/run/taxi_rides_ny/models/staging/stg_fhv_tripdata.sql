

  create or replace view `tough-timing-449701-k0`.`taxi_data_staging`.`stg_fhv_tripdata`
  OPTIONS()
  as 
 
  select * FROM
     `tough-timing-449701-k0`.`taxi_data`.`fhv_tripdata`
  where dispatching_base_num is not null 

-- dbt build --select <model.sql> --vars '{'is_test_run: false}'
;

