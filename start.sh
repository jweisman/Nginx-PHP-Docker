#!/bin/sh

# Credit to https://github.com/ttskch/docker-nginx-php-fpm-heroku/blob/master/start.sh

# set port number to be listened as $PORT or 8888
sed -i -E "s/ENV_PORT/${PORT:-8080}/" /etc/nginx/nginx.conf

# "/var/tmp/nginx" owned by "nginx" user is unusable on heroku dyno so re-create on runtime
mkdir /var/tmp/nginx

php-fpm -D
nginx -g "daemon off;"