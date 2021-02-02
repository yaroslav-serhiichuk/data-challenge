from datetime import datetime, timedelta

from airflow import DAG
from airflow.hooks.base_hook import BaseHook

from application.common.constants import COVID_DATA_API_ENDPOINT, VACCINATION_CSV_URL
from application.common.data_extraction import CovidDataExtractor, VaccinationDataExtractor
from application.common.database import PostgresClient
from application.common.queries import INSERT_COVID_DATA, INSERT_VACCINATION_DATA
from application.operators.data_ingestion_operator import get_data_ingestion_operator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2021, 1, 1),
    'email': ['chukkykatz@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 3,
    'retry_delay': timedelta(minutes=5)
}

dag = DAG('delta_load', default_args=default_args, schedule_interval=timedelta(hours=1), catchup=False)

connection = BaseHook.get_connection("data_challenge_db")
pg_client = PostgresClient(host=connection.host, port=connection.port, dbname=connection.schema,
                           user=connection.login, password=connection.get_password())

covid_data_extractor = CovidDataExtractor(pg_client)
covid_data_ingestion_op = get_data_ingestion_operator(task_id='extract_covid_data',
                                                      extractor=covid_data_extractor,
                                                      source=COVID_DATA_API_ENDPOINT,
                                                      load_query=INSERT_COVID_DATA,
                                                      delta=True,
                                                      dag=dag)

vaccination_data_extractor = VaccinationDataExtractor(pg_client)
vaccination_data_ingestion_op = get_data_ingestion_operator(task_id='extract_vaccination_data',
                                                            extractor=vaccination_data_extractor,
                                                            source=VACCINATION_CSV_URL,
                                                            load_query=INSERT_VACCINATION_DATA,
                                                            delta=True,
                                                            dag=dag)
