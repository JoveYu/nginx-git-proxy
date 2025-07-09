#!/bin/bash

git daemon --inetd --export-all --base-path=/srv/git &

[ -e /run/fcgiwrap.socket ] && rm -f /run/fcgiwrap.socket
fcgiwrap -s unix:/run/fcgiwrap.socket > /dev/null 2>&1 &

sed -i "s/__NGINX_GIT_DOMAIN__/${NGINX_GIT_DOMAIN}/g" /etc/nginx/conf.d/*.conf
sed -i "s/__NGINX_CORS_DOMAIN__/${NGINX_CORS_DOMAIN}/g" /etc/nginx/conf.d/*.conf

exec "$@"
