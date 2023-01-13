#!/bin/bash

echo "Entering setup_mariadb.sh"

# echo "Installing MariaDB database"
# mysql_install_db    --user=mysql \
#                     --datadir=/var/lib/mysql \
#                     --skip-test-database

service mariadb start
sleep 2

# Create database
mariadb -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Create Admin user
mariadb -e "CREATE USER IF NOT EXISTS $ADMIN_NAME@localhost IDENTIFIED BY '$ADMIN_PASS';"
mariadb -e "GRANT ALL ON *.* TO $ADMIN_NAME@localhost IDENTIFIED BY '$ADMIN_PASS';"

# Create Regular user
mariadb -e "CREATE USER $USER_NAME@localhost IDENTIFIED BY '$USER_PASS';"
mariadb -e "GRANT USAGE ON *.* TO $USER_NAME@localhost IDENTIFIED BY '$USER_PASS';"

# Making sure permissions are applied
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "Leaving setup_mariadb.sh"

exec "$@"