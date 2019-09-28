#!/bin/bash -x

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /tmp/user-rest/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

/usr/local/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -v < /tmp/user-rest/data/mysql/mysql-database.sql
/usr/local/mariadb/install/bin/mysql useraccount --protocol=tcp -h mysql -P 3306 -u root -v < /tmp/user-rest/data/mysql/mysql-user.sql

chown -R $HOST_USER_ID /usr/local/mariadb/install/data
chgrp -R $HOST_GROUP_ID /usr/local/mariadb/install/data
