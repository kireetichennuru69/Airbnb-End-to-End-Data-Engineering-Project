{% set configs = [
    {

    "table" : "AIRBNB.SILVER.SILVER_BOOKINGS",
    "columns" : "silver_bookings.booking_id, silver_bookings.listing_id, silver_bookings.booking_date, silver_bookings.service_fee, silver_bookings.cleaning_fee, silver_bookings.total_revenue, silver_bookings.booking_status, silver_bookings.created_at",
    "alias" : "silver_bookings"

    },

    {

    "table" : "AIRBNB.SILVER.SILVER_LISTINGS",
    "columns" : "silver_listings.host_id, silver_listings.property_type, silver_listings.room_type, silver_listings.city, silver_listings.country, silver_listings.accommodates, silver_listings.bedrooms, silver_listings.bathrooms, silver_listings.price, silver_listings.price_category, silver_listings.created_at as listings_created_at",
    "alias" : "silver_listings",
    "join_condition" : "silver_bookings.listing_id = silver_listings.listing_id"

    },
    
    
    {

    "table" : "AIRBNB.SILVER.SILVER_HOSTS",
    "columns" : "silver_hosts.host_name, silver_hosts.host_since, silver_hosts.is_superhost, silver_hosts.response_rate, silver_hosts.response_quality, silver_hosts.created_at as hosts_created_at",
    "alias" : "silver_hosts",
    "join_condition" : "silver_listings.host_id = silver_hosts.host_id"

    }

] %}


select
{% for config in configs %}
    {{config['columns']}}{% if not loop.last %},{% endif %}
{% endfor %}

FROM 
    {% for config in configs %}
    {% if loop.first %}
        {{config['table']}} as {{config['alias']}}
    {% else %}
        LEFT JOIN {{config['table']}} as {{config['alias']}}
            ON {{config['join_condition']}}
    {% endif %}
{% endfor %}


