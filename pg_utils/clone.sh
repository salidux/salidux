#!/bin/bash
set -x
psql --host=localhost --dbname=postgres --command="create database $2 template $1;"
