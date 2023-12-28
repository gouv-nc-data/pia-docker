#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER pia with encrypted password 'pia';
	CREATE DATABASE pia OWNER pia;
	GRANT ALL PRIVILEGES ON DATABASE pia TO pia;
    ALTER USER pia CREATEDB;
EOSQL