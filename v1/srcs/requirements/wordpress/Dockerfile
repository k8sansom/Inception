# Use debian:bullseye as the base image
FROM debian:bullseye

# Expose port 9000 for PHP-FPM
# EXPOSE 9000
# 
# Install PHP 7.3 (or 7.4, 8.0 depending on availability), mariadb-client, curl
RUN apt-get update && apt-get install -y \
    php7.4-fpm 
    # php7.4-mysql \
    # mariadb-client \
    # curl && \
    # rm -rf /var/lib/apt/lists/*

RUN mkdir /run/php
# Copy the PHP-FPM pool configuration file
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# Set the default command to run the config script
CMD ["php-fpm7.4", "-F"]
