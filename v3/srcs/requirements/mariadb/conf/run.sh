#!/bin/bash

# Initialize database and start MariaDB server
mysql_install_db
mysqld --user=root --bootstrap --verbose=0 < /etc/mysql/init.sql
exec mysqld
