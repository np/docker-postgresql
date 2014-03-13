#!/bin/bash
set -e

POSTGRESQL_USER="${POSTGRESQL_USER:-"docker"}"
POSTGRESQL_PASS="${POSTGRESQL_PASS:-"docker"}"
POSTGRESQL_DB="${POSTGRESQL_DB:-"docker"}"

PGDATA="${PGDATA:-/data}"
POSTGRESQL_CONFIG_FILE="$PGDATA"/postgresql.conf
export PGDATA

if [ ! -d "$PGDATA" -o "$(ls -A "$PGDATA" 2>/dev/null)" ]; then
  mkdir -p "$PGDATA"
  chown -R postgres:postgres "$PGDATA"
  sudo -u postgres initdb
  sudo -u postgres postgres --single <<< "CREATE USER '$POSTGRESQL_USER' WITH SUPERUSER;"
  sudo -u postgres postgres --single <<< "ALTER USER '$POSTGRESQL_USER' WITH PASSWORD '$POSTGRESQL_PASS';"
  sudo -u postgres postgres --single <<< "CREATE DATABASE '$POSTGRESQL_DB' OWNER '$POSTGRESQL_USER';"
fi

exec sudo -u postgres postgres
