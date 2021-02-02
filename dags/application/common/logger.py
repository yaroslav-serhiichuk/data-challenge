import logging
import sys

LOG_MESSAGE_FORMAT = '[%(asctime)s] {{%(name)s}} %(levelname)s - %(message)s'


def get_logger(name, level=logging.DEBUG):

    logger = logging.getLogger(name)
    logger.setLevel(level)
    formatter = logging.Formatter(LOG_MESSAGE_FORMAT)

    stdout_handler = logging.StreamHandler(stream=sys.stdout)
    stdout_handler.setFormatter(formatter)
    stdout_handler.addFilter(lambda r: r.levelno < logging.WARN)

    stderr_handler = logging.StreamHandler(stream=sys.stderr)
    stderr_handler.setFormatter(formatter)
    stderr_handler.addFilter(lambda r: r.levelno >= logging.WARNING)

    logger.addHandler(stdout_handler)
    logger.addHandler(stderr_handler)
    return logger
