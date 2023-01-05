FROM debian:stable

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    php7.4-fpm \
    php7.4-mysqli \
    php7.4-opcache \
    php7.4-gd \
    php7.4-xml \
    php7.4-curl \
    php7.4-zip

# Download WordPress
RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN mkdir -p /var/www/wordpress
RUN tar xzf /tmp/wordpress.tar.gz -C /var/www/
RUN rm /tmp/wordpress.tar.gz
RUN mkdir -p run/php

# Copy WordPress configuration file
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

# Set WordPress directory as working directory
WORKDIR /var/www/wordpress

# Expose the port used by PHP-FPM
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4"]
