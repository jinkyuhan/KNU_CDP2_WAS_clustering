FROM tomcat:9.0

RUN apt update && apt -y upgrade

COPY ./server.xml /usr/local/tomcat/conf/server.xml
COPY ./web.xml /usr/local/tomcat/conf/web.xml
