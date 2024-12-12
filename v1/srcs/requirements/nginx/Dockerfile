FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	nginx

# Set proper permissions for /var/www/html to ensure Nginx can access it
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www/html && \
    find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;
	
COPY ./conf/nginx.conf /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
