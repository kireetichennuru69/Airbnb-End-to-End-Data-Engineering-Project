--variable declaration
{% set flag = 2 %}

select * from {{ref ('bronze_bookings')}}

{% if flag == 1%}
WHERE nights_booked > 1
{% else %}
WHERE nights_booked = 1
{% endif %}

