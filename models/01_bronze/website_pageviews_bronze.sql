select 
    *,
    current_timestamp() as ingested_bronze_at
from {{source('source_webanalytics', 'website_pageviews')}}



-- apply incremental checkpoint using column: created_at
{% if is_incremental() %}
where created_at > (select max(created_at) from {{this}})
{% endif %}