{{config (materialized = 'incremental', incremental_strategy = 'merge', unique_key = 'host_id')}}


select
    host_id,
    REPLACE(host_name, ' ', '_') as host_name,
    host_since,
    is_superhost,
    response_rate,
    case when response_rate > 95 then 'Very Good'
         when response_rate > 80 then 'Good'
         else 'Needs Improvement' end as response_quality,
    created_at
from {{ref('bronze_hosts')}}