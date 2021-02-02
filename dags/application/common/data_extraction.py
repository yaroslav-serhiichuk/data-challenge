from abc import abstractmethod
import csv
from datetime import datetime
import requests

from application.common.constants import UTF_8, COUNTRIES_CSV_HEADER, VACCINATION_CSV_HEADER
from application.common.database import PostgresClient
from application.common.logger import get_logger
from application.common.queries import GET_LAST_COVID_REPORT_DATE, GET_LAST_VACCINATION_REPORT_DATE


class DataExtractor(object):

    def __init__(self, pg_client: PostgresClient):
        self._pg_client = pg_client
        self._log = get_logger(self.__class__.__name__)

    @abstractmethod
    def extract(self, source: str):
        pass

    @abstractmethod
    def extract_delta(self, source: str):
        pass

    @abstractmethod
    def _get_values_to_insert(self, data) -> list:
        pass

    def load(self, query: str, data):
        if data:
            self._log.info(f'Executing insert - {len(data)} records')
            with self._pg_client.get_connection() as connection:
                with connection.cursor() as cursor:
                    cursor.executemany(query, self._get_values_to_insert(data))
        else:
            self._log.info('Nothing to insert')

    def _check_for_null(self, value):
        return None if value == '' else value


class CovidDataExtractor(DataExtractor):

    def extract(self, source: str) -> dict:
        return requests.get(source).json()['records']

    def extract_delta(self, source):

        filtered_data = []
        last_report_date = None

        def filter_on_date(record):
            if datetime.strptime(record['dateRep'], '%d/%m/%Y').date() <= last_report_date:
                return False
            else:
                return True

        with self._pg_client.get_connection() as connection:
            with connection.cursor() as cursor:
                cursor.execute(GET_LAST_COVID_REPORT_DATE)
                last_report_date = cursor.fetchone()[0]
                self._log.info(f'Last report date is {last_report_date}')
                data = self.extract(source)
                filtering_iterator = filter(filter_on_date, data)
                for r in filtering_iterator:
                    filtered_data.append(r)
        return filtered_data

    def _get_values_to_insert(self, data):
        insert = []
        for r in data:
            insert.append((self._check_for_null(datetime.strptime(r['dateRep'], '%d/%m/%Y').strftime('%Y-%m-%d')),
                           self._check_for_null(r['year_week'].split('-')[0]),
                           self._check_for_null(r['year_week'].split('-')[1]),
                           self._check_for_null(r['cases_weekly']),
                           self._check_for_null(r['deaths_weekly']),
                           self._check_for_null(r['countriesAndTerritories']),
                           self._check_for_null(r['geoId']),
                           self._check_for_null(r['countryterritoryCode']),
                           self._check_for_null(r['popData2019']),
                           self._check_for_null(r['continentExp']),
                           self._check_for_null(r['notification_rate_per_100000_population_14-days'])))
        return insert


class CountriesDataExtractor(DataExtractor):

    def extract(self, source) -> list:
        return requests.get(source).content.decode(UTF_8).splitlines()[1:]

    def extract_delta(self, source: str):
        pass

    def _get_values_to_insert(self, data: list) -> list:
        insert = []
        csv_reader = csv.DictReader(data, fieldnames=COUNTRIES_CSV_HEADER)
        for row in csv_reader:
            insert.append((self._check_for_null(row[COUNTRIES_CSV_HEADER[0]].strip()),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[1]].strip()),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[2]]),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[3]]),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[4]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[5]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[6]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[7]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[8]]),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[9]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[10]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[11]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[12]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[13]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[14]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[15]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[16]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[17]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[18]].replace(',', '.')),
                           self._check_for_null(row[COUNTRIES_CSV_HEADER[19]].replace(',', '.'))))
        return insert


class VaccinationDataExtractor(DataExtractor):

    def extract(self, source: str) -> list:
        return requests.get(source).content.decode(UTF_8).splitlines()[1:]

    def extract_delta(self, source: str):

        filtered_data = []
        last_report_date = None

        def filter_on_date(record):
            values = record.split(',')
            if datetime.strptime(values[2], '%Y-%m-%d').date() <= last_report_date:
                return False
            else:
                return True

        with self._pg_client.get_connection() as connection:
            with connection.cursor() as cursor:
                cursor.execute(GET_LAST_VACCINATION_REPORT_DATE)
                last_report_date = cursor.fetchone()[0]
                self._log.info(f'Last report date is {last_report_date}')
                data = self.extract(source)
                filtering_iterator = filter(filter_on_date, data)
                for r in filtering_iterator:
                    filtered_data.append(r)
        return filtered_data

    def _get_values_to_insert(self, data) -> list:
        insert = []
        csv_reader = csv.DictReader(data, fieldnames=VACCINATION_CSV_HEADER)
        for row in csv_reader:
            insert.append((self._check_for_null(row[VACCINATION_CSV_HEADER[0]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[1]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[2]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[3]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[4]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[5]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[6]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[7]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[8]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[9]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[10]]),
                           self._check_for_null(row[VACCINATION_CSV_HEADER[11]])))
        return insert
