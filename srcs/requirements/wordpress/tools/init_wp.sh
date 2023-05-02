#!/bin/bash

# wp core download --path=wpclidemo.dev --allow-root
# cd wpclidemo.dev
# wp config create --dbname=wpclidemo --dbuser=root --prompt=dbpass --allow-root
# wp db create --allow-root
# wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --allow-root

echo "init_wp.sh -> downloading and setting up"
wp core download --path="/var/www/html" --allow-root

wp config create --path="/var/www/html" \
                 --dbname="$DB_NAME" \
                 --dbuser="$DB_USER" \
                 --dbpass="$DB_PASS" \
                 --dbhost="$DB_HOST" \
                 --allow-root

echo "init_wp.sh -> installing WordPress"
wp core install --path="/var/www/html" \
                --title="rvan-duy - wordpress" \
                --admin_user="$WP_ADMIN_NAME" \
                --admin_password="$WP_ADMIN_PASS" \
                --admin_email="admin@example.com" \
                --skip-email \
                --url="https://rvan-duy.42.fr/" \
                --allow-root

echo "init_wp.sh -> creating regular user"
wp user create "$WP_USER_NAME"s user@example.com \
                --path="/var/www/html" \
                --user_pass="$WP_USER_PASS" \
                --allow-root

exec "$@"
