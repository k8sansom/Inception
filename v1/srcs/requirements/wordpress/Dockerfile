# Use debian:bullseye as the base image
FROM debian:bullseye

# Install PHP, MariaDB client, and required tools
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    unzip \
    wget

# Create necessary directories and clean the web root
RUN mkdir /run/php && \
    mkdir -p /var/www/html && \
    rm -rf /var/www/html/*

# Copy PHP-FPM pool configuration
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# Copy the configuration script
COPY ./conf/config.sh /config.sh
RUN chmod +x /config.sh

# Set the default working directory
WORKDIR /var/www/html

# Set the command to run the configuration script
CMD ["/config.sh"]

