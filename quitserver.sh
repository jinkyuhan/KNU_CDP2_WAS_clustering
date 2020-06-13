#!/bin/bash
echo "quitserver.sh"

#Check Run Server
if [ "$(docker ps | grep server)" = "" ]; then
	echo "server is not run"
else	
	docker stop apache-server
	docker stop tomcat-server1
	docker stop tomcat-server2
fi
