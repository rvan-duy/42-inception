FROM debian:stable

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld
COPY tools/setup_mariadb.sh /usr/bin/
RUN chmod +x /usr/bin/setup_mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "setup_mariadb.sh" ]

# Launch mariadb server
CMD [ "mariadbd" ]
