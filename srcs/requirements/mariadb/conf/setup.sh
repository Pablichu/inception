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

sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/etc/init.d/mariadb setup
/etc/init.d/mariadb start

# Automate automate-mysql_secure_installation
# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('CHANGEME') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE test"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param


#Creating & adding wordpress to database
#mysql -u root -p
#
#Now, Create a database for the WordPress installation. In this case, we'll create a database named dbwordpress and off-course you can change the name.
#
#CREATE DATABASE dbwordpress;
#
#Create a new user and set the password. Use your own and unique password here.
#
#CREATE USER wpuser@localhost IDENTIFIED BY 'wpP455w0rd';
#
#Now grant the user full access the database.
#
#GRANT ALL PRIVILEGES ON dbwordpress.* TO wpuser@localhost ;
#
#Refresh the database tables and exit from MariaDB.
#
#FLUSH PRIVILEGES;
#
#exit;


#Allow 
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf