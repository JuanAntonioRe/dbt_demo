WITH cte AS (
    SELECT
        t.*,
        w.*
    FROM {{ ref('trip_fact') }} t
    LEFT JOIN {{ ref('daily_weather') }} w
    ON t.trip_date = w.daily_weather
    ORDER BY trip_date DESC
)

SELECT *
FROM cte