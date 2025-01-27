SELECT 
    order_id,
    customer_id,
    order_status,
    order_approved_at
FROM {{ ref('bronze.orders') }}