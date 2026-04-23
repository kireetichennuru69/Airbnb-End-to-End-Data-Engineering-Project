{{ config (materialized = 'ephemeral') }}

WITH hosts as (

    select
        host_id,
        host_name,
        host_since,
        is_superhost,
        response_quality,
        created_at
    from {{ref('obt')}}
)

select * from hosts