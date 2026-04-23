{{config (materialized = 'incremental', incremental_strategy = 'merge', unique_key = 'listing_id')}}


select
    listing_id,
    host_id,
    {{trim('property_type')}} as property_type,
    {{trim('room_type')}} as room_type,
    city,
    country,
    accommodates,
    bedrooms,
    bathrooms,
    price_per_night as price,
    {{tag('price')}} as price_category,
    created_at
from {{ref('bronze_listings')}}



