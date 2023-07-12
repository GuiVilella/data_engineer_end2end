
with stg_videos as (
    SELECT
    *
    from {{ source("videos_info", "table_flat") }}
    {% if env_var("DBT_TARGET_SCHEMA") == 'develop' %}

    -- this filter will only be applied to the development schema
    limit 5
    {% endif %}
)

select * from stg_videos
