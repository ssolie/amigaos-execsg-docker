REPOSITORY := ssolie/execsg-builder
TAG        := latest
VOLUMES    := "${PWD}/code":/opt/code
WORKSPACE  := /opt/code
CONTAINER  := execsg-builder
DOCKERFILE := Dockerfile

.PHONY: help build shell push logs clean

help:
	@echo "build - builds the adtools image"
	@echo "push  - push the adtools image to Docker Hub"
	@echo "shell - starts container based on the adtools image"
	@echo "logs  - display container logs"
	@echo "clean - remove container"

build:
	docker build -f $(DOCKERFILE) -t $(REPOSITORY):$(TAG) .

shell:
	docker run -it --name $(CONTAINER) -v $(VOLUMES) -w $(WORKSPACE) $(REPOSITORY):$(TAG) /bin/bash

push:
	docker push $(REPOSITORY):$(TAG)

logs:
	docker logs $(CONTAINER)

clean:
	-docker rm -f $(CONTAINER)

