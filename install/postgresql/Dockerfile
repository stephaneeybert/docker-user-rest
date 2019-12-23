FROM stephaneeybert/ubuntuos-postgresql:12.1


RUN mkdir -p /usr/local/user-rest/postgresql

COPY postgresql-database.sql postgresql-user.sql db-install.sh expand-secrets.sh /usr/local/user-rest/postgresql/
RUN chmod 755 /usr/local/user-rest/postgresql/db-install.sh

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/user-rest/postgresql/db-install.sh"]

