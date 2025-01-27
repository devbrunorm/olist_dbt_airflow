# Olist DBT/Airflow Integration

## Goals
- Practice and experiment with DBT
- Evaluate how Airflow and DBT works together using 'cosmos' lib from Astronomer

## Tools used
- Docker
- Airflow
- DuckDB
- DBT
- Python
- Kaggle ([Data Source](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce))

## Setup and running
### Requeriments
- Docker
- Python 3*
- DuckDB (Python Module)*

\* Required only if you want to debug the final result

### Steps
1. Clone this repo
2. Create a .env file containing a AIRFLOW_UID (Consult [documentation](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html#initializing-environment) for more info):
```
AIRFLOW_UID=1000
```
3. Run the command:
```
docker compose up --build
```
4. With Airflow services finally booted, access your browser the following URI: http://localhost:8080
5. Login at Airflow UI using these credentials:
```
user: airflow
password: airflow
```
6. Trigger the DAG named "main_dag"
7. [Extra] After the DAG run is finished, if you desire to check if everything worked, you can run the Python script "script_test_duckdb.py". Note that in order for the script to work, you will need Python and the 'duckdb' module installed.