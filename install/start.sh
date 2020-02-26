#!/bin/bash -x

export JAVA_HOME=/usr/local/jdk-13.0.2
export JAVA_PATH=$JAVA_HOME
export JAVA_OPTS=""
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar
export PATH=$PATH:$JAVA_HOME/bin

java -jar /tmp/user-rest/user-rest.jar
