from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.operators.python import PythonOperator
from cosmos import DbtTaskGroup, ProfileConfig, ProjectConfig
from pathlib import Path
from datetime import datetime

from modules.export import run_export

DBT_PATH = "/opt/airflow/dbt/"

profile_config = ProfileConfig(
    profile_name="duckdb",
    target_name="dev",
    profiles_yml_filepath=Path(f"{DBT_PATH}/profiles.yml"),
)

project_config = ProjectConfig(
    dbt_project_path=DBT_PATH,
    models_relative_path="models"
)

with DAG(
    "main_dag",
    start_date=datetime(2025, 1, 1),
    schedule_interval="@daily",
    catchup=False,
    tags=["olist", "dbt"]
):
    export_raw_files = PythonOperator(
        task_id = "export_data", 
        python_callable = run_export, 
            op_kwargs={
                "kaggle_dataset": "olistbr/brazilian-ecommerce"
            }
    )

    dbt_test = DbtTaskGroup(
        group_id="dbt_test",
        project_config=project_config,
        profile_config=profile_config
    )

    export_raw_files >> dbt_test