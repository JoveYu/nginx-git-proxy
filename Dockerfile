FROM docker.io/openresty/openresty:bookworm

RUN apt-get update \
 && apt-get install -y cgit fcgiwrap git --no-install-recommends --no-install-suggests \ 
 && echo "user root;" > /etc/nginx/conf.d/nginx.main \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY git-proxy.conf cors-proxy.conf /etc/nginx/conf.d/
COPY cgitrc /etc/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/openresty", "-g", "daemon off;"]

