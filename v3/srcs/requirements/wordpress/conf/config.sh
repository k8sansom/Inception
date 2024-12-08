#!/bin/bash

# Download WP-CLI if not already present
if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

# Set up WordPress
cd /var/www/html

if [ ! -f wp-config.php ]; then
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
    wp core install --url=localhost --title=inception --admin_user=admin_user --admin_password=admin_password --admin_email=admin@admin.com --allow-root
fi

# Start PHP-FPM
php-fpm7.4 -F
