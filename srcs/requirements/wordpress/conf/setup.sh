#!/bin/sh

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

adduser -u 82 -D -S -G www-data www-data

wget http://wordpress.org/latest.tar.gz
tar vxfz latest.tar.gz
rm -rf latest.tar.gz

sed -i "s/database_name_here/$WP_DB_NAME/g" wordpress/wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/g" wordpress/wp-config-sample.php
sed -i "s/password_here/$MYSQL_PW/g" wordpress/wp-config-sample.php
sed -i "s/localhost/localhost:3306/g" wordpress/wp-config-sample.php
mv wordpress/wp-config-sample.php wordpress/wp-config.php

mv wordpress /var/www/html
chown www-data:www-data /var/www/html/wordpress

fi

exec /usr/sbin/php-fpm7 -F