.PHONY: all

DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_COMPOSE=docker-compose -f $(DOCKER_COMPOSE_FILE)

all: $(DOCKER_COMPOSE_FILE)
	$(DOCKER_COMPOSE) up --build


$(DOCKER_COMPOSE_FILE): ../build/generate_docker_compose.py
	python3 ../build/generate_docker_compose.py cross-members-test > $@
