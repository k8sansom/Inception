NAME := inception

wp_volume=/home/${USER}/data/wordpress
mariadb_volume=/home/${USER}/data/mariadb

all: ${NAME}

${NAME}:
	mkdir -p $(wp_volume)
	mkdir -p $(mariadb_volume)
	docker compose -f ./srcs/docker-compose.yml up --build 

up:
	mkdir -p $(wp_volume)
	mkdir -p $(mariadb_volume)
	docker compose -f ./srcs/docker-compose.yml up -d --build 

down:
	docker compose -f ./srcs/docker-compose.yml down

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

restart: down up

logs:
	docker compose -f ./srcs/docker-compose.yml logs

ps:
	docker compose -f ./srcs/docker-compose.yml ps

clean:
	@docker-compose down
	@docker image prune -f
	@docker container prune -f
	@docker network prune -f
	@docker system prune -af

fclean: clean
	@docker volume prune -af

re: fclean ${NAME}

.PHONY: all up down restart logs ps build clean fclean re
