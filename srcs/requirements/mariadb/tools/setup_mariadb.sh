#!/bin/bash

echo "setup_mariadb.sh -> Installing MariaDB database"
mysql_install_db    --user=mysql \
                    --datadir=/var/lib/mysql \
                    --skip-test-database

{
    echo "FLUSH PRIVILEGES;"

    # Create database
    echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

    # Create database user
    echo "CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASS';"
    echo "GRANT ALL ON *.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASS';"

    # Making sure permissions are applied
    echo "FLUSH PRIVILEGES;"

} | mariadbd --bootstrap

exec "$@"