#!/bin/sh

. ~/.bash_profile

docker start $(docker ps -a | grep local-http:blue | awk '{ print $1 }')

docker start $(docker ps -a | grep nginx-local | awk '{ print $1 }')
