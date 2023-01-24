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
	    unzip \
		&& wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
		#&& unzip adminer-4.8.1.php
		# php7-mysql \
		# php-oci8 \
		# php-pdo_oci \
		# php-sqlsrv \
		# php-mssql \

ENTRYPOINT [ "/usr/sbin/php-fpm7 -F" ]