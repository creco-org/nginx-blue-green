#!/bin/sh

. ~/.bash_profile

docker ps -a | grep local-http:blue | awk '{ print $1 }' | xargs docker start

docker ps -a | grep nginx-local | awk '{ print $1 }' | xargs docker start
