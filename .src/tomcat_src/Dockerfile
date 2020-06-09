FROM tomcat:9.0

RUN cd /etc/apt && \
    sed -i 's/deb.debian.org/ftp.kr.debian.org/g' sources.list && \
    apt-get update
#     apt-get -y upgrade

# Copy Local's config file into Container
COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml
COPY ./conf/web.xml /usr/local/tomcat/conf/web.xml

# Replace webapps directory with local contents
COPY ./webapps/ /usr/local/tomcat/webapps/

COPY ./scripts/* /usr/local/tomcat/scripts/
RUN /usr/local/tomcat/scripts/java_compile.sh

# Replace "WORKER_NAME" in server.xml with $workername
CMD sed -i "s/WORKER_NAME/$WORKER_NAME/g" /usr/local/tomcat/conf/server.xml && \
    catalina.sh run
