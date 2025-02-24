
  
    

    create or replace table `tough-timing-449701-k0`.`taxi_data`.`dim_zones`
      
    
    

    OPTIONS()
    as (
      

select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone 
from `tough-timing-449701-k0`.`taxi_data`.`taxi_zone_lookup`
    );
  