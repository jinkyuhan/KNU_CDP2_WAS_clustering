FROM tomcat:9.0

RUN apt-get update
RUN apt-get -y upgrade

# Copy Local's config file into Container
COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml
COPY ./conf/web.xml /usr/local/tomcat/conf/web.xml

# Replace webapps directory with local contents
RUN rm -rf /usr/local/tomcat/webapps
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps/ROOT/*
COPY ./webcontents/* /usr/local/tomcat/webapps/ROOT/


