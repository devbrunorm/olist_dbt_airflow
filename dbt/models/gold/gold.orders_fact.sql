{{ config(materialized='table') }}

SELECT
    O.order_id,
    O.order_status,
    O.order_approved_at,
    OI.order_item_id,
    OI.product_id,
    OI.price::DOUBLE as price,
    OI.freight_value::DOUBLE as freight_value,
    O.customer_id,
    C.customer_city,
    C.customer_state,
    C.customer_region
FROM {{ ref('silver.orders') }} O
LEFT JOIN {{ ref('silver.order_items') }} OI
    ON O.order_id = OI.order_id
LEFT JOIN {{ ref('silver.customers') }} C
    ON O.customer_id = C.customer_id