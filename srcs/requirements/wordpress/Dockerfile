FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		php7 \
		php7-fpm \
		php7-curl \
		php7-opcache \
		php7-mysqli \
		php7-dom \
		php7-mbstring \
		php7-openssl
		#redis

RUN adduser -u 82 -D -S -G www-data www-data; \
	chown www-data:www-data /var/www/html; \
	chmod 777 /var/www/html

RUN apk update && apk upgrade && apk add --no-cache \
		wget \
		tar; \
		mkdir -p /usr/share/webapps/; \
		cd /usr/share/webapps/; \
		wget http://wordpress.org/latest.tar.gz; \
		tar -xzvf latest.tar.gz; \
		rm latest.tar.gz

ENTRYPOINT [ "wp", "server" ]



#COPY wp-config-docker.php /usr/src/wordpress/