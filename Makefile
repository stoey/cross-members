.PHONY: all push clean test docs ubuntu-%

.SUFFIXES:

.SECONDARY:

PACKAGEFILE=dist/cross-members.tar.gz
DOCKER_COMPOSE_FILE=docker-compose.yml
DOCKER_COMPOSE=docker-compose -f $(DOCKER_COMPOSE_FILE)
DOCKER_IMAGE_DEPS=$(DOCKER_COMPOSE_FILE) $(PACKAGEFILE) Dockerfile install
SRC_PREFIX=cross-members
COMMAND_PREFIX=$(SRC_PREFIX)/share/cross-members/ubuntu/

EXECUTABLE=$(SRC_PREFIX)/bin/cm
COMMANDS=$(shell find $(COMMAND_PREFIX) -type f -executable)

DOCS=doc/commands.md

all: build/logs/all

push: all
	$(DOCKER_COMPOSE) push

clean:
	-rm -f $(DOCKER_COMPOSE_FILE) $(PACKAGEFILE) $(DOCS) build/logs/*

test: all
	make -C test

ubuntu-%: build/logs/ubuntu-%


docs: $(DOCS)

$(DOCKER_COMPOSE_FILE): build/generate_docker_compose.py
	python3 build/generate_docker_compose.py > $@

build/logs/all: $(DOCKER_IMAGE_DEPS) 
	$(DOCKER_COMPOSE) build | tee $@

build/logs/ubuntu-%: $(DOCKER_IMAGE_DEPS)
	$(DOCKER_COMPOSE) build $(@F) | tee $@

$(PACKAGEFILE): install $(EXECUTABLE) $(COMMANDS)
	tar -cvzf $@ install cross-members

doc/%.md: build/generate_doc build/logs/ubuntu-latest build/doc/% build/doc/%-header.md build/doc/%-footer.md  
	build/generate_doc $*

