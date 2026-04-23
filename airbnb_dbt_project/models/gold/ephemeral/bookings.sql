{{ config (materialized = 'ephemeral') }}

WITH bookings as (

    select
        booking_id,
        booking_date,
        booking_status,
        created_at
    from {{ref('obt')}}
)

select * from bookings