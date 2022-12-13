#!/bin/sh

#if [ ! -f wp-config.php]
pwd
wget http://wordpress.org/latest.tar.gz
tar -xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

/usr/sbin/php-fpm7.3 -F