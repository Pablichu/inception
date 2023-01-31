FROM alpine:3.15.6

RUN apk update && apk upgrade && apk add --no-cache \
		php7 \
		php7-fpm \
		php7-session \
	    php7-bz2 \
	    php7-mysqli \
	    php7-mysqlnd \
	    php7-pgsql \
	    php7-pdo_pgsql \
	    php7-sqlite3 \
	    php7-pdo_sqlite \
	    php7-zip \
	    sqlite \
		wget \
	    unzip

COPY ./conf/setup.sh setup.sh

ENTRYPOINT [ "sh", "setup.sh" ]