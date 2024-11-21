CREATE DATABASE wp_database;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';
GRANT ALL PRIVILEGES ON wp_database.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;
