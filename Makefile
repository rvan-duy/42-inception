COMPOSE_FILE := srcs/docker-compose.yml

# make build run
# make stop logs
# make build run logs_follow

all: build run

build:
	@docker compose -f $(COMPOSE_FILE) build

run:
	@docker compose -f $(COMPOSE_FILE) up -d --remove-orphans

stop:
	@docker compose -f $(COMPOSE_FILE) stop

restart: stop build run

prune: stop
	docker system prune -a
	sudo rm -rf /home/rvan-duy/data/mariadb/*
	sudo rm -rf /home/rvan-duy/data/wordpress/*

exec-wp:
	docker exec -it wordpress bash

exec-nginx:
	docker exec -it nginx bash

logs:
	@docker compose -f $(COMPOSE_FILE) logs

logs_follow:
	@docker compose -f $(COMPOSE_FILE) logs -f

.PHONY: all build run stop restart logs prune
