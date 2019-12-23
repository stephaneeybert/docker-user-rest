#!/bin/bash -x

# Give some time to the database server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/local/user-rest/postgresql/expand-secrets.sh

# Avoid having to provide the user password on the command line
export PGPASSWORD=$DB_ROOT_PASSWORD

/usr/local/postgresql/install/bin/psql -h postgresql -p 5432 -U postgres < /usr/local/user-rest/postgresql/postgresql-database.sql
/usr/local/postgresql/install/bin/psql -h postgresql -p 5432 -U postgres < /usr/local/user-rest/postgresql/postgresql-user.sql

chown -R $HOST_USER_ID /usr/local/postgresql/install/data
chgrp -R $HOST_GROUP_ID /usr/local/postgresql/install/data

