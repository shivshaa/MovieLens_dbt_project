--Defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;


CREATE STAGE netflixstage
URL = 's3://netflixdata-shivsharan'
CREDENTIALS = (AWS_KEY_ID = 'AKIATBRPP7XVGXCAJ66P' AWS_SECRET_KEY='*********************')


--Movies Table
CREATE OR REPLACE TABLE raw_movies(
    movieId INTEGER,
    title STRING,
    genres STRING
)


 COPY INTO raw_movies 
 FROM '@netflixstage/movies.csv'
 FILE_FORMAT = (TYPE='csv' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

 SELECT * FROM raw_movies;

--Tags Table
 CREATE OR REPLACE TABLE raw_tags(
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp BIGINT
 );
 
 COPY INTO raw_tags 
 FROM '@netflixstage/tags.csv'
 FILE_FORMAT = (TYPE='csv' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"')
 ON_ERROR = 'CONTINUE';

 SELECT * FROM raw_tags;

-- genome-tags
CREATE OR REPLACE TABLE raw_genome_tags(
    tagId INTEGER,
    tag STRING
);
COPY INTO raw_genome_tags
FROM '@netflixstage/genome-tags.csv'
FILE_FORMAT = (TYPE='csv' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

--links
CREATE OR REPLACE TABLE raw_links(
    movieId INTEGER,
    imdbId INTEGER,
    tmdbId INTEGER
);

COPY INTO raw_links
FROM '@netflixstage/links.csv'
FILE_FORMAT=(TYPE='csv' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');


--raw-genome-scores
CREATE OR REPLACE TABLE raw_genome_scores (
    movieId INTEGER,
    tagId INTEGER,
    relevance FLOAT
);

COPY INTO raw_genome_scores
FROM '@netflixstage/genome-scores.csv'
FILE_FORMAT=(TYPE='csv' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

--ratings
CREATE OR REPLACE TABLE raw_ratings(
    userId INTEGER,
    movieId INTEGER,
    rating FLOAT,
    timestamp BIGINT
);

COPY INTO raw_ratings
FROM '@netflixstage/ratings.csv'
FILE_FORMAT =(TYPE='csv' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');


SELECT * FROM raw_ratings;


