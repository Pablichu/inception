#!/bin/sh

#if [ ! -f wp-config.php]
wget http://wordpress.org/latest.tar.gz
tar vxfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

tail -f /dev/null
#/usr/sbin/php-fpm7.3 -F