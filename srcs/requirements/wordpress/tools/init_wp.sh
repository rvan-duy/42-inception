#!/bin/bash

wp core download --path=wpclidemo.dev --allow-root
cd wpclidemo.dev
wp config create --dbname=wpclidemo --dbuser=root --prompt=dbpass --allow-root
wp db create --allow-root
wp core install --url=wpclidemo.dev --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --allow-root

# echo "init_wp.sh -> downloading and setting up"
# wp core download --allow-root

# wp config create --dbname="$DB_NAME" \
#                  --dbuser="$DB_USER" \
#                  --dbpass="$DB_PASS" \
#                  --dbhost="$DB_HOST" \
#                  --locale=ro_RO \
#                  --allow-root


# echo "init_wp.sh -> installing WordPress"
# wp core install --title="rvan-duy - wordpress" \
#                 --admin_user="$WP_ADMIN_NAME" \
#                 --admin_password="$WP_ADMIN_PASS" \
#                 --admin_email="admin@example.com" \
#                 --skip-email \
#                 --url="https://rvan-duy.42.fr/wordpress" \
#                 --allow-root

# echo "init_wp.sh -> creating regular user"
# wp user create $WP_USER_NAME user@example.com \
#                 --user_pass="$WP_USER_PASS" \
#                 --allow-root

exec "$@"
