FROM stephaneeybert/alpineos-mariadb:10.3.7


# Installing the application

RUN mkdir -p /tmp/user-rest
WORKDIR /tmp/user-rest

COPY expand-secrets.sh /tmp/user-rest

RUN mkdir -p data/mysql
COPY mysql-database.sql /tmp/user-rest/data/mysql
COPY mysql-user.sql /tmp/user-rest/data/mysql

COPY db-install.sh /tmp/user-rest/data/mysql

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/tmp/user-rest/data/mysql/db-install.sh"]

