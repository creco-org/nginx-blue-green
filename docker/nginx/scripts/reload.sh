#!/usr/bin/env bash

cd /app/scripts

TEMPLATE=$(cat ./nginx.template)

mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bk

echo "${TEMPLATE//\<\< APP \>\>/$1}" >/etc/nginx/nginx.conf

nginx -s reload
