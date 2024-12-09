FROM debian:bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set up WordPress
WORKDIR /var/www/html

RUN mkdir -p /run/php && \
    rm -rf /var/www/html/*

# Copy config and setup files
COPY ./conf/config.sh /config.sh
RUN chmod +x /config.sh

# Set the working directory to WordPress's root directory
WORKDIR /var/www/html

# Run the configuration script
CMD ["/config.sh"]


