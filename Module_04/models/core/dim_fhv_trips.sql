{{
    config(
        materialized='table'
    )
}}

with fhv_data as (
    select *
    from {{ ref('stg_fhv_tripdata') }}
), 
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select 
    f.unique_row_id,
    f.pickup_datetime,
    f.dropoff_datetime,
    f.PULocationID as pickup_locationid,
    puz.pickup_zone,
    f.DOLocationID as dropoff_locationid,
    doz.dropoff_zone,
    SAFE_CAST(format_date('%Y', date(f.pickup_datetime)) AS INTEGER) as pickup_year,
    SAFE_CAST(format_date('%m', date(f.pickup_datetime)) AS INTEGER) as pickup_month,
    timestamp_diff(f.dropoff_datetime, f.pickup_datetime, minute) as trip_duration

 from fhv_data f 
INNER JOIN 
(SELECT locationid, zone as pickup_zone FROM dim_zones) puz on f.PULocationID = puz.locationid
INNER JOIN 
(SELECT locationid, zone as dropoff_zone FROM dim_zones) doz on f.DOLocationID = doz.locationid