{{ config(materialized='table') }}

select *
from {{ source('kaggle_source', 'olist_geolocation_dataset') }}