#!/bin/sh

if [ ! -f "/var/www/html/static/index.html" ]; then

mkdir /var/www/html/static
mv /tmp/* /var/www/html/static

elif [ -f "/tmp/index.html" ]; then

rm -rf /var/www/html/static
mv /tmp/* /var/www/html/static/*

fi

exec tail -F /dev/null