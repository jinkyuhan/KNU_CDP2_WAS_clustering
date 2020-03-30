FROM httpd:2.4
LABEL maintainer="cheesecat47@gmail.com"
# COPY ./webcontents/ /usr/local/apache2/htdocs/

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y net-tools 
RUN apt-get install -y apt-utils

COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./scripts/setup_container.sh /usr/local/apache2/setup_container.sh

# install mod_jk
RUN apt-get install -y gcc
RUN apt-get install -y g++ 
RUN apt-get install -y apache2-dev 
RUN apt-get install -y wget
RUN apt-get install -y libapache2-mod-jk
RUN /bin/sh /usr/local/apache2/setup_container.sh
