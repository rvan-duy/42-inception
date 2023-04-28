#!/bin/bash

echo "Entering entry.sh"

wp core download --allow-root
wp core config --dbname="$DATABASE_NAME" --dbuser="$ADMIN_NAME" --dbpass="$ADMIN_PASS" --dbhost="$DB_HOST" --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

echo "Leaving entry.sh"

exec "$@"
