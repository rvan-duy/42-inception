COMPOSE_FILE := srcs/docker-compose.yml

# make build run
# make stop logs

all: build run

build:
	@docker compose -f $(COMPOSE_FILE) build

run:
	@docker compose -f $(COMPOSE_FILE) up -d --remove-orphans

stop:
	@docker compose -f $(COMPOSE_FILE) stop

restart: stop build run

prune:
	docker system prune -a
	rm -rf data/mariadb/*

logs:
	@docker compose -f $(COMPOSE_FILE) logs

logs_follow:
	@docker compose -f $(COMPOSE_FILE) logs -f

.PHONY: all build run stop restart logs prune
