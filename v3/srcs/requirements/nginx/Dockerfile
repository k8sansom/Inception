FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Create the ssl directory inside the container
RUN mkdir -p /etc/nginx/ssl

# Copy the ssl directory into the container
COPY ./ssl /etc/nginx/ssl

# Ensure correct permissions for the SSL files
RUN chmod 600 /etc/nginx/ssl/nginx.key && \
    chmod 644 /etc/nginx/ssl/nginx.crt

# Copy Nginx configuration
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]


