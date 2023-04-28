FROM debian:stable

RUN apt-get update && apt-get upgrade -y
RUN apt-get install php-fpm php-mysql curl -y

# Download WP-CLI and move it to /usr/local/bin so we can use `wp`
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
     && chmod +x wp-cli.phar \
     && mv wp-cli.phar /usr/local/bin/wp

# Set listening port to 

# RUN sed 's/;clear_env = no/clear_env = no/' -i /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

COPY tools/init_wp.sh /var/www/
RUN chmod +x /var/www/init_wp.sh
ENTRYPOINT [ "/var/www/init_wp.sh" ]

CMD [ "php-fpm7.4", "-F" ]
