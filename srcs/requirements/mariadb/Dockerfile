FROM debian:stable

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY tools/setup_mariadb.sh /usr/bin/
RUN chmod +x /usr/bin/setup_mariadb.sh
RUN mkdir -p /var/run/mysqld; \
    chown -R mysql:root /var/run/mysqld
RUN sed -i "s/bind-address.*/bind-address = mariadb/" /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "setup_mariadb.sh" ]

CMD [ "mariadbd" ]
