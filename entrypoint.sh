#!/bin/bash
fcgiwrap -s unix:/run/fcgiwrap.socket > /dev/null 2>&1 &
sed -i "s/__NGINX_GIT_DOMAIN__/${NGINX_GIT_DOMAIN}/g" /etc/nginx/conf.d/*.conf
sed -i "s/__NGINX_CORS_DOMAIN__/${NGINX_CORS_DOMAIN}/g" /etc/nginx/conf.d/*.conf
exec "$@"
