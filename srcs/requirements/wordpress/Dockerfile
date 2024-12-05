FROM debian:bullseye


RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
	php7.4-fpm

COPY www.conf /etc/php/7.4/fpm/pool.d/.

# Start PHP-FPM
CMD ["php-fpm7.4", "-F", "--fpm-config", "/etc/php/7.4/fpm/php-fpm.conf"]
