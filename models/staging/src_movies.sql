WITH raw_movies AS(
    SELECT
        *
    FROM
        movielens.RAW.raw_movies
)
SELECT
    movieId AS movie_id,
    title,
    genres
FROM
    raw_movies
    /*
            Query after altering names in the sources.yml
            WITH raw_movies AS(
                SELECT
                    *
                FROM
                    {{ source(
                        'my_dbt_project',
                        'r_movies'
                    ) }}
            )
            SELECT
                movieId AS movie_id,
                title,
                genres
            FROM
                raw_movies
            */
