FROM tomcat:9.0

RUN apt-get update
RUN apt-get -y upgrade

COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml
COPY ./conf/web.xml /usr/local/tomcat/conf/web.xml
COPY ./scripts/setup_container.sh /usr/local/tomcat/setup_container.sh
COPY ./webcontents/* /usr/local/tomcat/webapps/ROOT/
RUN /bin/sh /usr/local/tomcat/setup_container.sh
