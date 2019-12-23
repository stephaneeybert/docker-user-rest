FROM stephaneeybert/ubuntuos:18.04

# Installing the JDK

WORKDIR /usr/local
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  https://download.oracle.com/otn-pub/java/jdk/13.0.1+9/cec27d702aa74d5a8630c65ae61e4305/jdk-13.0.1_linux-x64_bin.tar.gz \  
  && gzip -d jdk-13.0.1_linux-x64_bin.tar.gz \
  && tar -xvf jdk-13.0.1_linux-x64_bin.tar


# Installing the application start command

COPY start.sh /user/local/user-rest/start.sh
RUN chmod 755 /user/local/user-rest/start.sh

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
