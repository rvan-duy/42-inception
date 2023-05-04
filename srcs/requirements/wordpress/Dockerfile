FROM debian:stable
EXPOSE 9000

# Update and upgrade packages, then install packages
RUN apt-get update && apt-get upgrade -y \
     && apt-get install -y \
     php-mysql \
     php-fpm \
     curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
     && chmod +x wp-cli.phar \
     && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

RUN sed -i "s/listen.*/listen = wordpress:9000/" /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/init_wp.sh /var/www/
RUN chmod +x /var/www/init_wp.sh
ENTRYPOINT [ "/var/www/init_wp.sh" ]

CMD [ "php-fpm7.4", "-F" ]
