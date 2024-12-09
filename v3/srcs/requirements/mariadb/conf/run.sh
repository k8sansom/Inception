#!/bin/bash

# Initialize the MariaDB database
mysqld --initialize-insecure --user=mysql

# Start MariaDB service
mysqld_safe
