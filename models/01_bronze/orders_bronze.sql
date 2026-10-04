-- Raw copy of orders from SQL Server (via Lakehouse Federation).
-- Folder config: incremental + append, so each run only adds orders newer than what's already loaded.

select
    *,
    current_timestamp() as ingested_bronze_at
from {{ source('source_webanalytics', 'orders') }}



-- apply incremental checkpoint using column: created_at
{% if is_incremental() %}
where created_at > (select max(created_at) from {{ this }})
{% endif %}
