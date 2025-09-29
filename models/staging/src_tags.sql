{{ config(
    materialized = 'table'
) }}

WITH raw_tags AS(

    SELECT
        *
    FROM
        movielens.RAW.raw_tags
)
SELECT
    userId AS user_id,
    movieId AS movie_id,
    tag,
    TO_TIMESTAMP_LTZ(TIMESTAMP) AS tag_timestamp
FROM
    raw_tags
