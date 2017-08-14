#!/bin/bash
# $1 = Database to backup
# $2 = Filename
set -x
pg_dump $1 > $2
