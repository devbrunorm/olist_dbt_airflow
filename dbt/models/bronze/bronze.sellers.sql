{{ config(materialized='table') }}

select *
from {{ source('kaggle_source', 'olist_sellers_dataset') }}