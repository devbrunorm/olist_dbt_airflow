FROM {{ ref('gold.orders_fact') }}
WHERE (
    order_id IS NULL 
    OR order_status IS NULL 
    OR customer_id IS NULL
    OR customer_city IS NULL
    OR customer_state IS NULL
    OR customer_region IS NULL
)