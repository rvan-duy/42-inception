#!/bin/bash

# Check if the /var/run/mysqld directory exists
if [ ! -d "/var/run/mysqld" ]; then
    echo "Creating /var/run/mysqld directory and setting ownership to mysql:root"
    mkdir /var/run/mysqld
    chown -R mysql:root /var/run/mysqld
else
    echo "/var/run/mysqld directory already exists, skipping creation and ownership change"
fi

# Sets the bind address for mariadb
echo "Setting bind-address to the address of container mariadb"
sed -i "s/bind-address.*/bind-address = mariadb/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Start daemon
echo "Starting MariaDB service in the background"
/usr/bin/mysqld_safe &

# Wait until done
echo "Waiting for MariaDB service to be fully started"
RET=1
# RET will be 0 if the MariaDB service succesfully started
while [[ RET -ne 0 ]]; do
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "MariaDB is now fully started"

exec "$@"