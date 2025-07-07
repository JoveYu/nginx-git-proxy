# nginx-git-proxy

git cache proxy server with nginx and cgit

# Usage 

Docker Compose:

```
services:
  git:
    container_name: git
    hostname: git
    image: ghcr.io/joveyu/nginx-git-proxy:master
    restart: always
    environment:
    - NGINX_GIT_DOMAIN=git.yg.lan
    - NGINX_CORS_DOMAIN=cors.yg.lan
    volumes:
    - ./data:/srv/git
```
