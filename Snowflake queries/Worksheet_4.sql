SELECT * FROM snapshots.snap_tags
ORDER BY user_id, dbt_valid_from DESC;

SELECT * FROM snapshots.snap_tags
WHERE user_id=18
ORDER BY user_id, dbt_valid_from DESC;

UPDATE src_tags
SET tag = 'Mark Waters Returns', tag_timestamp = CAST(CURRENT_TIMESTAMP() AS TIMESTAMP_NTZ)
WHERE user_id = 18;

SELECT * FROM dev.src_tags
WHERE user_id=18;