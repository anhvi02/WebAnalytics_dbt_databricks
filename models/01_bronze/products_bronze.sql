{{ config(materialized='table') }}

-- small static lookup table: rebuilt in full on every run, no incremental filter
select
    *,
    current_timestamp() as ingested_bronze_at
from {{ source('source_webanalytics', 'products') }}
