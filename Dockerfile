FROM apache/airflow:2.10.4

COPY requirements.txt  ./

USER airflow

RUN python -m virtualenv dbt_venv && source dbt_venv/bin/activate

RUN pip install apache-airflow==${AIRFLOW_VERSION} && \
    pip install -r requirements.txt