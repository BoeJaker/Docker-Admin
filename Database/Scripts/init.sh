#!/bin/bash

# Database setup
# initdb
# postgres  -c config_file=/var/lib/postgresql/conf/pg_hba.conf &
# Initialize PostgreSQL data directory
initdb -D /var/lib/postgresql/data

# Start PostgreSQL service
pg_ctl -D /var/lib/postgresql/data -l /var/lib/postgresql/logfile start -c config_file=/var/lib/postgresql/conf/pg_hba.conf

# Create default postgres user
psql -U postgres -c "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';"

/bin/sh # -c "mount -t ecryptfs /var/lib/postgresql/data/ /var/lib/postgresql/data/"x