select 
    *,
    current_timestamp() as ingested_at
from {{ source ('source_webanalytics', 'order_items')}}


{% if is_incremental() %}
where created_at > (select max(created_at) from {{ this }})
{% endif %}