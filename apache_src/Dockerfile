FROM httpd:2.4
LABEL maintainer="cheesecat47@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Copy Local's config file into Container
COPY ./conf/httpd.conf /usr/local/apache2/conf/httpd.conf

# Install Dependencies
RUN apt-get update
RUN apt-get -y upgrade --no-install-recommends apt-utils
RUN apt-get install -y gcc
RUN apt-get install -y cmake
RUN apt-get install -y wget

# install mod_jk
RUN wget -c http://apache.tt.co.kr/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz
RUN tar zxvf tomcat-connector*
RUN rm tomcat-connectors-1.2.48-src.tar.gz
RUN cd ./tomcat-connectors-1.2.48-src/native/ && \
    ./configure --with-apxs=/usr/local/apache2/bin/apxs && \
    make && \
    make install