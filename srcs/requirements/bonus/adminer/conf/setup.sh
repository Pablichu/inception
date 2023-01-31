#!/bin/sh

if [ ! -f "/var/www/html/index.php" ]; then

wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
mv adminer-4.8.1.php index.php
mv index.php /var/www/html/index.php

fi

sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf

exec /usr/sbin/php-fpm7 -F