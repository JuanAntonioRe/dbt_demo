WITH cte AS(
    SELECT
        TO_TIMESTAMP(started_at) AS STARTED_AT,
        DATE(TO_TIMESTAMP(started_at)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(started_at)) AS HOUR_STARTED_AT,
        
        {{day_type('started_at')}} AS DAY_TYPE,
        
        {{get_season('started_at')}} AS STATION_OF_YEAR 

    FROM {{ ref('stage_bike') }}
    WHERE started_at != 'started_at' AND started_at != '"started_at"'
)

SELECT *
FROM cte