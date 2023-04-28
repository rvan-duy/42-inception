FROM debian:stable


RUN apt-get update && apt-get upgrade -y
RUN apt-get install php7.3 php-fpm php-mysql mariadb-client curl -y

ADD tools/entry.sh /var/www/
RUN chmod +x /var/www/entry.sh

# Config wordpress settings with WP-CLI or wp-config.php

# Download WP-CLI and move it to /usr/local/bin so we can use `wp`
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
     && chmod +x wp-cli.phar \
     && mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT [ "/var/www/entry.sh" ]

EXPOSE 9000

CMD [ "tail", "-f" ]
