WITH bike AS (
    SELECT DISTINCT
        start_statio_id AS station_id,
        start_station_name AS station_name,
        start_lat AS station_lat,
        start_lng AS start_station_lng
    FROM {{ source('demo', 'bike') }}
    WHERE ride_id != 'ride_id'   
)

SELECT * FROM bike