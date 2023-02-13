#!/bin/sh

if [ ! -f "/var/www/html/static/index.html" ]; then

mkdir /var/www/html/static
mv /tmp/* /var/www/html/static

elif [ -f "/tmp/index.html" ]; then

rm -rf /var/www/html/static/*
mv /tmp/* /var/www/html/static

fi

sed -i "s+/assets/+assets/+g" /var/www/html/static/index.html
sed -i "s+/assets/+assets/+g" /var/www/html/static/assets/*.js
sed -i "s+src/assets+assets+g" /var/www/html/static/assets/*.js

exec tail -F /dev/null