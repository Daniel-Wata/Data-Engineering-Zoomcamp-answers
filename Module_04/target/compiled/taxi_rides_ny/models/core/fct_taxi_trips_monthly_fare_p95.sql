

with filtered_trips as (
    select 
        *
    from `tough-timing-449701-k0`.`taxi_data_core`.`fact_trips`
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