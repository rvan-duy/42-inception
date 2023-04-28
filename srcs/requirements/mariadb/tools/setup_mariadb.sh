#!/bin/bash

echo "Entering setup_mariadb.sh"

echo "Installing MariaDB database"
mysql_install_db    --user=mysql \
                    --datadir=/var/lib/mysql \
                    --skip-test-database

{
    echo "FLUSH PRIVILEGES;"

    # Create database
    echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

    # Create user
    echo "CREATE USER IF NOT EXISTS $ADMIN_NAME@'%' IDENTIFIED BY '$ADMIN_PASS';"
    echo "GRANT ALL ON *.* TO $ADMIN_NAME@'%' IDENTIFIED BY '$ADMIN_PASS';"

    # Making sure permissions are applied
    echo "FLUSH PRIVILEGES;"

} | mariadbd --bootstrap

echo "Leaving setup_mariadb.sh"

exec "$@"