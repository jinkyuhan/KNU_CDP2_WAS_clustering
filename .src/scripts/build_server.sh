#!/bin/sh

echo "########################################"
echo ""
echo "build_server.sh"
echo ""
echo "########################################"
echo ""

CLUSTER_ROOT=$(git rev-parse --show-toplevel)
app_name=$(cat $CLUSTER_ROOT/.app_config)
port_num=$(cat $CLUSTER_ROOT/.server_config)

APP_DIR=$CLUSTER_ROOT/$app_name
HTTPD_SRC_DIR=$CLUSTER_ROOT/.src/apache_src
TOMCAT_SRC_DIR=$CLUSTER_ROOT/.src/tomcat_src


echo "Setting up your webapp as a clustering member..."
if [ ! -e $APP_DIR ]; then
    echo "Your webapp '$app_name' doesn't exists. Check your webapp's name or restart runserver.sh"
    exit 1
else
    mkdir -p $APP_DIR/WEB-INF
    if [  ! -e $APP_DIR/WEB-INF/web.xml ]; then
        echo "<web-app><distributable /></web-app>" > $APP_DIR/WEB-INF/web.xml
    else 
        if [ "$(sed -n '/<distributable \/>/p' $APP_DIR/WEB-INF/web.xml)" == "" ]; then
            sed -i.old 's/<\/web-app>/<distributable \/><\/web-app>/g' $APP_DIR/WEB-INF/web.xml
            rm $APP_DIR/WEB-INF/web.xml.old
        fi
    fi 
fi

docker_compose_file=$CLUSTER_ROOT/.src/docker-compose.yml
docker_compose_original_file=$CLUSTER_ROOT/.src/docker-compose.yml.origin
echo "Setting up your listening port..."
if [ -e $docker_compose_original_file ]; then 
    rm $docker_compose_file
    mv $docker_compose_original_file $docker_compose_file
fi
sed -i.origin "s/PORT_NUM/${port_num}/g" $docker_compose_file



echo "Strating to build servers for your webapp..."

mkdir -p $TOMCAT_SRC_DIR/webapps/ROOT/
cp -r $APP_DIR/* $TOMCAT_SRC_DIR/webapps/ROOT/ 
cd $CLUSTER_ROOT/.src/ && docker-compose up -d --build

# mkdir -p $TOMCAT_SRC_DIR/webapps/ROOT


