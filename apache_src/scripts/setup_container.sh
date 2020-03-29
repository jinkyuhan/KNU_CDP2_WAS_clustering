#!/bin/sh

echo "Setup apache container"
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' '#' # Print a line

# install mod_jk
wget -c http://apache.tt.co.kr/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.48-src.tar.gz
tar zxvf tomcat-connector*
cd tomcat-connectors-1.2.48-src/native/
chmod +x buildconf.sh
./configure --with-apxs=/usr/local/apache2/bin/apxs
make
make install
# chcon -u system_u -r object_r -t httpd_modules_t /usr/local/apache2/modules/mod_jk.so
