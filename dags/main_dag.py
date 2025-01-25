from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.operators.python import PythonOperator
from datetime import datetime

from modules.export import run_export

with DAG(
    "main_dag",
    start_date=datetime(2025, 1, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["olist", "dbt"]
):
    dummy_task = PythonOperator(
        task_id = "export_data", 
        python_callable = run_export, 
            op_kwargs={
                "kaggle_dataset": "olistbr/brazilian-ecommerce"
            }
    )