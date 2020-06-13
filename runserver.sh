#!/bin/bash
echo "runserver.sh"

#Check Installed Docker
IS_DOCKER="`docker -v`"
IS_DKCP="`docker-compose -v`"

if [ ${IS_DOCKER:0:6} == "Docker" ]; then
    echo "Docker ----------- ok"
else
    echo "docker is not installed, install docker first plz"
    exit 1
fi

if [ ${IS_DKCP:0:15} == "docker-compose" ]; then
    echo "Docker-compose --- ok"
else
    echo "docker-compose is not installed, install docker-compose first plz"
    exit 1
fi

#Check Run Server
if [ "$(docker ps | grep server)" = "" ]; then
	echo "server is not run"
else	
	sh ./quitserver.sh
fi

#Start config.sh
sh ./src/scripts/config.sh

#Start build_server.sh
sh ./src/scripts/build_server.sh
