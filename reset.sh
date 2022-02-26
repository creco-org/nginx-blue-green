#!/bin/sh

. ~/.bash_profile

# Stop All Docker Containers
docker kill $(docker ps -q)
# Remove All Docker Containers
docker rm $(docker ps -a -q)
# Remove All Docker Images
docker rmi $(docker images -q)
