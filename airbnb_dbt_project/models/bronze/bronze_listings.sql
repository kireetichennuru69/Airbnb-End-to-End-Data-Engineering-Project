{{config(materialized = 'incremental')}}


select * from {{ source('staging', 'listings') }}

{% if is_incremental() %}

WHERE created_at > (select coalesce(max(created_at), '1900-01-01') from {{ this }})

{% endif %}
