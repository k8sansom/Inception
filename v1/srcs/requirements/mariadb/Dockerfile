FROM debian:bullseye

# Install MariaDB
RUN apt-get update && apt-get install -y \
    mariadb-server

# Ensure proper permissions for database files
RUN chown -R mysql:mysql /var/lib/mysql && \
    chmod 700 /var/lib/mysql

# Copy configuration files and initialization scripts
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/init.sql /etc/mysql/init.sql
COPY ./conf/run.sh /run.sh

# Create required directory for the MySQL socket
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld && chmod +x /run.sh

# Set entrypoint
ENTRYPOINT ["/run.sh"]
