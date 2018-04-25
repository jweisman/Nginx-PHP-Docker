FROM php:7-fpm-alpine

RUN apk update && apk add nginx
RUN adduser -D -g 'www' www

ENV DOCROOT=/www

RUN mkdir $DOCROOT /run/nginx \
	&& chmod -R a+w /run/nginx /var/log /etc/nginx \
	&& chmod -R a+wx /var/tmp/nginx /var/lib/nginx 

WORKDIR /tmp

COPY nginx.conf /etc/nginx/
COPY start.sh /
RUN chmod a+x /start.sh

CMD ["/start.sh"]
