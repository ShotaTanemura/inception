# Directories
SRCS := srcs
DOCKER := docker
DOCKER_COMPOSE := $(DOCKER) compose
DOCKER_REMOVE_IMAGE := $(DOCKER) rmi
DOCKER_REMOVE_CONTAINER := $(DOCKER) rm
COMPOSE_FILE := $(SRCS)/docker-compose.yml
NGINX := nginx:shtanemu

# Phony targets
.PHONY: help up rm

# Help target
help: ## Display available targets with descriptions
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Start containers in detached mode
up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

# Remove containers and images
rm:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down
	$(DOCKER_REMOVE_IMAGE) $(NGINX)
