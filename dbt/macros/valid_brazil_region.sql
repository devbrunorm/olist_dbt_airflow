{% test valid_brazil_region(model, column_name) %}
    select {{column_name}}
    from {{model}}
    where {{ column_name }} NOT IN ('S', 'SE', 'NE', 'CO', 'N')
{% endtest %}
