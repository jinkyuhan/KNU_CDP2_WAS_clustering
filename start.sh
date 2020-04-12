#!/bin/sh

if [ ! -f /usr/local/bin/docker ]; then
    echo "docker not exists, install docker first plz"
    exit 1
fi

docker-compose up -d --build 
