#!/bin/sh

echo "Setup apache container"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line

# install mod_jk
echo "Install mod_jk.so"
wget -c http://apache.tt.co.kr/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz
tar zxvf tomcat-connector*
rm tomcat-connectors-1.2.48-src.tar.gz
cd tomcat-connectors-1.2.48-src/native/
./configure --with-apxs=/usr/local/apache2/bin/apxs
make
make install
