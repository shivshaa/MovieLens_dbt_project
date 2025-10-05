SELECT * FROM MOVIELENS.DEV.fct_ratings
ORDER BY rating_timestamp DESC
LIMIT 5;

SELECT * FROM MOVIELENS.DEV.src_ratings
ORDER BY rating_timestamp DESC
LIMIT 5;

INSERT INTO MOVIELENS.DEV.src_ratings(user_id, movie_id, rating, rating_timestamp)
VALUES (87587, 7151, 4.0, '2015-03-31 22:00:02.000 -0700')