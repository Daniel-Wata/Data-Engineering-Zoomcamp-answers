{{
    config(
        materialized='table'
    )
}}

with filtered_trips as (
    select 
        *
    from {{ ref('fact_trips') }}
    WHERE fare_amount > 0 and trip_distance > 0 and payment_type_description in ('Cash', 'Credit card')
)

SELECT DISTINCT * FROM (
SELECT
    service_type,
    pickup_year,
    pickup_month,
    PERCENTILE_CONT(fare_amount, 0.97) OVER (
        PARTITION BY service_type, pickup_year, pickup_month
    ) AS p97,
    PERCENTILE_CONT(fare_amount, 0.95) OVER (
        PARTITION BY service_type, pickup_year, pickup_month
    ) AS p95,
    PERCENTILE_CONT(fare_amount, 0.90) OVER (
        PARTITION BY service_type, pickup_year, pickup_month
    ) AS p90
FROM filtered_trips)
