# Directories
SRCS := srcs
DOCKER := docker
DOCKER_COMPOSE := $(DOCKER) compose
DOCKER_REMOVE_IMAGE := $(DOCKER) rmi
DOCKER_REMOVE_CONTAINER := $(DOCKER) rm
DOCKER_IMAGE := $(DOCKER) image
COMPOSE_FILE := $(SRCS)/docker-compose.yml
NGINX := nginx:shtanemu
WORDPRESS := wordpress:shtanemu
MARIADB := mariadb:shtanemu

# Phony targets
.PHONY: help up rm

# Help target
help: ## Display available targets with descriptions
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

up: ## Start containers in detached mode
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

down: ## Stop containers
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

stop: ## Pause containers
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

build: ## Build images
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

rm: ## Remove containers and images
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down
	$(DOCKER_REMOVE_IMAGE) $(NGINX)
	$(DOCKER_REMOVE_IMAGE) $(WORDPRESS)
	$(DOCKER_REMOVE_IMAGE) $(MARIADB)

prune: ## Remove unused images
	$(DOCKER_IMAGE) prune
