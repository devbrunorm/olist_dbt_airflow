{{ config(materialized='table') }}

select *
from '/home/airflow/.cache/kagglehub/datasets/olistbr/brazilian-ecommerce/versions/2/olist_products_dataset.csv'