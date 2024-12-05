# Use debian:bullseye as the base image
FROM debian:bullseye

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Install PHP 7.3 (or 7.4, 8.0 depending on availability), mariadb-client, curl
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    mariadb-client \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Copy the PHP-FPM pool configuration file
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Download and extract the latest WordPress
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www && tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

# Install WP-CLI (WordPress Command Line Interface)
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN chmod +x /usr/bin/wp

# Ensure the /run/php directory exists (required for PHP-FPM)
RUN mkdir /run/php

# Copy the config script and set execution permissions
COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

# Set the default command to run the config script
CMD ["bash", "/var/www/wordpress/config.sh"]
