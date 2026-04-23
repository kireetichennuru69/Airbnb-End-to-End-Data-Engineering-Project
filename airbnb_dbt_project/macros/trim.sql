{% macro trim(column_name) %}
    trim(upper({{column_name}}))
{% endmacro %}
