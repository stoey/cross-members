.PHONY: all push clean test

PACKAGEFILE=dist/cross-members.tar.gz
DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_COMPOSE=docker-compose -f $(DOCKER_COMPOSE_FILE)


all: $(DOCKER_COMPOSE_FILE) $(PACKAGEFILE) Dockerfile install
	$(DOCKER_COMPOSE) build

push: all
	$(DOCKER_COMPOSE) push

clean:
	rm -f $(DOCKER_COMPOSE_FILE) $(PACKAGEFILE)

test: all
	make -C test


$(DOCKER_COMPOSE_FILE): build/generate_docker_compose.py
	python3 build/generate_docker_compose.py > $@

$(PACKAGEFILE): install cross-members/*
	tar -cvzf $@ install cross-members
