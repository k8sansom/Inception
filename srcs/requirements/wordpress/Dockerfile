FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm php-mysql php-curl php-json php-xml php-mbstring wget unzip && \
    apt-get clean

# Download WordPress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.zip && unzip latest.zip && mv wordpress/* . && rm -rf wordpress latest.zip

# Configure PHP-FPM
RUN sed -i 's/;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

CMD ["php-fpm7.4", "-F"]