select 
    *,
    current_timestamp() as ingested_at
from {{source('source_webanalytics', 'order_item_refunds')}}

{% if is_incremental() %}
where created_at > (select max(created_at) from {{this}})
{% endif %}