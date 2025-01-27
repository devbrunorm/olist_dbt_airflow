FROM {{ ref('gold.orders_fact') }}
WHERE customer_region NOT IN ('N', 'NE', 'CO', 'SE', 'S')