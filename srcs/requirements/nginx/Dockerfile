FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl && apt-get clean

# Generate self-signed certificates
RUN mkdir -p /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/certs/localhost.key \
    -out /etc/ssl/certs/localhost.crt \
    -subj "/CN=localhost"

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]