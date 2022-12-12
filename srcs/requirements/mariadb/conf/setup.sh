#!/bin/sh
#Create wordpress database
readonly DB_CREATE="CREATE DATABASE $WP_DB_NAME;
CREATE USER $MYSQL_USER@localhost IDENTIFIED BY $MYSQL_PW;
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO $MYSQL_USER@localhost ;
FLUSH PRIVILEGES;
EXIT;"

# Automate automate-mysql_secure_installation
readonly MYSQL_SECURE="UPDATE mysql.user SET Password = PASSWORD($MYSQL_ROOT_PW) WHERE User = 'root';DROP USER ''@'localhost';DROP USER ''@'$(hostname)';DROP DATABASE test;FLUSH PRIVILEGES;EXIT;"

if [ ! -d "/run/mysql" ]; then
    mkdir -p "/run/mysql"
fi
chown -R mysql:mysql "/run/mysql"

if [ ! -d "var/lib/mysql/$WP_DB_NAME" ]; then
    if [ ! -d "var/lib/mysql" ]; then
    echo "Cabroooon"
        mkdir -p "var/lib/mysql"
    fi
    chown -R mysql:mysql "/var/lib/mysql"
    mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null

    #echo "$DB_CREATE"
    #echo "$MYSQL_SECURE"

    mysql -u root -p -e "$DB_CREATE"
    #mysql -u root -p -e "$MYSQL_SECURE"
else
    chown mysql:mysql -R /var/lib/mysqld
fi

#Allow 
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

#rm /tmp/setup.sh
exec /usr/bin/mysqld --user=mysql --console --bind-address=0.0.0.0