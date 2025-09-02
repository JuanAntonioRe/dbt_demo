SELECT *
FROM {{ source('demo', 'bike') }}
LIMIT 7