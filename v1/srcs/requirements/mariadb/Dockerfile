FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	mariadb-server

# Ensure proper permissions for database files
RUN chown -R mysql:mysql /var/lib/mysql && \
    chmod 700 /var/lib/mysql


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./conf/init.sql /etc/mysql/init.sql
COPY ./conf/run.sh .

RUN mkdir /run/mysqld && chmod +x run.sh
CMD ["./run.sh"]