# The version of MariaDB in the Alpine repositories behave like
# the MySQL tarball. No graphical tools are included.
# 
# The datadir located at /var/lib/mysql must be owned by the mysql
# user and group.
# 
# Normal initialization of mariadb can be done as follows:
# 
#     -Initialize the main mysql database, and the data dir
# 	    as standardized to /var/lib/mysql by running /etc/init.d/mariadb setup
#     -Start the main service. At this point there will be
# 	    no root password set. /etc/init.d/mariadb start
#     -Secure the database by running mysql_secure_installation
#     -Setup permissions for managing others users and databases
# 
# Configures mysql with a file in "/etc/my.cnf".

#!/bin/sh

chown mysql:mysql /var/lib/mysql

/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

# Automate automate-mysql_secure_installation
# Make sure that NOBODY can access the server without a password
# Kill the anonymous users
# Because our hostname varies we'll use some Bash magic here.
# Kill off the demo database
# Make our changes take effect
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
readonly MYSQL_SECURE="UPDATE mysql.user SET Password = PASSWORD($MYSQL_ROOT_PASSWORD) WHERE User = 'root';
DROP USER ''@'localhost';
DROP USER ''@'$(hostname)';
DROP DATABASE test;
FLUSH PRIVILEGES;"

#Create wordpress database
readonly DB_CREATE="CREATE DATABASE $WP_DB_NAME;
CREATE USER $MYSQL_USER@localhost IDENTIFIED BY $MYSQL_PASSWORD;
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO $MYSQL_USER@localhost ;
FLUSH PRIVILEGES;
EXIT;"

readonly SQL="{MYSQL_SECURE}{DB_CREATE}"

mysql -u root -p -e "$SQL"

#Allow 
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

rm /tmp/setup.sh