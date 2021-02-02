from airflow import DAG
from airflow.operators.python_operator import PythonOperator

from application.common.data_extraction import DataExtractor


def ingest_data(data_extractor: DataExtractor, source: str, load_query: str, delta: bool):
    if delta:
        data = data_extractor.extract_delta(source)
    else:
        data = data_extractor.extract(source)
    data_extractor.load(query=load_query, data=data)


def get_data_ingestion_operator(task_id: str, extractor: DataExtractor, source: str, load_query: str,
                                dag: DAG, delta=False):
    return PythonOperator(task_id=task_id,
                          python_callable=ingest_data,
                          op_kwargs={
                              'data_extractor': extractor,
                              'source': source,
                              'load_query': load_query,
                              'delta': delta
                          },
                          dag=dag)
