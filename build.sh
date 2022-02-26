#!/bin/sh

. ~/.bash_profile

cd ./docker/nginx

docker build -t nginx-local .
docker create --name proxy --network bridge -p 8080:8080 nginx-local

cd -

cd ./docker/web

docker build -t local-http:blue-app .
docker create --name blue-app --network bridge --env=HOST_NAME=blue-app local-http:blue-app

cd -
