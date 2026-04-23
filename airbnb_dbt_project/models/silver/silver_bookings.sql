{{config (materialized = 'incremental', incremental_strategy = 'merge', unique_key = 'booking_id')}}


WITH booking_data AS (
        SELECT
        BOOKING_ID, 
        LISTING_ID, 
        BOOKING_DATE, 
        {{multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} AS TOTAL_BOOKING_AMOUNT,
        SERVICE_FEE,
        CLEANING_FEE,
        BOOKING_STATUS,
        CREATED_AT
    FROM {{ref ('bronze_bookings')}}
)

SELECT
    BOOKING_ID, 
    LISTING_ID, 
    BOOKING_DATE, 
    (TOTAL_BOOKING_AMOUNT + SERVICE_FEE + CLEANING_FEE) AS TOTAL_REVENUE,
    SERVICE_FEE,
    CLEANING_FEE,
    BOOKING_STATUS,
    CREATED_AT
FROM booking_data