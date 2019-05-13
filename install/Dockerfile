FROM stephaneeybert/ubuntuos-mariadb:10.3.12


# Installing the JDK

WORKDIR /usr/local
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/12.0.1+12/69cfe15208a647278a19ef0990eea691/jdk-12.0.1_linux-x64_bin.tar.gz \
  && gzip -d jdk-12.0.1_linux-x64_bin.tar.gz \
  && tar -xvf jdk-12.0.1_linux-x64_bin.tar


# Installing the application

RUN mkdir -p /tmp/user-rest
WORKDIR /tmp/user-rest

COPY expand-secrets.sh /tmp/user-rest

RUN mkdir -p data/mysql
COPY mysql-database.sql /tmp/user-rest/data/mysql
COPY mysql-user.sql /tmp/user-rest/data/mysql

COPY db-install.sh /tmp/user-rest/data/mysql

COPY start.sh /tmp/user-rest/start.sh
RUN chmod 755 /tmp/user-rest/start.sh

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/tmp/user-rest/data/mysql/db-install.sh"]

