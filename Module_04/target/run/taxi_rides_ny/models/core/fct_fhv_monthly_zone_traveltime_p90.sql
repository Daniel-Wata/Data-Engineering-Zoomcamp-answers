
  
    

    create or replace table `tough-timing-449701-k0`.`taxi_data_core`.`fct_fhv_monthly_zone_traveltime_p90`
      
    
    

    OPTIONS()
    as (
      


select 
    *,
    PERCENTILE_CONT(trip_duration, 0.90) OVER (
    PARTITION BY pickup_locationid, pickup_year, pickup_month, dropoff_locationid
) AS p90
from `tough-timing-449701-k0`.`taxi_data_core`.`dim_fhv_trips`
where pickup_locationid is not null and dropoff_locationid is not null
    );
  