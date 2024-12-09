FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Generate SSL certificates during build
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

# Copy Nginx config and SSL certificates
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./ssl /etc/nginx/ssl

CMD ["nginx", "-g", "daemon off;"]

