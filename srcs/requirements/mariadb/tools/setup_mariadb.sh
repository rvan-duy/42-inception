#!/bin/bash

echo "Entering setup_mariadb.sh"

if [ ! -d /var/lib/mysql/mysql ]; then
    echo "/var/lib/mysql/mysql doesn't exist, running installation"
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

service mariadb start
sleep 2

mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress_database;"
mariadb -e "CREATE USER 'dictator'@localhost IDENTIFIED BY 'secrets';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'dictator'@localhost IDENTIFIED BY 'secrets';"
mariadb -e "CREATE USER 'minion'@localhost IDENTIFIED BY 'secrets';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "Leaving setup_mariadb.sh"

exec "$@"