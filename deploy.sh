#!/bin/sh

. ~/.bash_profile

# TARGET 구하기

CHECK=$(docker ps | grep blue-app)
TARGET_TYPE=$([[ $CHECK != "" ]] && echo "green-app" || echo "blue-app")

# TARGET 띄우기
cd ./docker/web
docker build -t local-http:$TARGET_TYPE .
docker create --name $TARGET_TYPE --network bridge --env=HOST_NAME=$TARGET_TYPE local-http:$TARGET_TYPE
cd -
docker start $(docker ps -a | grep local-http:$TARGET_TYPE | awk '{ print $1 }')
