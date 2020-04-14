FROM httpd:2.4

ENV DEBIAN_FRONTEND noninteractive

# Copy Local's config file into Container
COPY ./conf/* /usr/local/apache2/conf/


# Install Dependencies
RUN apt-get update && apt-get install -y gcc cmake wget
# RUN apt-get -y upgrade --no-install-recommends apt-utils


# install mod_jk
COPY ./tomcat-connectors-1.2.48-src.tar.gz ./tomcat-connectors-1.2.48-src.tar.gz
RUN tar zxvf ./tomcat-connectors-1.2.48-src.tar.gz && \ 
    cd ./tomcat-connectors-1.2.48-src/native/ && \
    ./configure --with-apxs=/usr/local/apache2/bin/apxs && \
    make && \
    make install

