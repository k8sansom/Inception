DOCKER_COMPOSE = sudo docker-compose
COMPOSE_FILE = ./srcs/docker-compose.yml

.PHONY: all up build start stop down clean fclean re

all: build up

build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up

start:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

stop:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

clean:
	sudo docker system prune -af
	sudo docker volume prune -f

fclean: down
	@image_ids=$$(sudo docker images -q) && [ -n "$$image_ids" ] && sudo docker rmi -f $$image_ids || echo "No images to remove"
	sudo docker volume rm $$(sudo docker volume ls -q) || true

re: fclean all
