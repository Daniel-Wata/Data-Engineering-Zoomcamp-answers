

WITH quarterly_revenue AS (
    SELECT
        service_type,
        pickup_quarter,
        pickup_year,
        pickup_quarter_year,
        total_quarter_revenue
    FROM `tough-timing-449701-k0`.`taxi_data_core`.`fct_taxi_trips_quarterly_revenue`
)

, previous_revenue AS (
    SELECT
        service_type,
        pickup_quarter,
        pickup_year,
        pickup_quarter_year,
        total_quarter_revenue,

        -- Compute previous year's revenue ONCE
        LAG(total_quarter_revenue) OVER (
            PARTITION BY service_type, pickup_quarter
            ORDER BY pickup_year
        ) AS prev_year_revenue
    FROM quarterly_revenue
)

SELECT
    service_type,
    pickup_quarter,
    pickup_year,
    pickup_quarter_year,
    total_quarter_revenue,
    prev_year_revenue,

    -- Ensure proper division and rounding
    ROUND(
        SAFE_DIVIDE(total_quarter_revenue - prev_year_revenue, prev_year_revenue) * 100,
        2
    ) AS yoy_growth_percentage

FROM previous_revenue