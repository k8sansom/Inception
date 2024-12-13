#!/bin/bash

ft_wait() {
  echo "Waiting for MariaDB to be ready..."
  until mariadb -u root -p$(<"/run/secrets/db_root_password") -e "SELECT 1;" >/dev/null 2>&1; do
    sleep 1
  done
  echo "MariaDB is ready."
}

echo "Start MariaDB service"
service mariadb start

ft_wait

echo "Creating database"
mariadb -u root -p$(<"/run/secrets/db_root_password") -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

echo "Creating user"
mariadb -u root -p$(<"/run/secrets/db_root_password") -e "CREATE USER IF NOT EXISTS \`$(<"/run/secrets/db_user")\`@'localhost' IDENTIFIED BY '$(<"/run/secrets/db_password")';"

echo "Granting privileges"
mariadb -u root -p$(<"/run/secrets/db_root_password") -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`$(<"/run/secrets/db_user")\`@'%' IDENTIFIED BY '$(<"/run/secrets/db_password")';"

echo "Setting root password"
mariadb -u root -p$(<"/run/secrets/db_root_password") -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$(<"/run/secrets/db_root_password")';"

echo "Flushing privileges"
mariadb -u root -p$(<"/run/secrets/db_root_password") -e "FLUSH PRIVILEGES;"

echo "Stopping MariaDB to restart in safe mode"
mysqladmin -u root -p$(<"/run/secrets/db_root_password") shutdown

# Wait for MariaDB to shut down
echo "Waiting for MariaDB to shut down..."
while pgrep mariadbd >/dev/null; do
  sleep 1
done
echo "MariaDB has shut down."

echo "Start MariaDB in safe mode"
exec mariadbd-safe
