FROM debian

RUN apt-get update \
 && apt-get install -y cgit git nginx libnginx-mod-http-lua --no-install-recommends

COPY git-proxy.conf cors-proxy.conf /etc/nginx/conf.d/
COPY cgitrc /etc/

