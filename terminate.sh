#!/bin/sh

docker-compose down
docker rmi myapache
docker rmi mytomcat