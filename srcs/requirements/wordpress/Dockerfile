FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		php7 \
		php7-fpm \
		php7-json \
		php7-curl \
		php7-opcache \
		php7-mysqli \
		php7-dom \
		php7-mbstring \
		php7-openssl
		#redis

RUN apk update && apk upgrade && apk add --no-cache \
		wget \
		tar;

COPY ./conf/setup.sh setup.sh

ENTRYPOINT [ "sh", "setup.sh" ]
