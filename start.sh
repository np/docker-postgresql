#!/bin/bash
set -e

POSTGRESQL_USER="${POSTGRESQL_USER:-"docker"}"
POSTGRESQL_PASS="${POSTGRESQL_PASS:-"docker"}"
POSTGRESQL_DB="${POSTGRESQL_DB:-"docker"}"

PGDATA="${PGDATA:-/data}"
POSTGRESQL_CONFIG_FILE="$PGDATA"/postgresql.conf
export PGDATA

if [ ! -d "$PGDATA" -o "$(ls -A "$PGDATA" 2>/dev/null)" ]; then
  initdb
  postgres --single <<< "CREATE USER '$POSTGRESQL_USER' WITH SUPERUSER;"
  postgres --single <<< "ALTER USER '$POSTGRESQL_USER' WITH PASSWORD '$POSTGRESQL_PASS';"
  postgres --single <<< "CREATE DATABASE '$POSTGRESQL_DB' OWNER '$POSTGRESQL_USER';"
fi

exec postgres
