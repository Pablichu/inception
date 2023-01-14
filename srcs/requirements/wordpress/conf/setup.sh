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
dos2unix wordpress/wp-config-sample.php
mv wordpress/wp-config-sample.php wordpress/wp-config.php

mv wordpress /var/www/html

fi

if [ ! -f "/var/www/html/wordpress/wp-content/plugins/object-cache.php" ]; then

#Download & install redis plugin
wget https://downloads.wordpress.org/plugin/redis-cache.2.2.3.zip
unzip redis-cache.2.2.3.zip
rm redis-cache.2.2.3.zip

chown -R nobody:nobody redis-cache
cp redis-cache/includes/object-cache.php /var/www/html/wordpress/wp-content/
mv redis-cache /var/www/html/wordpress/wp-content/plugins

sed -i "1 a define( 'WP_CACHE_KEY_SALT', 'pmira-pe.42.fr' );" /var/www/html/wordpress/wp-config.php
sed -i "2 a define( 'WP_REDIS_HOST', 'redis' );" /var/www/html/wordpress/wp-config.php

fi

sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf

exec /usr/sbin/php-fpm7 -F