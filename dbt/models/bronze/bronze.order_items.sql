{{ config(materialized='table') }}

select *
from {{ source('kaggle_source', 'olist_order_items_dataset') }}