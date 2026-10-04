select 
    *,
    current_timestamp() as ingested_bronze_at
from {{source('source_webanalytics', 'order_item_refunds')}}



-- apply incremental checkpoint using column: created_at
{% if is_incremental() %}
where created_at > (select max(created_at) from {{this}})
{% endif %}