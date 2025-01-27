{{ config(materialized='table') }}

select *
from {{ source('kaggle_source', 'olist_customers_dataset') }}