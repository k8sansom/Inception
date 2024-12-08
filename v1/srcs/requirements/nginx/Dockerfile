FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	nginx
	# openssl && \
	# rm -rf /var/lib/apt/lists/*
# 
COPY ./conf/nginx.conf /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
