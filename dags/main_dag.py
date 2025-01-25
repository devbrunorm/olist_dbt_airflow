from airflow import DAG
from airflow.operators.dummy import DummyOperator
from datetime import datetime

with DAG(
    "main_dag",
    start_date=datetime(2022, 1, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["olist", "dbt"]
):
    dummy_task = DummyOperator(task_id = "test")