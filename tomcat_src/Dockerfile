FROM tomcat:9.0

RUN cd /etc/apt && \
    sed -i 's/deb.debian.org/ftp.kr.debian.org/g' sources.list && \
    apt-get update
#     apt-get -y upgrade

# Copy Local's config file into Container
COPY ./conf/server.xml /usr/local/tomcat/conf/server.xml
COPY ./conf/web.xml /usr/local/tomcat/conf/web.xml

# Replace webapps directory with local contents
RUN rm -rf /usr/local/tomcat/webapps && \
    mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps && \
    rm -rf /usr/local/tomcat/webapps/ROOT/*
COPY ./webcontents/*.jsp /usr/local/tomcat/webapps/ROOT/
COPY ./webcontents/WEB-INF /usr/local/tomcat/webapps/ROOT/WEB-INF
COPY ./webcontents/assets /usr/local/tomcat/webapps/ROOT/assets

# Replace "WORKER_NAME" in server.xml with $workername
CMD sed -i "s/WORKER_NAME/$WORKER_NAME/g" /usr/local/tomcat/conf/server.xml && \
    catalina.sh run
