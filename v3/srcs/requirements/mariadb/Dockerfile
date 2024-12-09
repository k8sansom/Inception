FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Copy initialization scripts
COPY ./conf/init.sql /etc/mysql/init.sql
COPY ./conf/run.sh /run.sh

RUN chmod +x /run.sh

CMD ["./run.sh"]
