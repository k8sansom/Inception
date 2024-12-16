#!/bin/bash

echo "Start MariaDB service"
service mariadb start
sleep 2

echo "Creating database"
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Creating user"
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "CREATE USER IF NOT EXISTS \`$(<"/run/secrets/mariadb_user")\`@'localhost' IDENTIFIED BY '$(<"/run/secrets/mariadb_pass")';"

echo "Granting privileges"
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(<"/run/secrets/mariadb_user")\`@'%' IDENTIFIED BY '$(<"/run/secrets/mariadb_pass")';"

echo "Setting root password"
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(<"/run/secrets/mariadb_root_pass")';"

echo "Flushing privileges"
mariadb -u root -p$(<"/run/secrets/mariadb_root_pass") -e "FLUSH PRIVILEGES;"
sleep 1

echo "Stopping MariaDB to restart in safe mode"
mysqladmin -u root -p$(<"/run/secrets/mariadb_root_pass") shutdown
sleep 2

echo "Start MariaDB in safe mode"
exec mariadbd-safe
