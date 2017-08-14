#!/bin/bash
# $1 = Database name (ex: production_backup)
# $2 = Dump file (ex: backup-pd-20170304.dump)
set -x

psql --host=localhost --dbname=postgres --command="DROP DATABASE IF EXISTS $1"

# Crear base de datos
psql --host=localhost --dbname=postgres --command="create database $1"

# Levantar respaldo
pg_restore --clean --no-acl --no-owner --host=localhost --dbname="$1" "$2"

