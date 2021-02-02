import psycopg2

from application.common.logger import get_logger


class PostgresClient(object):

    def __init__(self, host: str, port: int, dbname: str, user: str, password: str):
        self.__host = host
        self.__port = port
        self.__dbname = dbname
        self.__user = user
        self.__password = password
        self._log = get_logger(self.__class__.__name__)

    def get_connection(self, autocommit=True):
        self._log.info('Connecting to database')
        connection = psycopg2.connect(host=self.__host, port=self.__port, dbname=self.__dbname,
                                      user=self.__user, password=self.__password)
        connection.autocommit = autocommit
        self._log.info('Successfully connected to database')
        return connection
