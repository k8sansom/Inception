FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

COPY init.sql /docker-entrypoint-initdb.d/

CMD ["mysqld"]