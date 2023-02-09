#!/bin/sh

#if [ ! -f "/var/www/html/static" ]; then
#
#mkdir /var/www/html
#
#fi

if [ ! -f "/var/www/html/static/index.html" ]; then

mkdir /var/www/html/static
mv /tmp/* /var/www/html/static

fi

exec tail -F /dev/null