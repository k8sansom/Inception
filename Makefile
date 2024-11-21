.PHONY: all build up down clean restart

all: build up

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

clean: down
	docker volume rm $(docker volume ls -q | grep wp)

restart: down up
