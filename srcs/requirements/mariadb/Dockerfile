FROM debian:buster
EXPOSE 3306

# Update and upgrade packages, then install packages
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    mariadb-server

# Copy the setup_mariadb.sh script to /usr/bin/ and make it executable
COPY tools/setup_mariadb.sh /usr/bin/
RUN chmod +x /usr/bin/setup_mariadb.sh

# Create the /var/run/mysqld directory and set the ownership to mysql:root
#   ? Daemon is a background process that runs without user interaction
RUN mkdir -p /var/run/mysqld; \
    chown -R mysql:root /var/run/mysqld

# Set the bind-address in the MariaDB configuration file to "mariadb"
RUN sed -i "s/bind-address.*/bind-address = mariadb/" /etc/mysql/mariadb.conf.d/50-server.cnf

# Set the entrypoint to the setup_mariadb.sh script
#   ? ENTRYPOINT is ran when the container starts
#   ? Different from CMD
ENTRYPOINT [ "setup_mariadb.sh" ]

# Set the default command to start the MariaDB server daemon
#   ? Will become the argument of ENTRYPOINT
CMD [ "mysqld" ]
