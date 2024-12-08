# Variables
DOCKER_COMPOSE = docker-compose
COMPOSE_FILE = ./srcs/docker-compose.yml
WEB_DIR = ./srcs/web

# Targets
.PHONY: all up build start stop down clean fclean re

# Default target: build and start services
all: build up

# Build services
build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

# Start services in the foreground
up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up

# Start services in detached mode
start:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

# Stop services
stop:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

# Stop and remove containers, networks, and volumes
down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

# Clean up unused Docker resources (containers, images, volumes)
clean:
	docker system prune -af
	docker volume prune -f

# Remove all containers, images, and volumes related to the project
fclean: down
	# Remove all images related to the project if any exist
	@image_ids=$(docker images -q) && [ -n "$$image_ids" ] && docker rmi -f $$image_ids || echo "No images to remove"
	# Remove all unused volumes
	docker volume rm $$(docker volume ls -q) || true
	rm -rf $(WEB_DIR)/*

# Rebuild and restart services
re: fclean all

