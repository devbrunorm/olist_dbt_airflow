SELECT
    order_id,
    order_item_id,
    product_id,
    price,
    freight_value
FROM {{ ref("bronze.order_items") }}