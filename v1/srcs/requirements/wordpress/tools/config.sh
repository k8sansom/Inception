#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

trap "exit" TERM

# Ensure the database is ready
echo "Waiting for database to be ready..."
until mysqladmin ping -h"$MYSQL_HOSTNAME" --silent; do
    sleep 2
done
echo "Database is ready."

WP_PATH="/var/www/wordpress"

# Ensure the WordPress path exists
if [ ! -d "$WP_PATH" ]; then
    echo "WordPress directory not found. Exiting..."
    exit 1
fi

# Configure WordPress
echo "Creating wp-config.php..."
wp config create --allow-root \
                --dbname=$MYSQL_DATABASE \
                --dbuser=$(</run/secrets/mariadb_user) \
                --dbpass=$(</run/secrets/mariadb_pass) \
                --dbhost=$MYSQL_HOSTNAME:3306 \
                --path=$WP_PATH

# Install WordPress
echo "Installing WordPress..."
wp core install --allow-root \
                --url=$DOMAIN_NAME \
                --title='inception' \
                --admin_user=$(</run/secrets/wp_admin) \
                --admin_password=$(</run/secrets/wp_admin_pass) \
                --admin_email='katesansomstudio@gmail.com' \
                --skip-email \
                --path=$WP_PATH

# Create additional user
echo "Creating WordPress user..."
wp user create --allow-root \
                $(</run/secrets/wp_user) \
                katesansomstudio@gmail.com \
                --user_pass=$(</run/secrets/wp_user_pass) \
                --path=$WP_PATH

# Ensure the PHP directory exists
directory="/run/php"
mkdir -p $directory
echo "Directory $directory ensured."

# Launch PHP
echo "Starting PHP-FPM..."
exec /usr/sbin/php-fpm7.4 -F
