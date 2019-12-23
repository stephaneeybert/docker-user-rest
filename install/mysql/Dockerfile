FROM stephaneeybert/ubuntuos-mariadb:10.3.12


RUN mkdir -p /usr/local/user-rest/mysql

COPY mysql-database.sql mysql-user.sql db-install.sh expand-secrets.sh /usr/local/user-rest/mysql/
RUN chmod 755 /usr/local/user-rest/mysql/db-install.sh

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/user-rest/mysql/db-install.sh"]

