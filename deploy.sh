#!/bin/sh

. ~/.bash_profile

# TARGET 구하기

CHECK=$(docker ps | grep blue-app)
START_TARGET=$([[ $CHECK != "" ]] && echo "green-app" || echo "blue-app")
DELETE_TARGET=$([[ $CHECK != "" ]] && echo "blue-app" || echo "green-app")

echo "$DELETE_TARGET will be shutdown."
echo "$START_TARGET will be start."

# TARGET 띄우기
cd ./docker/web
docker build -t local-http:$START_TARGET .
docker create --name $START_TARGET --network bridge --env=HOST_NAME=$START_TARGET local-http:$START_TARGET
cd -
docker start $(docker ps -a | grep local-http:$START_TARGET | awk '{ print $1 }')

echo "LOGGING"
CONTAINER=$(docker ps -a | grep proxy | awk '{ print $1 }')
until $(docker exec $CONTAINER curl --output /dev/null --max-time 5 --silent --head --fail http://$START_TARGET:8080); do
  echo "wait http://$START_TARGET:8080"
  sleep 0.5
done
echo "LOGGING"

docker exec $CONTAINER /app/scripts/reload.sh $START_TARGET

docker ps -a
docker kill $(docker ps -a | grep $DELETE_TARGET | awk '{ print $1 }')
docker rm $(docker ps -a | grep $DELETE_TARGET | awk '{ print $1 }')
