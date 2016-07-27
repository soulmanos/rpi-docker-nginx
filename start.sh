#!/bin/bash

# "/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"
# --link enabled you to link containers together on the same host so they can communicate over ip
# --link inserts the name of the container to be linked into the container you are about to runs /etc/hosts file
# you can then ping e.g. ghost-blog-v1 from inside the container and it'll resolve to that containers ip addr

docker run --name soulmanos-nginx \
    -p 80:80 \
    -p 443:443 \
    -v $PWD/sites-enabled:/etc/nginx/sites-enabled \
    -v $PWD/certs:/etc/nginx/certs \
    -v $PWD/log:/var/log/nginx \
    --link node-led:node-led \
    --link unifi-controller:unifi-controller
    --name rpi-docker-nginx \
    soulmanos/rpi-docker-nginx
