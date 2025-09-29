{{ config(
    materialized = 'table'
) }}

WITH raw_ratings AS(

    SELECT
        *
    FROM
        movielens.RAW.raw_ratings
)
SELECT
    userId AS user_id,
    movieId AS movie_id,
    rating,
    TO_TIMESTAMP_LTZ(TIMESTAMP) AS rating_timestamp
FROM
    raw_ratings
