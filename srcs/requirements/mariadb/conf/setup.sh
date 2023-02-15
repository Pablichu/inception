#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
    mkdir -p "/run/mysqld"
fi
if [ ! -d "var/lib/mysql" ]; then
    mkdir -p "var/lib/mysql"
fi
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

if [ ! -d "var/lib/mysql/$WP_DB_NAME" ]; then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null


	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi

	cat << EOF > $tfile
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PW';
GRANT ALL ON $WP_DB_NAME.* to '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PW';
FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --user=root --bootstrap < $tfile
	rm -f $tfile
fi

#Allow
sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s/skip-networking/#skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld -u root -p$MYSQL_ROOT_PW