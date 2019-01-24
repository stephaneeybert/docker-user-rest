FROM alpine:3.8

RUN apk add --no-cache vim bash openssl wget curl

RUN apk add --no-cache --virtual build-essential build-base gcc cmake linux-headers libexecinfo-dev gnutls-dev bison
# autoconf     bash     bison     build-base     bzip2     curl     findutils     git     imagemagick     libbz2     libcurl     libc6-compat     libevent     musl     openjdk7     openjdk7-jre     openssh-client     openssh     postgresql-client     postgresql     python     python-dev     ruby     ruby-dev     socat     stunnel     syslinux     tar     zip


# Installing the mysql client

RUN apk add --no-cache ncurses-dev

COPY mariadb-10.3.7.tar.gz /usr/bin/
WORKDIR /usr/bin/
RUN gzip -d mariadb-10.3.7.tar.gz \
  && tar -xvf mariadb-10.3.7.tar \
  && ln -s mariadb-10.3.7 mariadb

WORKDIR /usr/bin/mariadb/
RUN mkdir install \
  && mkdir install/data \
  && mkdir install/var \
  && mkdir install/etc \
  && mkdir install/tmp

RUN cd /usr/bin/mariadb/ \
  && cmake \
  -DCMAKE_INSTALL_PREFIX=/usr/bin/mariadb/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DWITHOUT_TOKUDB=1 \
  -DMYSQL_DATADIR=/usr/bin/mariadb/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/usr/bin/mariadb/install/boost \
  -DMYSQL_UNIX_ADDR=/usr/bin/mariadb/install/tmp/mariadb.sock \
  && make \
  && make install \
  && make clean


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

