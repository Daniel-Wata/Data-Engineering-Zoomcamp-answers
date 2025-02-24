

  create or replace view `tough-timing-449701-k0`.`taxi_data`.`test`
  OPTIONS()
  as with source as (
    select * 
    from `tough-timing-449701-k0`.`taxi_data`.`green_tripdata`
)
select * from source;

