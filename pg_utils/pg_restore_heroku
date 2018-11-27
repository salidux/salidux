#!/bin/bash
# $1 = Heroku App name (ex: my_app)
# $2 = Database name (ex: my_app_development)
local blue="\033[0;34m"
local reset_color="\033[0m"

set -x

TEMP_DIR="/tmp/${1}_restore"
DUMP_FNAME="${1}.dump"

rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR
cd $TEMP_DIR

# Download the latest backup from Heroku
heroku pg:backups:download -o $DUMP_FNAME --app $1

# Create the database
psql --host=localhost --dbname=postgres --command="DROP DATABASE IF EXISTS $2"
psql --host=localhost --dbname=postgres --command="CREATE DATABASE $2"

# Levantar respaldo
pg_restore --clean --no-acl --no-owner --host=localhost --dbname=$2 $DUMP_FNAME

cd -

echo "Finished!"
echo "To clean temp data, run: ${blue}rm ${TEMP_DIR}/${DUMP_FNAME}${reset_color}"
