select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select tripid
from `tough-timing-449701-k0`.`taxi_data`.`stg_yellow_tripdata`
where tripid is null



      
    ) dbt_internal_test