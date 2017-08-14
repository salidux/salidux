#!/bin/bash
set -x
psql --host=localhost --dbname=postgres --command="ALTER DATABASE $1 RENAME TO $2;"
