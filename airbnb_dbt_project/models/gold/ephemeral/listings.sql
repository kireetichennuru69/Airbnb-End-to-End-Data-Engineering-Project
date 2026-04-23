{{ config (materialized = 'ephemeral') }}

WITH listings as (

    select
        listing_id,
        property_type,
        room_type,
        city,
        country,
        price_category,
        created_at
    from {{ref('obt')}}
)

select * from listings