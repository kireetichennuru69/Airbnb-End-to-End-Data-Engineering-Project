{% set configs = [
    {

    "table" : "AIRBNB.GOLD.OBT",
    "columns" : "gold_obt.booking_id, gold_obt.listing_id, gold_obt.host_id, gold_obt.service_fee, gold_obt.cleaning_fee, gold_obt.total_revenue, gold_obt.accommodates, gold_obt.bedrooms, gold_obt.bathrooms, gold_obt.price, gold_obt.response_rate",
    "alias" : "gold_obt"

    }

] %}


select
{% for config in configs %}
    {% if config['columns'] %}{{config['columns']}}{% if not loop.last %},{% endif %}{% endif %}
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


