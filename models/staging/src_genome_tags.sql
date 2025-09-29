WITH raw_genome_tags AS (
    SELECT
        *
    FROM
        movielens.RAW.raw_genome_tags
)
SELECT
    tagId AS tag_id,
    tag
FROM
    raw_genome_tags
