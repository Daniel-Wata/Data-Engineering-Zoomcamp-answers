{{
    config(
        materialized='table'
    )
}}

with trips as (
    select 
        *
    from {{ ref('fact_trips') }}
)

, agg_trips_per_quarter as (
    select 
        service_type,
        pickup_quarter,
        pickup_year,
        pickup_quarter_year,
        count(tripid) as number_of_trips,
        sum(passenger_count) as total_passenger_count,
        sum(trip_distance) as total_trip_distance,
        avg(trip_distance) as average_trip_distance,
        sum(fare_amount) as total_fare_amount,
        sum(extra) as total_extra,
        sum(mta_tax) as total_mta_tax,
        sum(tip_amount) as total_tip_amount,
        sum(tolls_amount) as total_tolls_amount,
        sum(ehail_fee) as total_ehail_fee,
        sum(improvement_surcharge) as total_improvement_surcharge,
        sum(total_amount) as total_quarter_revenue
    from trips
    group by
        service_type,
        pickup_quarter,
        pickup_year,
        pickup_quarter_year
)


select
    *
from agg_trips_per_quarter





