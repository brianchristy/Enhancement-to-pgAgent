-- Database: <TEST_DB_NAME>

-- DROP DATABASE IF EXISTS <TEST_DB_NAME>;

CREATE DATABASE <TEST_DB_NAME>
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = '<LC_COLLATE>'
    LC_CTYPE = '<LC_CTYPE>'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
