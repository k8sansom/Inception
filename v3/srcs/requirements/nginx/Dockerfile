FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Copy Nginx config and SSL certificates
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./ssl /etc/nginx/ssl

CMD ["nginx", "-g", "daemon off;"]

