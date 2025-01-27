FROM {{ ref('gold.orders_fact') }}
WHERE price < 0