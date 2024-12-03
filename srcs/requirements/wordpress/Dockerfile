FROM debian:bullseye

# Install PHP 8.2 and PHP-FPM
RUN apt update && apt upgrade -y && apt install -y \
    php-fpm

# Start PHP-FPM
CMD ["php-fpm", "-F"]