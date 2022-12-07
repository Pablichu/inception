The version of MariaDB in the Alpine repositories behave like
the MySQL tarball. No graphical tools are included.

The datadir located at /var/lib/mysql must be owned by the mysql
user and group.

Normal initialization of mariadb can be done as follows:

    -Initialize the main mysql database, and the data dir
	as standardized to /var/lib/mysql by running /etc/init.d/mariadb setup
    -Start the main service. At this point there will be
	no root password set. /etc/init.d/mariadb start
    -Secure the database by running mysql_secure_installation
    -Setup permissions for managing others users and databases

#!/bin/sh

chown mysql:mysql /var/lib/mysql
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql_secure_installation