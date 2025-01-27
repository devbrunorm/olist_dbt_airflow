from {{ ref('gold.orders_fact') }}
where (
    TRIM(order_id) = ''
    OR TRIM(order_status) = ''
    OR TRIM(customer_id) = ''
    OR TRIM(customer_city) = ''
    OR TRIM(customer_state) = ''
    OR TRIM(customer_region) = ''
)