WITH cte AS (
    SELECT *
    FROM {{ source('uscrime', 'URBAN_CRIME_INCIDENT_LOG') }}
    WHERE city = 'New York' AND offense_category IN ('Theft', 'Driving Under The Influence')
)

SELECT
    offense_category,
    {{get_season('DATE')}} AS season,
    {{day_type('DATE')}} AS day_type,
    COUNT(offense_category) AS number_offense
FROM cte
GROUP BY offense_category, season, day_type
ORDER BY number_offense DESC