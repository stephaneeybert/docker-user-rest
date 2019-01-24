FROM stephaneeybert/user-rest-install

WORKDIR /tmp/user-rest

RUN apk --update add openjdk8-jre

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/usr/bin/java", "-jar", "/tmp/user-rest/user-rest.jar"]
