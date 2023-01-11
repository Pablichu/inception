#!/bin/sh

if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then

#Download wordpress
wget http://wordpress.org/latest.tar.gz
tar vxfz latest.tar.gz
rm -rf latest.tar.gz

#Automation of Wordpress connection to db
sed -i "s/database_name_here/$WP_DB_NAME/g" wordpress/wp-config-sample.php
sed -i "s/username_here/$MYSQL_USER/g" wordpress/wp-config-sample.php
sed -i "s/password_here/$MYSQL_PW/g" wordpress/wp-config-sample.php
sed -i "s/localhost/mariadb/g" wordpress/wp-config-sample.php
mv wordpress/wp-config-sample.php wordpress/wp-config.php

mv wordpress /var/www/html

fi

if [ ! -f "/var/www/html/wordpress/wp-content/plugins/object-cache.php" ]; then

#Download & install redis plugin
wget https://downloads.wordpress.org/plugin/redis-cache.2.2.3.zip -P /tmp
unzip /tmp/redis-cache.2.2.3.zip
rm /tmp/redis-cache.2.2.3.zip
cp /tmp/redis-cache/includes/object-cache.php /var/www/html/wordpress/wp-content/
mv /tmp/redis-cache /var/www/html/wordpress/wp-content/plugins

fi

sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf

exec /usr/sbin/php-fpm7 -F