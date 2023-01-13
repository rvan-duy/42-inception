FROM debian:stable

# https://www.inmotionhosting.com/support/edu/wordpress/install-wordpress-debian-10/

RUN apt-get update && apt-get upgrade -y
RUN apt-get install php-fpm php-mysql -y
RUN apt-get install wget -y

RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN mkdir -p /var/www/html
RUN tar xzf /tmp/wordpress.tar.gz -C /var/www/html
RUN rm /tmp/wordpress.tar.gz

EXPOSE 9000

CMD [ "tail", "-f" ]
