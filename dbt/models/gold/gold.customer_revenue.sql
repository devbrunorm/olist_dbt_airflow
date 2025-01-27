{{ config(materialized='view') }}

SELECT
    customer_id,
    customer_city,
    customer_state,
    customer_region,
    SUM(price) as revenue,
    COUNT(DISTINCT order_id) as total_orders
FROM {{ ref('gold.orders_fact') }}
GROUP BY
    customer_id, customer_city, customer_state, customer_region