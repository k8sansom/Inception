#!/bin/bash
trap "exit" TERM

sleep 20

cd /var/

wp config create --allow-root \
                --dbname=$MYSQL_DATABASE \
				--dbuser=$(<"/run/secrets/mariadb_user") \
                --dbpass=$(<"/run/secrets/mariadb_pass") \
				--dbhost=$MYSQL_HOSTNAME:3306 \
                --path="/var/www/wordpress"

echo "wp core install......."
wp core install --allow-root \
            --url=$DOMAIN_NAME \
            --title='inception' \
            --admin_user=$(<"/run/secrets/wp_admin") \
            --admin_password=$(<"/run/secrets/wp_admin_pass") \
            --admin_email='ksansom@42berlin.com' \
            --skip-email \
            --path="/var/www/wordpress"

echo "wp user create........"
wp user create --allow-root \
            $(<"/run/secrets/wp_user") katesansomstudio@gmail.com \
			--user_pass=$(<"/run/secrets/wp_user_pass") \
            --path="/var/www/wordpress"

directory="/run/php"

if [ ! -d "$directory" ]; then
    mkdir -p $directory
    echo "Directory $directory created successfully."
else
    echo "Directory $directory already exists."
fi

echo "launch php..."

/usr/sbin/php-fpm7.4 -F
